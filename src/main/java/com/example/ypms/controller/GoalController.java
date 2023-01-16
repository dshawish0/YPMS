package com.example.ypms.controller;

import com.example.ypms.model.goal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Goal", value = "/Goal")
public class GoalController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html");
        req.getRequestDispatcher("Goal.jsp").include(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("im in pooooooooost");
          String Goal = req.getParameter("MessiGoal");
          HttpSession session=req.getSession(false);
          String n=(String)session.getAttribute("empId");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();
            LocalDate myObj = LocalDate.now();
            System.out.println(myObj);
            String sqlQuery="INSERT INTO `goal`( `name`, `empId`, `isAchieved`, `date`) VALUES ('"+Goal+"','"+n+"', '"+0+"','"+myObj+"')";
            System.out.println(sqlQuery);
            boolean s = stm.execute(sqlQuery);
            resp.sendRedirect("/YPMS/JanGoals");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
