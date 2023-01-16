package com.example.ypms.model;

import java.util.Date;

public class goal {
    private int goalId;
    private String name;
    private int empId;
    private int isAchieved;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public goal() {
    }

    public int getGoalId() {
        return goalId;
    }

    public void setGoalId(int goalId) {
        this.goalId = goalId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public int getIsAchieved() {
        return isAchieved;
    }

    public void setIsAchieved(int isAchieved) {
        this.isAchieved = isAchieved;
    }
}
