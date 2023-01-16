package com.example.ypms.DTO;

public class EmpTrans {
    private int empId;
    private String Fname;
    private String Lname;
    private String status;
    private String empMasg;
    private String oldDep;
    private String newDep;
    private String transferId;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmpMasg() {
        return empMasg;
    }

    public void setEmpMasg(String empMasg) {
        this.empMasg = empMasg;
    }

    public String getOldDep() {
        return oldDep;
    }

    public void setOldDep(String oldDep) {
        this.oldDep = oldDep;
    }

    public String getNewDep() {
        return newDep;
    }

    public void setNewDep(String newDep) {
        this.newDep = newDep;
    }

    public String getTransferId() {
        return transferId;
    }

    public void setTransferId(String transferId) {
        this.transferId = transferId;
    }
}
