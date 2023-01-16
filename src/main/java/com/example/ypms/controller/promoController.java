package com.example.ypms.controller;


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

@WebServlet(name = "promo", value = "/promo")
public class promoController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        HttpSession session=req.getSession(false);
        String roleId= (String) session.getAttribute("roleId");
        req.setAttribute("roleId",roleId);
        resp.setContentType("text/html");
        req.getRequestDispatcher("promo.jsp").include(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("im in pooooooooost");
        String promMesg = req.getParameter("w3review");
        HttpSession session=req.getSession(false);
        String n=(String)session.getAttribute("empId");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();
            LocalDate myObj = LocalDate.now();
            System.out.println(myObj);
            String roleId= (String) session.getAttribute("roleId");

            if(roleId.equals("1")){
                String sqlQuery="INSERT INTO `promotion`(`empMasg`, `empId_fk`, `status`, `date`, `numofacc`) VALUES ('"+promMesg+"','"+n+"', '"+"inProcessing"+"','"+myObj+"','"+3+"')"; //INSERT INTO `promotion`(`empMasg`, `empId_fk`) VALUES ('[value-3]','[value-4]')
                System.out.println(sqlQuery);
                boolean s = stm.execute(sqlQuery);
            }
            else if(roleId.equals("2")){
                String sqlQuery="INSERT INTO `promotion`(`empMasg`, `empId_fk`, `status`, `date`, `numofacc`) VALUES ('"+promMesg+"','"+n+"', '"+"inProcessing"+"','"+myObj+"','"+2+"')"; //INSERT INTO `promotion`(`empMasg`, `empId_fk`) VALUES ('[value-3]','[value-4]')
                System.out.println(sqlQuery);
                boolean s = stm.execute(sqlQuery);
            }
            else if(roleId.equals("3")){
                String sqlQuery="INSERT INTO `promotion`(`empMasg`, `empId_fk`, `status`, `date`, `numofacc`) VALUES ('"+promMesg+"','"+n+"', '"+"inProcessing"+"','"+myObj+"','"+1+"')"; //INSERT INTO `promotion`(`empMasg`, `empId_fk`) VALUES ('[value-3]','[value-4]')
                System.out.println(sqlQuery);
                boolean s = stm.execute(sqlQuery);
            }

            resp.sendRedirect("/YPMS/applyPromo");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

