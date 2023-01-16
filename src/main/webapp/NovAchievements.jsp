<%@ page import="com.example.ypms.model.goal" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/31/2022
  Time: 2:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    th,
    tr,
    td {
        width: 1300px; !important;
        padding: 15px; !important;
        font-size: 16px; !important;
        text-align: center; !important;
    }

</style>

<div id="content">
    <div class="layout-px-spacing">
        <div class="middle-content container-xxl p-0">
            <!--  BEGIN BREADCRUMBS  -->
            <div class="secondary-nav">
                <div class="breadcrumbs-container" data-page-heading="Analytics">
                    <header class="header navbar navbar-expand-sm">
                        <a href="javascript:void(0);" class="btn-toggle sidebarCollapse" data-placement="bottom">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
                                <line x1="3" y1="12" x2="21" y2="12"></line>
                                <line x1="3" y1="6" x2="21" y2="6"></line>
                                <line x1="3" y1="18" x2="21" y2="18"></line>
                            </svg>
                        </a>
                        <div class="d-flex breadcrumb-content">
                            <div class="page-header">
                                <div class="page-title"></div>

                                <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item">
                                            <a href="#">Employees Dashboard</a>
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </header>
                </div>
            </div>
            <!--  END BREADCRUMBS  -->

            <div class="row layout-top-spacing">
                <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing"></div>
                <div class="table-responsive">
                    <div class="statbox widget box box-shadow">
                        <div class="widget-header p-4">
                            <div class="d-flex flex-row justify-content-between">
                                <div>
                                    <h4>November Achievements</h4>
                                </div>
