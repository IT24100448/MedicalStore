package com.app.medicine.model;

public class Medicine {
    private String medicineID;
    private String medicineName;
    private String category;
    private double price;
    private int quantity;
    private boolean requiresPrescription;

    public Medicine(String medicineID, String medicineName, String category, double price, int quantity) {
        this.medicineID = medicineID;
        this.medicineName = medicineName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    public String getMedicineID() {
        return medicineID;
    }

    public void setMedicineID(String medicineID) {
        this.medicineID = medicineID;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isPrescriptionRequired() {
        return requiresPrescription;
    }

    public void setRequiresPrescription(boolean requiresPrescription) {
        this.requiresPrescription = requiresPrescription;
    }

}
