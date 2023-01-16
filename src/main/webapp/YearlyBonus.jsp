<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 1/16/2023
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .slidecontainer {
        width: 100%;
    }

    .slider {
        -webkit-appearance: none;
        width: 100%;
        height: 10px;
        border-radius: 5px;
        background: skyblue;
        outline: none;
        opacity: 0.7;
        -webkit-transition: .2s;
        transition: opacity .2s;
    }

    .slider:hover {
        opacity: 1;
    }

    .slider::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 23px;
        height: 24px;
        border: 0;
        cursor: pointer;
    }

    .slider::-moz-range-thumb {
        width: 23px;
        height: 24px;
        border: 0;
        cursor: pointer;
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
                <h1>Yearly Bonus</h1>
                <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing"></div>
                <div class="table-responsive">
                    <div class="statbox widget box box-shadow">
                        <div class="widget-header p-4">
                            <div >
                                <div>
                                </div>


                                <form method="post">
                                <div class="slidecontainer">
                                    <input type="range" min="1" max="100" name="Deiaa" value="50" class="slider" id="myRange">
                                    <p>Value: <span id="demo"></span></p>
                                </div>

                                    <div class="d-flex flex-row justify-content-center mt-5 ">
                                        <input type="submit" class="btn btn-primary btn-lg" value="Yearly Bouns">
                                    </div>
                                </form>


                            </div>
                        </div>
                        <div class="widget-content widget-content-area">
                            <div class="table-responsive">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--  BEGIN FOOTER  -->
    <script>
        var slider = document.getElementById("myRange");
        var output = document.getElementById("demo");
        output.innerHTML = slider.value;

        slider.oninput = function() {
            output.innerHTML = this.value;
        }
    </script>
    <!--  END FOOTER  -->
</div>
<%@include file="/NavBarVp.jsp"%>