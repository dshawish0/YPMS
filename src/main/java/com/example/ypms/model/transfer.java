package com.example.ypms.model;

public class transfer {
    private int transferId;
    private int empId;
    private String EmpMesg;
    private String NewDep;
    private String ManegerMesg	;

    public int getTransferId() {
        return transferId;
    }

    public void setTransferId(int transferId) {
        this.transferId = transferId;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getEmpMesg() {
        return EmpMesg;
    }

    public void setEmpMesg(String empMesg) {
        EmpMesg = empMesg;
    }

    public String getNewDep() {
        return NewDep;
    }

    public void setNewDep(String newDep) {
        NewDep = newDep;
    }

    public String getManegerMesg() {
        return ManegerMesg;
    }

    public void setManegerMesg(String manegerMesg) {
        ManegerMesg = manegerMesg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private String status;
}
