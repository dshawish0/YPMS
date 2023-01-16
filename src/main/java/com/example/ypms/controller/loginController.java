package com.example.ypms.controller;


import com.example.ypms.model.emp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "login", value = "/login")
public class loginController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html");

        req.getRequestDispatcher("login.jsp").include(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        System.out.println(email);
        System.out.println(password);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();
            String sqlQuery="select * from emp where email = " +"'"+email +"'"+ " and password = "+"'"+password+"'";
            System.out.println(sqlQuery);
            ResultSet s = stm.executeQuery(sqlQuery);
            System.out.println(s.next());
//            emp e = new emp();
//                e.setFname(s.getString("Fname"));
//                e.setFname(s.getString("LName"));
//                e.setRank(s.getInt("rankId"));
            System.out.println(s.getString("password")+"     dasdasdasdasdasdasdasdasd");
            if(email.equals(s.getString("email")) && password.equals(s.getString("password"))){
                if(s.getString("roleId").equals("3")) {
                    resp.sendRedirect("/YPMS/JanGoals");
                }
                else if(s.getString("roleId").equals("2")){
                    resp.sendRedirect("/YPMS/ViewEmp");
                }
//                else if(s.getString("roleId").equals("1")){
//                    resp.sendRedirect("/YPMS/reqPromo");
//                }
                else
                    resp.sendRedirect("/YPMS/reqPromo");

                System.out.println("od --->>" +s.getString("empId"));
                HttpSession session=req.getSession();
                session.setAttribute("empId", s.getString("empId"));
                session.setAttribute("depId", s.getString("depId"));
                session.setAttribute("roleId", s.getString("roleId"));
//                req.setAttribute("User", e);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        resp.setContentType("text/html");
        req.getRequestDispatcher("login.jsp").include(req,resp);
    }
}
