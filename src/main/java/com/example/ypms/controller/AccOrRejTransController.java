package com.example.ypms.controller;


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

@WebServlet(name = "AccOrRejTrans", value = "/AccOrRejTrans")
public class AccOrRejTransController extends HttpServlet {
    public void init() {


    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        HttpSession session=req.getSession(false);
        String roleId= (String) session.getAttribute("roleId");

        req.setAttribute("roleId",roleId);
        resp.setContentType("text/html");
        req.getRequestDispatcher("AccOrRejTrans.jsp").include(req,resp);





    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String Goal = req.getParameter("MessiGoal");

        HttpSession session=req.getSession(false);
        String transId=(String)session.getAttribute("transId");
        String status=(String)session.getAttribute("status");
        String EmpId=(String)session.getAttribute("EmpId");
        String NewDep=(String)session.getAttribute("NewDep");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ypms?useSSL=false","root","");
            System.out.println(c.isClosed());
            Statement stm = c.createStatement();


            String getQuery="SELECT * FROM `transfer` WHERE transferId="+transId;
            ResultSet ss = stm.executeQuery(getQuery);
            int count=0;
            while (ss.next()){
                count=ss.getInt("numofacc");
            }
            String roleId= (String) session.getAttribute("roleId");

            if(roleId.equals("2")) {
                if (status.equals("Accepted")) {
                    count++;
                    String sqlQuery = "UPDATE `transfer` SET `ManegerMesg`= " + "'" + Goal + "'," + "`status`= " + "'" + "inProcessing" + "'," + "`numofacc`= " + "'" + count + "'" + " WHERE transferId= " + transId;
                    System.out.println(sqlQuery);
                    boolean s = stm.execute(sqlQuery);
                } else {
                    String sqlQuery = "UPDATE `transfer` SET `ManegerMesg`= " + "'" + Goal + "'," + "`status`= " + "'" + status + "'," + "`numofacc`= " + "'" + count + "'" + " WHERE transferId= " + transId;
                    System.out.println(sqlQuery);
                    boolean s = stm.execute(sqlQuery);
                }
            }
            else{
                count++;
                String sqlQuery = "UPDATE `transfer` SET `ManegerMesg`= " + "'" + Goal + "'," + "`status`= " + "'" + status + "'," + "`numofacc`= " + "'" + count + "'" + " WHERE transferId= " + transId;
                System.out.println(sqlQuery);
                boolean s = stm.execute(sqlQuery);

                System.out.println(NewDep);

                if(NewDep.equals("Human")) {

                    sqlQuery="UPDATE `emp` SET `depId`= "+"'"+1+"'"+ " WHERE empId = "+EmpId;
                    System.out.println(sqlQuery);
                    s = stm.execute(sqlQuery);
                }
                else if(NewDep.equals("Accounting")) {

                    sqlQuery="UPDATE `emp` SET `depId`= "+"'"+2+"'"+ " WHERE empId = "+EmpId;
                    System.out.println(sqlQuery);
                    s = stm.execute(sqlQuery);
                }
                else if(NewDep.equals("Engineering")) {

                    sqlQuery="UPDATE `emp` SET `depId`= "+"'"+3+"'"+ " WHERE empId = "+EmpId;
                    System.out.println(sqlQuery);
                    s = stm.execute(sqlQuery);
                }
                else if(NewDep.equals("Sales")) {

                    sqlQuery="UPDATE `emp` SET `depId`= "+"'"+4+"'"+ " WHERE empId = "+EmpId;
                    System.out.println(sqlQuery);
                    s = stm.execute(sqlQuery);
                }

            }







            resp.sendRedirect("/YPMS/reqTransfer");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

