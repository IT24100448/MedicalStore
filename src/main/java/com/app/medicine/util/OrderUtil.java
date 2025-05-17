package com.app.medicine.util;

import com.app.medicine.dao.OrderDAO;
import com.app.medicine.model.Order;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class OrderUtil {
    private static final Queue<Order> orderQueue = new LinkedList<>();

    public static void enqueue(Order order) {
        orderQueue.offer(order);
    }

    public static Order dequeue() {
        return orderQueue.poll();
    }

    public static Order peek() {
        return orderQueue.peek();
    }

    public static boolean isEmpty() {
        return orderQueue.isEmpty();
    }

    public static Queue<Order> getQueue() {
        List<Order> allOrders = OrderDAO.getAll();
        Queue<Order> pendingQueue = new LinkedList<>();
        for (Order order : allOrders) {
            if ("pending".equalsIgnoreCase(order.getStatus())) {
                pendingQueue.offer(order);
            }
        }
        return pendingQueue;
    }


    public static void clear() {
        orderQueue.clear();
}
}
