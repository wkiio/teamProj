<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>
    
    <!-- admin_assets/vendor/ -->

    <!-- Fontfaces CSS-->
    <link href="admin_assets/css/font-face.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all"> 
    <link href="admin_assets/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="admin_assets/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="admin_assets/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="admin_assets/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="admin_assets/css/theme.css" rel="stylesheet" media="all">
    
  


</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="index.html">
                            <img src="images/icon/logo.png" alt="CoolAdmin" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                        <li class="has-sub">
                            <a class="js-arrow" href="/admin_page/admin_index">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>                            
                        </li>
                        <li>
                            <a href="chart.html">
                                <i class="fas fa-chart-bar"></i>Charts</a>
                        </li>
                        <li>
                            <a href="table.html">
                                <i class="fas fa-table"></i>Tables</a>
                        </li>
                        <li>
                            <a href="form.html">
                                <i class="far fa-check-square"></i>Forms</a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-calendar-alt"></i>Calendar</a>
                        </li>
                        <li>
                            <a href="map.html">
                                <i class="fas fa-map-marker-alt"></i>Maps</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-copy"></i>Pages</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="login.html">Login</a>
                                </li>
                                <li>
                                    <a href="register.html">Register</a>
                                </li>
                                <li>
                                    <a href="forget-pass.html">Forget Password</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-desktop"></i>UI Elements</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="button.html">Button</a>
                                </li>
                                <li>
                                    <a href="badge.html">Badges</a>
                                </li>
                                <li>
                                    <a href="tab.html">Tabs</a>
                                </li>
                                <li>
                                    <a href="card.html">Cards</a>
                                </li>
                                <li>
                                    <a href="alert.html">Alerts</a>
                                </li>
                                <li>
                                    <a href="progress-bar.html">Progress Bars</a>
                                </li>
                                <li>
                                    <a href="modal.html">Modals</a>
                                </li>
                                <li>
                                    <a href="switch.html">Switchs</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grids</a>
                                </li>
                                <li>
                                    <a href="fontawesome.html">Fontawesome Icon</a>
                                </li>
                                <li>
                                    <a href="typo.html">Typography</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo" style="background-color:#feffd6">
                <a href="index.kosmo">
                    <img src="resources/Baby/Aran.png" alt="asdasss" style="height:60px;width:190px;padding-left: 20px" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="active has-sub">
                            <a class="js-arrow" href="admin_index.kosmo">
                                <i class="fas fa-tachometer-alt"></i>첫 화면</a>                            
                        </li>
                        <li>
                            <a href="memberTable.kosmo">
                                <i class="fas fa-chart-bar"></i>회원 관리</a>
                        </li>
                        <li>
                            <a href="car_admin.kosmo">
                                <i class="fas fa-table"></i>카풀 관리(예약현황)</a>
                        </li>
                        <li>
                            <a href="baby_admin.kosmo">
                                <i class="far fa-check-square"></i>육아 게시판 관리</a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-calendar-alt"></i>달력 및 공지사항 관리</a>
                        </li>
                       
                    
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">                             
                                <h2>Aran 관리자 모드</h2>
                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">                             
                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="resources/Baby/Aran2.png" alt="Aran2" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">Aran관리자</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#">john doe</a>
                                                    </h5>
                                                    <span class="email">johndoe@example.com</span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-account"></i>Account</a>
                                                </div>
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-settings"></i>Setting</a>
                                                </div>
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-money-box"></i>Billing</a>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="#">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">사이트 현황</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${memberCount }명</h2>
                                                <span>회원수</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${todayCount }명</h2>
                                                <span>오늘 방문자수</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-car"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${carmemberCount }명</h2>
                                                <span>카풀 인원수</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-edit"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${boardCount }개</h2>
                                                <span>게시물 수</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner">
                                        <h3 class="title-2">최근 6개월 방문자수</h3>
                                        <div class="chart-info">
                                         
                                        </div>
                                        <div class="recent-report__chart">
                                            <canvas id="barChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card chart-percent-card">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 tm-b-5">회원수대비 카풀수 비율</h3>
                                        <div class="row no-gutters">
                                            <div class="col-xl-6">
                                                <div class="chart-note-wrap">
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--blue"></span>
                                                        <span>일반회원</span>
                                                    </div>
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--red"></span>
                                                        <span>카풀회원!</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="percent-chart">
                                                    <canvas id="percent-chart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                      
                       </div>
                        <div class="row">
                        	<div class="col-lg-12" >
	                        	 <table class="table table-bordered" style="background: #ffffff">
								<thead id='thead'>
									<tr>
										<td colspan="12">
											<button type='button' style='background-color:#228ff4' class='btn btn-sm ' id='moveFastPre' onclick="moveFastMonthPre()">&laquo;</button>
											&nbsp;
											<button type='button' style='background-color:#228ff4' class='btn btn-sm ' id='movePre' onclick="moveMonthPre()">&lsaquo;</button> <!-- btn-warning -->
											&nbsp;&nbsp; 
											<span id='yearMonth'></span> &nbsp;&nbsp;
											<button type='button' style='background-color:#228ff4' class='btn btn-sm' id='moveNext' onclick="moveMonthNext()">&rsaquo;</button> 
											&nbsp;
											<button type='button' style='background-color:#228ff4' class='btn btn-sm' id='moveFastNext' onclick="moveFastMonthNext()">&raquo;</button>
											<div style="text-align: right;">
												<span>${title}</span> 
												<input class='btn btn-sm' style='background-color:#228ff4' type="button" value="주" onclick='tabWeek()' /> 
												<input class='btn btn-sm' style='background-color:#228ff4' type="button" value="월" onclick='tabMonth()' /> 
												<input class='btn btn-sm' style='background-color:#228ff4' type="button" value="목록" onclick='location.href="./coding.do"' />
											</div>
										</td>
									</tr>
									<tr>
										<td>일<span class='week'></span></td>
										<td>월<span class='week'></span></td>
										<td>화<span class='week'></span></td>
										<td>수<span class='week'></span></td>
										<td>목<span class='week'></span></td>
										<td>금<span class='week'></span></td>
										<td>토<span class='week'></span></td>
									</tr>
								</thead>
								<tbody id='tbody'></tbody>
							</table>                       
                        	
                        	</div>                    
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright Â© 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="admin_assets/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="admin_assets/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="admin_assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="admin_assets/vendor/slick/slick.min.js">
    </script>
    <script src="admin_assets/vendor/wow/wow.min.js"></script>
    <script src="admin_assets/vendor/animsition/animsition.min.js"></script>
    <script src="admin_assets/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="admin_assets/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="admin_assets/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="admin_assets/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="admin_assets/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="admin_assets/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="admin_assets/vendor/select2/select2.min.js">
    </script>
    
    <!-- Main JS-->
    <script src="admin_assets/js/main.js"></script>
    
      <!-- 캘린더 -->
	 <script src="Bootstrap/js/stringBuffer.js"></script>
	 <script  src="Bootstrap/js/calendar.js"></script>
	 <script  src="Bootstrap/js/calendarSchdule.js"></script>
	
 

</body>

</html>
<!-- end document-->
