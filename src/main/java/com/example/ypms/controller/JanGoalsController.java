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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "JanGoals", value = "/JanGoals")
public class JanGoalsController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        HttpSession session=req.getSession(false);
        String n=(String)session.getAttribute("empId");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();

            String sqlQuery="select * from goal where empId ="+n;
            ResultSet s = stm.executeQuery(sqlQuery);
            List<goal> goals = new ArrayList<>();
            while (s.next()){
                goal g = new goal();
                g.setGoalId(s.getInt("goalId"));
                g.setEmpId(s.getInt("empId"));
                g.setName(s.getString("name"));
                g.setIsAchieved(s.getInt("isAchieved"));
                g.setDate(s.getDate("date"));
                goals.add(g);
            }

            resp.setContentType("text/html");
            req.setAttribute("goals", goals);
            req.getRequestDispatcher("JanGoals.jsp").forward(req,resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("im in pooooooooost");
        String id = req.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();
            String sqlQuery="DELETE FROM `goal` WHERE `goalId`="+id; //DELETE FROM `goal` WHERE `goalId`=1;;
            System.out.println(sqlQuery);
            boolean s = stm.execute(sqlQuery);
            resp.sendRedirect("/YPMS/JanGoals");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
