package com.example.ypms.controller;


import com.example.ypms.DTO.EmpPromo;
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

@WebServlet(name = "reqPromo", value = "/reqPromo")
public class reqPromoController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        HttpSession session=req.getSession(false);
        String roleId= (String) session.getAttribute("roleId");
        String n=(String)session.getAttribute("depId");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();
            String sqlQuery="";
            if(roleId.equals("4")) {
                sqlQuery = "SELECT emp.empId, emp.Fname, emp.Lname, emp.roleId, emp.rankId, promotion.empMasg, promotion.status, promotion.date, promotion.promotionId,\n" +
                        "    (SELECT COUNT(*) FROM goal WHERE goal.empId = emp.empId) AS GoalsCount, (SELECT COUNT(*) FROM goal WHERE goal.empId = emp.empId and isAchieved=1) AS achieveCount\n" +
                        "FROM emp\n" +
                        "INNER JOIN promotion\n" +
                        "ON emp.empId = promotion.empId_fk" + " where promotion.numofacc = 3 ";
            }
            else if(roleId.equals("1")){
                sqlQuery = "SELECT emp.empId, emp.Fname, emp.Lname, emp.roleId, emp.rankId, promotion.empMasg, promotion.status, promotion.date, promotion.promotionId,\n" +
                        "    (SELECT COUNT(*) FROM goal WHERE goal.empId = emp.empId) AS GoalsCount, (SELECT COUNT(*) FROM goal WHERE goal.empId = emp.empId and isAchieved=1) AS achieveCount\n" +
                        "FROM emp\n" +
                        "INNER JOIN promotion\n" +
                        "ON emp.empId = promotion.empId_fk and emp.depId= " + n + " where (emp.roleId = 2 or emp.roleId = 3) and promotion.numofacc = 2 ";
            }
            else {
                sqlQuery = "SELECT emp.empId, emp.Fname, emp.Lname, emp.roleId, emp.rankId, promotion.empMasg, promotion.status, promotion.date, promotion.promotionId,\n" +
                        "    (SELECT COUNT(*) FROM goal WHERE goal.empId = emp.empId) AS GoalsCount, (SELECT COUNT(*) FROM goal WHERE goal.empId = emp.empId and isAchieved=1) AS achieveCount\n" +
                        "FROM emp\n" +
                        "INNER JOIN promotion\n" +
                        "ON emp.empId = promotion.empId_fk and emp.depId= " + n + " and emp.roleId = 3 and promotion.numofacc = 1";
            }

            System.out.println(sqlQuery);
            ResultSet s = stm.executeQuery(sqlQuery);
            List<EmpPromo> empPromo = new ArrayList<>();
            while (s.next()){
                EmpPromo empPromo1 = new EmpPromo();
                empPromo1.setEmpId(s.getInt("empId"));
                empPromo1.setFname(s.getString("Fname"));
                empPromo1.setLname(s.getString("LName"));
                empPromo1.setRank(s.getInt("rankId"));
                empPromo1.setPromotionId(s.getString("promotionId"));
                empPromo1.setEmpMasg(s.getString("empMasg"));
                empPromo1.setStatus(s.getString("status"));
                empPromo1.setGoalsCount(s.getInt("GoalsCount"));
                empPromo1.setAchieveCount(s.getInt("achieveCount"));
                empPromo1.setDate(s.getDate("date"));

                empPromo.add(empPromo1);
            }

            req.setAttribute("empPromo", empPromo);
            req.setAttribute("roleId",roleId);
            resp.setContentType("text/html");
            req.getRequestDispatcher("ReqPromo.jsp").include(req,resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }





    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("im in pooooooooost");
        String promoId = req.getParameter("promoId");
        String status = req.getParameter("status");
        String EmpId = req.getParameter("empId");
        String evaluationPercentage = req.getParameter("evaluationPercentage");

        HttpSession session=req.getSession();
        session.setAttribute("promoId", promoId);
        session.setAttribute("status", status);
        session.setAttribute("EmpId", EmpId);
        session.setAttribute("evaluationPercentage", evaluationPercentage);


        resp.setContentType("text/html");
        resp.sendRedirect("/YPMS/AccOrRej");
//        req.getRequestDispatcher("AccOrRej.jsp").include(req,resp);



    }
}

