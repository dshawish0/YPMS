package com.example.ypms.controller;


import com.example.ypms.model.goal;
import com.example.ypms.model.promotion;
import com.example.ypms.model.transfer;

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

@WebServlet(name = "applyTransfer", value = "/applyTransfer")
public class applyTransferController extends HttpServlet {
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

            String sqlQuery="select * from transfer where empId ="+n;
            ResultSet s = stm.executeQuery(sqlQuery);
            List<transfer> transfers = new ArrayList<>();
            while (s.next()){
                transfer t = new transfer();

                t.setTransferId(s.getInt("transferId"));
                t.setEmpMesg(s.getString("EmpMesg"));
                t.setNewDep(s.getString("NewDep"));
                t.setStatus(s.getString("status"));
                t.setManegerMesg(s.getString("ManegerMesg"));
                transfers.add(t);
            }

            resp.setContentType("text/html");
            req.setAttribute("transfers", transfers);
            req.getRequestDispatcher("applyTransfar.jsp").include(req,resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

