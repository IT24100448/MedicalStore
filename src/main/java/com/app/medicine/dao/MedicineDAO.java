package com.app.medicine.dao;

import com.app.medicine.model.Medicine;
import com.app.medicine.util.FileUtil;

import java.util.*;
import java.util.stream.Collectors;

public class MedicineDAO {
    private static final String FILE_PATH = "data/products.txt";
    private static final String DELIMITER = "\\|";

    public static List<Medicine> getAll() {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        List<Medicine> products = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(DELIMITER);
            if (parts.length == 6) {
                Medicine med = new Medicine(
                        parts[0], parts[1], parts[2],
                        Double.parseDouble(parts[3]),
                        Integer.parseInt(parts[4])
                );
                med.setRequiresPrescription(Boolean.parseBoolean(parts[5]));
                products.add(med);
            }
        }
        return products;
    }

    public static List<String> getProductNames() {
        List<String> names = new ArrayList<>();
        List<String> lines = FileUtil.readLines(FILE_PATH);
        for (String line : lines) {
            String[] parts = line.split(DELIMITER);
            if (parts.length >= 2) {
                names.add(parts[1]); // 2nd element is productName
            }
        }
        return names;
    }

    public static void add(Medicine product) {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        lines.add(String.join("|",
                product.getMedicineID(),
                product.getMedicineName(),
                product.getCategory(),
                String.valueOf(product.getPrice()),
                String.valueOf(product.getQuantity()),
                String.valueOf(product.isPrescriptionRequired())
        ));
        FileUtil.writeLines(FILE_PATH, lines);
    }

    public static void update(Medicine updated) {
        List<Medicine> products = getAll();
        List<String> lines = new ArrayList<>();
        for (Medicine p : products) {
            if (p.getMedicineID().equals(updated.getMedicineID())) {
                lines.add(String.join("|",
                        updated.getMedicineID(),
                        updated.getMedicineName(),
                        updated.getCategory(),
                        String.valueOf(updated.getPrice()),
                        String.valueOf(updated.getQuantity()),
                        String.valueOf(updated.isPrescriptionRequired())
                ));
            } else {
                lines.add(String.join("|",
                        p.getMedicineID(),
                        p.getMedicineName(),
                        p.getCategory(),
                        String.valueOf(p.getPrice()),
                        String.valueOf(p.getQuantity()),
                        String.valueOf(p.isPrescriptionRequired())
                ));
            }
        }
        FileUtil.writeLines(FILE_PATH, lines);
    }

    public static void delete(String id) {
        List<Medicine> products = getAll();
        List<String> lines = new ArrayList<>();
        for (Medicine p : products) {
            if (!p.getMedicineID().equals(id)) {
                lines.add(String.join("|",
                        p.getMedicineID(),
                        p.getMedicineName(),
                        p.getCategory(),
                        String.valueOf(p.getPrice()),
                        String.valueOf(p.getQuantity()),
                        String.valueOf(p.isPrescriptionRequired())
                ));
            }
        }
        FileUtil.writeLines(FILE_PATH, lines);
    }

    public static Medicine findById(String id) {
        for (Medicine p : getAll()) {
            if (p.getMedicineID().equals(id)) return p;
        }
        return null;
    }

    public static List<Medicine> getByCategory(String category) {
        return getAll().stream()
                .filter(p -> p.getCategory().equalsIgnoreCase(category))
                .collect(Collectors.toList());
    }
}
