package com.example.ypms.model;

import java.util.Date;

public class promotion {
    private int promotionId;
    private String empMasg;
    private String mangerMasg;
    private int empId_fk;
    private int numofacc;

    public int getNumofacc() {
        return numofacc;
    }

    public void setNumofacc(int numofacc) {
        this.numofacc = numofacc;
    }

    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    private String status;

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public String getEmpMasg() {
        return empMasg;
    }

    public void setEmpMasg(String empMasg) {
        this.empMasg = empMasg;
    }

    public String getMangerMasg() {
        return mangerMasg;
    }

    public void setMangerMasg(String mangerMasg) {
        this.mangerMasg = mangerMasg;
    }

    public int getEmpId_fk() {
        return empId_fk;
    }

    public void setEmpId_fk(int empId_fk) {
        this.empId_fk = empId_fk;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