<%--                                <div>--%>
<%--                                    <a href="Goal" class="btn btn-primary">New Goal</a>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                        <div class="widget-content widget-content-area">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th scope="col">#NO</th>
                                        <th scope="col">Message</th>
                                        <th class="text-center" scope="col">Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% List<goal> goals = (ArrayList<goal>)request.getAttribute("goals");
                                        for(goal goal : goals) {
                                            out.print("<tr>");
                                            out.print("<td>"+goal.getGoalId()+"</td>");
                                            out.print("<td>");
                                            out.print(goal.getName()+"</td>");
                                            if(goal.getIsAchieved() != 1) {
                                                out.print("<td >\n" +
                                                        "<form method=\"POST\">" +
                                                        "<input type=\"text\" name=\"id\" value=" + goal.getGoalId() + " hidden>");


                                                Calendar calendar = Calendar.getInstance();
                                                int currentMonth = calendar.get(Calendar.MONTH);
                                                if (currentMonth == Calendar.JANUARY) {
                                                    out.print("      <input type=\"submit\" class=\"btn btn-primary\" style=\"display:flex; justify-content: center\" value=\"Achieve it\"'/'> " +
                                                            "  </td >\n" +
                                                            "</tr >\n" +
                                                            "</form>");
                                                }
                                                else{
                                                    out.print("      <input type=\"submit\" class=\"btn btn-primary\" disabled style=\"display:flex; justify-content: center\" value=\"Achieve it\"'/'> " +
                                                            "  </td >\n" +
                                                            "</tr >\n" +
                                                            "</form>");
                                                }
                                            }
                                            else{
                                                out.print("<td >" +"<input type=\"submit\" disable class=\"btn btn-Success\" style=\"display:flex; justify-content: center\" value=\"Achieved\"'/'> ");
                                                System.out.println("\"  </td >" +
                                                        "\"</tr >");
                                            }
                                            out.print("</td>");
                                            out.print("</tr>");
                                        }%>
                                    <%--                                    <tr>--%>
                                    <%--                                        <td>January Message 2</td>--%>
                                    <%--                                        <td>--%>
                                    <%--                                            <svg--%>
                                    <%--                                                    xmlns="http://www.w3.org/2000/svg"--%>
                                    <%--                                                    width="24"--%>
                                    <%--                                                    height="24"--%>
                                    <%--                                                    viewBox="0 0 24 24"--%>
                                    <%--                                                    fill="none"--%>
                                    <%--                                                    stroke="currentColor"--%>
                                    <%--                                                    stroke-width="2"--%>
                                    <%--                                                    stroke-linecap="round"--%>
                                    <%--                                                    stroke-linejoin="round"--%>
                                    <%--                                                    class="feather feather-calendar"--%>
                                    <%--                                            >--%>
                                    <%--                                                <rect--%>
                                    <%--                                                        x="3"--%>
                                    <%--                                                        y="4"--%>
                                    <%--                                                        width="18"--%>
                                    <%--                                                        height="18"--%>
                                    <%--                                                        rx="2"--%>
                                    <%--                                                        ry="2"--%>
                                    <%--                                                ></rect>--%>
                                    <%--                                                <line x1="16" y1="2" x2="16" y2="6"></line>--%>
                                    <%--                                                <line x1="8" y1="2" x2="8" y2="6"></line>--%>
                                    <%--                                                <line x1="3" y1="10" x2="21" y2="10"></line>--%>
                                    <%--                                            </svg>--%>
                                    <%--                                            <span class="table-inner-text">26 Apr</span>--%>
                                    <%--                                        </td>--%>
                                    <%--                                        <td class="text-center">--%>
                                    <%--                              <span class="badge badge-light-secondary"--%>
                                    <%--                              >Pending</span--%>
                                    <%--                              >--%>
                                    <%--                                        </td>--%>
                                    <%--                                    </tr>--%>
                                    <%--                                    <tr>--%>
                                    <%--                                        <td>January Message</td>--%>
                                    <%--                                        <td>--%>
                                    <%--                                            <svg--%>
                                    <%--                                                    xmlns="http://www.w3.org/2000/svg"--%>
                                    <%--                                                    width="24"--%>
                                    <%--                                                    height="24"--%>
                                    <%--                                                    viewBox="0 0 24 24"--%>
                                    <%--                                                    fill="none"--%>
                                    <%--                                                    stroke="currentColor"--%>
                                    <%--                                                    stroke-width="2"--%>
                                    <%--                                                    stroke-linecap="round"--%>
                                    <%--                                                    stroke-linejoin="round"--%>
                                    <%--                                                    class="feather feather-calendar"--%>
                                    <%--                                            >--%>
                                    <%--                                                <rect--%>
                                    <%--                                                        x="3"--%>
                                    <%--                                                        y="4"--%>
                                    <%--                                                        width="18"--%>
                                    <%--                                                        height="18"--%>
                                    <%--                                                        rx="2"--%>
                                    <%--                                                        ry="2"--%>
                                    <%--                                                ></rect>--%>
                                    <%--                                                <line x1="16" y1="2" x2="16" y2="6"></line>--%>
                                    <%--                                                <line x1="8" y1="2" x2="8" y2="6"></line>--%>
                                    <%--                                                <line x1="3" y1="10" x2="21" y2="10"></line>--%>
                                    <%--                                            </svg>--%>
                                    <%--                                            <span class="table-inner-text">05 May</span>--%>
                                    <%--                                        </td>--%>
                                    <%--                                        <td class="text-center">--%>
                                    <%--                              <span class="badge badge-light-danger"--%>
                                    <%--                              >Rejected</span--%>
                                    <%--                              >--%>
                                    <%--                                        </td>--%>
                                    <%--                                        <td class="text-center">--%>
                                    <%--                                            <a href="" class="btn-link">view</a>--%>
                                    <%--                                        </td>--%>
                                    <%--                                    </tr>--%>
                                    <%--                                    <tr>--%>
                                    <%--                                        <td>January Message 4</td>--%>
                                    <%--                                        <td>--%>
                                    <%--                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar">--%>
                                    <%--                                                <rect--%>
                                    <%--                                                        x="3"--%>
                                    <%--                                                        y="4"--%>
                                    <%--                                                        width="18"--%>
                                    <%--                                                        height="18"--%>
                                    <%--                                                        rx="2"--%>
                                    <%--                                                        ry="2"--%>
                                    <%--                                                ></rect>--%>
                                    <%--                                                <line x1="16" y1="2" x2="16" y2="6"></line>--%>
                                    <%--                                                <line x1="8" y1="2" x2="8" y2="6"></line>--%>
                                    <%--                                                <line x1="3" y1="10" x2="21" y2="10"></line>--%>
                                    <%--                                            </svg>--%>
                                    <%--                                            <span class="table-inner-text">18 May</span>--%>
                                    <%--                                        </td>--%>
                                    <%--                                        <td class="text-center">--%>
                                    <%--                                                    <span class="badge badge-light-info">In Progress</span--%>
                                    <%--                                                    >--%>
                                    <%--                                        </td>--%>
                                    <%--                                    </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--  BEGIN FOOTER  -->

    <!--  END FOOTER  -->
</div>
<%@include file="/NavBar.jsp"%>