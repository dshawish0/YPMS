package com.example.ypms.DTO;

import java.util.Date;

public class EmpPromo {
    private int empId;
    private String Fname;
    private String Lname;
    private String empMasg;
    private int Rank;
    private String status;
    private int numofacc;

    public int getNumofacc() {
        return numofacc;
    }

    public void setNumofacc(int numofacc) {
        this.numofacc = numofacc;
    }

    private String promotionId;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    private int GoalsCount;
    private int achieveCount;

    public int getGoalsCount() {
        return GoalsCount;
    }

    public void setGoalsCount(int goalsCount) {
        GoalsCount = goalsCount;
    }

    public int getAchieveCount() {
        return achieveCount;
    }

    public void setAchieveCount(int achieveCount) {
        this.achieveCount = achieveCount;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String fname) {
        Fname = fname;
    }

    public String getLname() {
        return Lname;
    }

    public void setLname(String lname) {
        Lname = lname;
    }

    public String getEmpMasg() {
        return empMasg;
    }

    public void setEmpMasg(String empMasg) {
        this.empMasg = empMasg;
    }

    public int getRank() {
        return Rank;
    }

    public void setRank(int rank) {
        Rank = rank;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(String promotionId) {
        this.promotionId = promotionId;
    }
}
