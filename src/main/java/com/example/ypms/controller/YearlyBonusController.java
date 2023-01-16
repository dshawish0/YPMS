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

@WebServlet(name = "YearlyBonus", value = "/YearlyBonus")
public class YearlyBonusController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html");
        req.getRequestDispatcher("YearlyBonus.jsp").include(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String yearlyBonus = req.getParameter("Deiaa");
        System.out.println(yearlyBonus);
        double bonus = Double.parseDouble(yearlyBonus);
        bonus/=100;
        bonus+=1;
        System.out.println(bonus);


        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();
            String sqlQuery="UPDATE emp SET salary = salary * "+bonus; //DELETE FROM `goal` WHERE `goalId`=1;;
            System.out.println(sqlQuery);
            boolean s = stm.execute(sqlQuery);
            sqlQuery="UPDATE emp\n" +
                    "SET salary = ROUND(salary, 2)";
            boolean ss = stm.execute(sqlQuery);
            resp.sendRedirect("/YPMS/YearlyBonus");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
