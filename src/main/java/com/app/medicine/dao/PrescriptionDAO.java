package com.app.medicine.dao;

import com.app.medicine.model.Prescription;

import java.io.*;
import java.time.LocalDateTime;
import java.util.*;

public class PrescriptionDAO {
    private static final String FILE_PATH = "data/prescriptions.txt";

    public static void add(Prescription p) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(String.join("::",
                    p.getPrescriptionId(),
                    p.getUserName(),
                    p.getMedicineId(),
                    p.getImagePath(),
                    p.getStatus(),
                    p.getUploadedAt().toString()
            ));
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Prescription> getAll() {
        List<Prescription> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("::");
                if (parts.length >= 6) {
                    Prescription p = new Prescription(
                            parts[0], parts[1], parts[2], parts[3], parts[4],
                            LocalDateTime.parse(parts[5])
                    );
                    list.add(p);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Prescription findById(String id) {
        for (Prescription p : getAll()) {
            if (p.getPrescriptionId().equals(id)) {
                return p;
            }
        }
        return null;
    }

    public static void update(Prescription updated) {
        List<Prescription> list = getAll();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Prescription p : list) {
                if (p.getPrescriptionId().equals(updated.getPrescriptionId())) {
                    p = updated;
                }
                bw.write(String.join("::",
                        p.getPrescriptionId(),
                        p.getUserName(),
                        p.getMedicineId(),
                        p.getImagePath(),
                        p.getStatus(),
                        p.getUploadedAt().toString()
                ));
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void delete(String id) {
        List<Prescription> list = getAll();
        list.removeIf(p -> p.getPrescriptionId().equals(id));
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Prescription p : list) {
                bw.write(String.join("::",
                        p.getPrescriptionId(),
                        p.getUserName(),
                        p.getMedicineId(),
                        p.getImagePath(),
                        p.getStatus(),
                        p.getUploadedAt().toString()
                ));
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void updateStatus(String id, String newStatus) {
        List<Prescription> all = getAll();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Prescription p : all) {
                if (p.getPrescriptionId().equals(id)) {
                    p.setStatus(newStatus);
                }
                bw.write(p.getPrescriptionId() + "|" + p.getUserName() + "|" + p.getMedicineId() + "|" +
                        p.getImagePath() + "|" + p.getStatus() + "|" + p.getUploadedAt());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
