<%@ page import="com.example.ypms.model.promotion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/5/2023
  Time: 6:50 PM
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

  #popup {
    display: none;
    position: fixed;
    left: 0;
    top: 250;
    width: 100%;
    height: 100%;
    overflow: auto;
  }

  .popup-content {
    background-color: steelblue;

    margin: 20px;
    padding: 40px;
    width: 50%;
    height: 50vh;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  }

  .close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }

  .close:hover,
  .close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
  }
  .move {
    display: flex;
    justify-content: center;
    align-content: center;
  }
  h1 {
    text-align: center;
  }
  p {
    margin: 20px;
    padding: 0px 24px;
    font-size: 1.6rem;
    font-weight: 500;
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
                  <h4>Apply Promotion</h4>
                </div>
                <div>
                  <a href="promo" class="btn btn-primary">apply for promotion</a>
                </div>
              </div>
            </div>
            <div class="widget-content widget-content-area">
              <div class="table-responsive">
                <table class="table table-bordered" >
                  <thead>
                  <tr>
                    <th scope="col">#NO</th>
                    <th scope="col">Message</th>
                    <th scope="col">Date</th>
                    <th class="text-center" scope="col">status</th>
                    <th scope="col">View</th>
                  </tr>
                  </thead>
                  <tbody>
                  <% List<promotion> promotions = (ArrayList<promotion>)request.getAttribute("promotions");
                    for(promotion promo : promotions) {
                      out.print("<tr>");
                      out.print("<td>"+promo.getPromotionId()+"</td>");
                      out.print("<td>");
                      out.print(promo.getEmpMasg()+"</td>");
                      out.print("<td>");
                      out.print(promo.getDate()+"</td>");
                      if(promo.getStatus().equals("inProcessing")){
                        out.print("<td class=\"text-center\"><span class=\"badge badge-light-info\">In Progress</span>");
                        out.print("</td>");
                      }
                      else if(promo.getStatus().equals("Draft")){
                        out.print("<td class=\"text-center\"><span class=\"badge badge-light-danger\">Draft</span>");
                        out.print("</td>");
                        out.print("<td><button onclick=\"openPopup(\'"+promo.getMangerMasg()+"\')\" class=\"btn-link\">view</button></td>");
                      }
                      else{
                        out.print("<td class=\"text-center\"><span class=\"badge badge-light-success\">Approved</span>");
                        out.print("</td>");
                        out.print("<td><button onclick=\"openPopup(\'"+promo.getMangerMasg()+"\')\" class=\"btn-link\">view</button></td>");
                      }
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

  <!--  BEGIN FOOTER  --><!--  END FOOTER  -->
</div>



<div id="popup">
  <div class="move">
    <div class="popup-content">
      <span class="close" onclick="closePopup()">&times;</span>
      <h1> manger respond:</h1>
      <hr>
      <p id="example"></p>
    </div>
  </div>
</div>
<script>
  function openPopup(text) {
    document.getElementById("example").innerHTML = text;
    document.getElementById("popup").style.display = "block";
  }

  function closePopup() {
    document.getElementById("popup").style.display = "none";
  }
</script>




<% String nav = (String) request.getAttribute("roleId");   %>


<% if (nav.equals("3")) { %>
<jsp:include page="/NavBar.jsp" flush="true"/>
<% }%>

<% if (nav.equals("2")) { %>
<jsp:include page="/NavBarAdmin.jsp" flush="true"/>
<% }%>

<% if (nav.equals("1")) { %>
<jsp:include page="/NavBarDirector.jsp" flush="true"/>
<% }%>









