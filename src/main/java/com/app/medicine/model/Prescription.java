package com.app.medicine.model;

import java.time.LocalDateTime;

public class Prescription {
    private String prescriptionId;
    private String userName;
    private String medicineId;
    private String imagePath;
    private String status;
    private LocalDateTime uploadedAt;


    public Prescription(String prescriptionId, String userName, String medicineId, String imagePath, String status, LocalDateTime parse) {
        this.prescriptionId = prescriptionId;
        this.userName = userName;
        this.medicineId = medicineId;
        this.imagePath = imagePath;
        this.status = status;
        this.uploadedAt = parse;
    }

    public LocalDateTime getUploadedAt() {
        return uploadedAt;
    }

    public void setUploadedAt(LocalDateTime uploadedAt) {
        this.uploadedAt = uploadedAt;
    }

    public String getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(String prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(String medicineId) {
        this.medicineId = medicineId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
