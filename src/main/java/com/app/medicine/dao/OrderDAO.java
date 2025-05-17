package com.app.medicine.dao;

import com.app.medicine.model.Order;
import com.app.medicine.util.FileUtil;
import com.app.medicine.util.OrderUtil;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class OrderDAO {
    private static final String FILE_PATH = "data/orders.txt";

    public static void add(Order order) {
        List<Order> orders = getAll();
        orders.add(order);
        OrderUtil.enqueue(order); // Add to processing queue
        saveAll(orders);
    }

    public static List<Order> getAll() {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        List<Order> orders = new ArrayList<>();
        for (String line : lines) {
            orders.add(Order.fromFileString(line));
        }
        return orders;
    }

    public static void update(Order updatedOrder) {
        List<Order> orders = getAll();
        for (int i = 0; i < orders.size(); i++) {
            if (orders.get(i).getOrderId().equals(updatedOrder.getOrderId())) {
                orders.set(i, updatedOrder);
                break;
            }
        }
        saveAll(orders);
    }

    public static void delete(String orderId) {
        List<Order> orders = getAll();
        orders.removeIf(o -> o.getOrderId().equals(orderId));
        saveAll(orders);
    }

    public static Order findById(String id) {
        for (Order o : getAll()) {
            if (o.getOrderId().equals(id)) {
                return o;
            }
        }
        return null;
    }

    private static void saveAll(List<Order> orders) {
        List<String> lines = new ArrayList<>();
        for (Order o : orders) {
            lines.add(o.toFileString());
        }
        FileUtil.writeLines(FILE_PATH, lines);
    }

    public static List<Order> findByUser(String userName) {
        List<Order> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split("\\|");
                if (data.length >= 6 && data[1].equals(userName)) {
                    Order o = new Order(
                            data[0], data[1], data[2],
                            Integer.parseInt(data[3]),
                            data[4],
                            LocalDateTime.parse(data[5], formatter)
                    );
                    list.add(o);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return list;
    }


    public static void updateStatusByUserAndMedicine(String user, String medId, String newStatus) {
        List<Order> orders = getAll();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Order o : orders) {
                if (o.getUserName().equals(user) && o.getStatus().equalsIgnoreCase("Pending")) {
                    o.setStatus(newStatus);
                }
                bw.write(o.getOrderId() + "|" + o.getUserName() + "|" + o.getMedicineName() + "|" +
                        o.getQuantity() + "|" + o.getStatus() + "|" + o.getTimestamp());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
   }
}


}
