package com.example.ypms.controller;


import com.example.ypms.model.department;
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

@WebServlet(name = "Transfer", value = "/Transfer")
public class TransferController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();

            String sqlQuery="SELECT `depId`, `name` FROM `department`";

            ResultSet s = stm.executeQuery(sqlQuery);
            List<department> departments = new ArrayList<>();
            while (s.next()){
                department d = new department();
                d.setDepId(s.getInt("depId"));
                d.setName(s.getString("name"));
                departments.add(d);
            }

            req.setAttribute("departments", departments);
            resp.setContentType("text/html");
            req.getRequestDispatcher("Transfer.jsp").include(req,resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String department = req.getParameter("department");
        String mesg = req.getParameter("mesg");
        System.out.println(department);
        System.out.println(mesg);

        HttpSession session=req.getSession(false);
        String n=(String)session.getAttribute("empId");


        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();

            String sqlQuery="INSERT INTO `transfer`(`empId`, `EmpMesg`, `NewDep`, `status`, `numofacc`) VALUES ('"+n+"','"+mesg+"','"+department+"','"+"inProcessing"+ "','"+"0"+ "')";//INSERT INTO `transfer`(`empId`, `NewDep`, `status`) VALUES ('[value-1]','[value-2]','[value-3]')
            System.out.println(sqlQuery);
            boolean s = stm.execute(sqlQuery);

            resp.setContentType("text/html");
            resp.sendRedirect("/YPMS/applyTransfer");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }


    }
}

