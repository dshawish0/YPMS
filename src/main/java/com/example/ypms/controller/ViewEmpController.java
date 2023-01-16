package com.example.ypms.controller;


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

@WebServlet(name = "ViewEmp", value = "/ViewEmp")
public class ViewEmpController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        HttpSession session=req.getSession(false);
        String n=(String)session.getAttribute("depId");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();

            String sqlQuery="select * from emp where depId="+"'"+n+"'"+ " and "+ "roleId= "+"'"+3+"'";
            System.out.println(sqlQuery);
            ResultSet s = stm.executeQuery(sqlQuery);
            List<emp> emps = new ArrayList<>();
            while (s.next()){
                emp e = new emp();
                e.setEmpId(s.getInt("empId"));
                e.setFname(s.getString("Fname"));
                e.setLName(s.getString("LName"));
                e.setEmail(s.getString("email"));
                e.setRank(s.getInt("rankId"));
                e.setSalary(s.getString("salary"));
                emps.add(e);
            }

            req.setAttribute("emps", emps);
            resp.setContentType("text/html");
            req.getRequestDispatcher("ViewEmp.jsp").include(req,resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }





    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        System.out.println("im in pooooooooost");
//        String Goal = req.getParameter("w3review");
//        HttpSession session=req.getSession(false);
//        String n=(String)session.getAttribute("empId");
//
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
//            System.out.println(c.isClosed());
//            Statement stm = c.createStatement();
//            String sqlQuery="INSERT INTO `goal`( `name`, `empId`,  `isAchieved`) VALUES ('"+Goal+"','"+n+"', '"+0+"')";
//            System.out.println(sqlQuery);
//            boolean s = stm.execute(sqlQuery);
//            resp.sendRedirect("/YPMS/JanGoals");
//
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
    }
}

