package com.app.medicine.util;

import java.util.List;
import java.util.ArrayList;

public class PrescriptionUtil {

    public static boolean isApproved(String userName, String medicineId) {
        List<String> lines = FileUtil.readLines("prescriptions.txt");
        for (String line : lines) {
            String[] parts = line.split(";");
            if (parts.length >= 5) {
                if (parts[1].equals(userName) && parts[2].equals(medicineId) && parts[4].equalsIgnoreCase("approved")) {
                    return true;
                }
            }
        }
        return false;
    }

    public static void markAsApproved(String userName, String medicineId) {
        List<String> lines = FileUtil.readLines("prescriptions.txt");
        List<String> updated = new ArrayList<>();

        for (String line : lines) {
            String[] parts = line.split(";");
            if (parts.length >= 5) {
                if (parts[1].equals(userName) && parts[2].equals(medicineId)) {
                    parts[4] = "approved";
                    line = String.join(";", parts);
                }
            }
            updated.add(line);
        }

        FileUtil.writeLines("prescriptions.txt", updated);
    }
}
