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
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AccOrRej", value = "/AccOrRej")
public class AccOrRejController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session=req.getSession(false);
        String roleId= (String) session.getAttribute("roleId");

        System.out.println("dasdsdasdsadasjkdhsakjdhksad" +
                "dlaskhdlasjdhlasdhasd" +
                "dasljkhdlasdjhlsadj;asljd" +
                "@@@*)(*#)#*)($*)$*($*)$*$(*$)$*)$");

        req.setAttribute("roleId",roleId);
            resp.setContentType("text/html");
            req.getRequestDispatcher("AccOrRej.jsp").include(req,resp);





    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String Goal = req.getParameter("MessiGoal");



        HttpSession session=req.getSession(false);
        String promoId=(String)session.getAttribute("promoId");
        String status=(String)session.getAttribute("status");
        String EmpId=(String)session.getAttribute("EmpId");
        String evaluationPercentage= (String) session.getAttribute("evaluationPercentage");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();

            String roleId= (String) session.getAttribute("roleId");
            System.out.println(roleId +"  <----------------------------------------------------------------------------->");

            if(status.equals("Accepted")) {

                if (roleId.equals("2")) {
                    String sqlQuery = "UPDATE `promotion` SET `mangerMasg`= " + "'" + Goal + "'," + "`numofacc`= " + "'" + 2 + "'" + ", " + "`status`= " + "'" + "inProcessing" + "'" + " WHERE promotionId= " + promoId;
                    System.out.println(sqlQuery);
                    boolean s = stm.execute(sqlQuery);
                } else if (roleId.equals("1")) {
                    String sqlQuery = "UPDATE `promotion` SET `mangerMasg`= " + "'" + Goal + "'," + "`numofacc`= " + "'" + 3 + "'" + ", " + "`status`= " + "'" + "inProcessing" + "'" + " WHERE promotionId= " + promoId;
                    System.out.println(sqlQuery);
                    boolean s = stm.execute(sqlQuery);
                } else if (roleId.equals("4")) {
                    String sqlQuery = "UPDATE `promotion` SET `mangerMasg`= " + "'" + Goal + "'," + "`numofacc`= " + "'" + 4 + "'" + ", " + "`status`= " + "'" + status + "'" + " WHERE promotionId= " + promoId;
                    System.out.println(sqlQuery);
                    boolean s = stm.execute(sqlQuery);

                    if (status.equals("Accepted")) {
                        sqlQuery = "SELECT * FROM `emp` WHERE empId = " + EmpId;
                        ResultSet t = stm.executeQuery(sqlQuery);
                        emp e = new emp();
                        while (t.next()) {
                            e.setRank(t.getInt("rankId"));
                            e.setDep(t.getInt("depId"));
                            e.setSalary(t.getString("salary"));
                            e.setRole(t.getInt("roleId"));
                        }

                        if (e.getRank() != 5) {
                            int ran = e.getRank() + 1;
                            sqlQuery = "UPDATE `emp` SET `rankId`=" + "'" + ran + "'" + " WHERE empId = " + EmpId;
                            boolean tt = stm.execute(sqlQuery);
                        } else {
                            if (e.getRole() == 3) {
                                sqlQuery = "UPDATE `emp` SET `rankId`=" + "'" + 1 + "', " + "`roleId`=" + "2" + " WHERE empId = " + EmpId;
                                System.out.println(sqlQuery);
                                boolean tt = stm.execute(sqlQuery);
                            } else if (e.getRole() == 2) {
                                sqlQuery = "UPDATE `emp` SET `rankId`=" + "'" + 1 + "', " + "`roleId`=" + "1" + " WHERE empId = " + EmpId;
                                System.out.println(sqlQuery);
                                boolean tt = stm.execute(sqlQuery);
                            } else if (e.getRole() == 1) {
                                sqlQuery = "UPDATE `emp` SET `rankId`=" + "'" + 1 + "', " + "`roleId`=" + "4" + " WHERE empId = " + EmpId;
                                System.out.println(sqlQuery);
                                boolean tt = stm.execute(sqlQuery);
                            }
                        }
                        System.out.println(evaluationPercentage);
                        System.out.println(e.getSalary());
                        double evaluationPercentagee = Double.parseDouble(evaluationPercentage);
                        evaluationPercentagee /= 100;
                        double salar = Double.parseDouble(e.getSalary());
                        System.out.println(evaluationPercentagee);
                        System.out.println(salar);
                        double sala = salar * evaluationPercentagee * 0.1;
                        sala += salar;
                        DecimalFormat df = new DecimalFormat("#.##");
                        sqlQuery = "UPDATE `emp` SET `salary`=" + "'" + df.format(sala) + "'" + " WHERE empId = " + EmpId;
                        System.out.println(sqlQuery);
                        boolean tt = stm.execute(sqlQuery);

                    }
                }
            }



            else {
                String sqlQuery = "UPDATE `promotion` SET `mangerMasg`= " + "'" + Goal + "'," + "`status`= " + "'" + status + "'" + " WHERE promotionId= " + promoId;
                System.out.println(sqlQuery);
                boolean s = stm.execute(sqlQuery);
            }


            resp.sendRedirect("/YPMS/reqPromo");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

