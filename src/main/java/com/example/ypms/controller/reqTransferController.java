package com.example.ypms.controller;


import com.example.ypms.DTO.EmpPromo;
import com.example.ypms.DTO.EmpTrans;
import com.example.ypms.model.emp;
import com.example.ypms.model.goal;
import com.example.ypms.model.promotion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "reqTransfer", value = "/reqTransfer")
public class reqTransferController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        HttpSession session=req.getSession(false);
        String n=(String)session.getAttribute("depId");
        String roleId= (String) session.getAttribute("roleId");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();
            System.out.println(roleId+"<------------------------------->");
            String sqlQuery="";
            if(roleId.equals("1")) {
//             sqlQuery="SELECT emp.empId, emp.Fname, emp.Lname, emp.depId, transfer.EmpMesg, transfer.status, transfer.transferId,transfer.NewDep\n" +
//                    "FROM emp\n" +
//                    "INNER JOIN transfer\n" +
//                    "ON emp.empId = transfer.empId and emp.depId= "+n+" ";

                sqlQuery="SELECT emp.empId, emp.Fname, emp.Lname, emp.depId, transfer.EmpMesg, transfer.status, transfer.transferId,transfer.NewDep, department.depId as NewDepId " +
                        "FROM emp INNER JOIN transfer ON emp.empId = transfer.empId " +
                        "INNER JOIN department ON transfer.NewDep = department.name " +
                        "WHERE (emp.depId= "+n+"  OR department.depId="+n+")  and numofacc = 2";

            }
            else if(roleId.equals("4")) {
//                sqlQuery="SELECT emp.empId, emp.Fname, emp.Lname, emp.depId, transfer.EmpMesg, transfer.status, transfer.transferId,transfer.NewDep\n" +
//                        "FROM emp\n" +
//                        "INNER JOIN transfer\n" +
//                        "ON emp.empId = transfer.empId ";

                sqlQuery="SELECT emp.empId, emp.Fname, emp.Lname, emp.depId, transfer.EmpMesg, transfer.status, transfer.transferId,transfer.NewDep, department.depId as NewDepId " +
                        "FROM emp INNER JOIN transfer ON emp.empId = transfer.empId " +
                        "INNER JOIN department ON transfer.NewDep = department.name  and numofacc = 2";
            }
            else {
//                sqlQuery = "SELECT emp.empId, emp.Fname, emp.Lname, emp.depId, transfer.EmpMesg, transfer.status, transfer.transferId,transfer.NewDep\n" +
//                        "FROM emp\n" +
//                        "INNER JOIN transfer\n" +
//                        "ON emp.empId = transfer.empId and emp.depId= " + n + " and emp.roleId = 3\n";


                sqlQuery="SELECT emp.empId, emp.Fname, emp.Lname, emp.depId, transfer.EmpMesg, transfer.status, transfer.transferId,transfer.NewDep, department.depId as NewDepId " +
                        "FROM emp INNER JOIN transfer ON emp.empId = transfer.empId " +
                        "INNER JOIN department ON transfer.NewDep = department.name " +
                        "WHERE (emp.depId= "+n+"  OR department.depId="+n+") and emp.roleId = 3  and numofacc != 2";
            }

            System.out.println(sqlQuery);
            ResultSet s = stm.executeQuery(sqlQuery);
            List<EmpTrans> empTrans = new ArrayList<>();
            while (s.next()){
                EmpTrans empTrans1 = new EmpTrans();
                empTrans1.setEmpId(s.getInt("empId"));
                empTrans1.setFname(s.getString("Fname"));
                empTrans1.setLname(s.getString("LName"));
                empTrans1.setStatus(s.getString("status"));
                empTrans1.setEmpMasg(s.getString("EmpMesg"));
                empTrans1.setNewDep(s.getString("NewDep"));
                empTrans1.setOldDep(s.getString("depId"));
                empTrans1.setTransferId(s.getString("transferId"));

                empTrans.add(empTrans1);
            }

            req.setAttribute("empTrans", empTrans);
            req.setAttribute("roleId",roleId);
            resp.setContentType("text/html");
            req.getRequestDispatcher("ReqTrans.jsp").include(req,resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }





    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("im in pooooooooost");
        String transId = req.getParameter("transId");
        String status = req.getParameter("status");
        String EmpId= req.getParameter("empId");
        String NewDep= req.getParameter("NewDep");

        HttpSession session=req.getSession();
        session.setAttribute("transId", transId);
        session.setAttribute("status", status);
        session.setAttribute("EmpId", EmpId);
        session.setAttribute("NewDep", NewDep);


        resp.setContentType("text/html");
        resp.sendRedirect("/YPMS/AccOrRejTrans");
//        req.getRequestDispatcher("AccOrRej.jsp").include(req,resp);



    }
}

