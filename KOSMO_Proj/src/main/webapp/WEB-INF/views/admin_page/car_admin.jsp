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
    
    
  	<style>
h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 900;
  text-align: center;
  background-color: #302f2f;
  
}
table{
  width:100%;
  table-layout: fixed;
  font-color : #ffffff;
}
.tbl-header{
 background-color: #302f2f;
 color : #ffffff;
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;

}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 900;
  font-size: 20px;
  color : #ffffff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-size: 13px;
  font-weight : 900;
  color : #302f2f;
  border-bottom: solid 1px rgba(0,0,0,1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
 
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}

#cartable{
  background: -webkit-linear-gradient(left, #ffffff, #ffffff);
  background: linear-gradient(to right, #ffffff, #ffffff);
  color : #262022;
}

/*  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4); */


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}


/*테이블 감추는거 */
.table tr {
    cursor: pointer;
}
.hiddenRow {
    padding: 0 4px !important;
}


</style>
  	



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
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="index.html">Dashboard 1</a>
                                </li>
                                <li>
                                    <a href="index2.html">Dashboard 2</a>
                                </li>
                                <li>
                                    <a href="index3.html">Dashboard 3</a>
                                </li>
                                <li>
                                    <a href="index4.html">Dashboard 4</a>
                                </li>
                            </ul>
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
                    <img src="resources/images/Aran.png" alt="Cool Admin" style="height:60px;width:190px;padding-left: 20px" />
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
                            <a href="calendar_admin.kosmo">
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
                                            <img src="resources/images/Aran2.png" alt="Aran2" />
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
                                    <h2 class="title-1">회원 관리</h2>
                                   <!--  <button class="au-btn au-btn-icon au-btn--blue">
                                        <i class="zmdi zmdi-plus"></i>add item</button> -->
                                </div>
                            </div>
                        </div>
                        <div class="row col-md-12 " style="padding-top:20px; ">
                        
                        <!-- 입력할 공간 -->
							
								<nav class="nav nav-tabs" id="nav-tab" role="tablist" >
									<a class="nav-item nav-link active" id="nav-home-tab"
										data-toggle="tab" href="#nav-home" role="tab"
										aria-controls="home" aria-expanded="true">현재 예약</a> <a
										class="nav-item nav-link" id="nav-profile-tab"
										data-toggle="tab" href="#nav-profile" role="tab"
										aria-controls="profile" aria-expanded="false">완료 예약</a>
								</nav>
								<div class="tab-content" id="nav-tabContent">
									<div class="tab-pane fade active show" id="nav-home"
										role="tabpanel" aria-labelledby="nav-home-tab"
										aria-expanded="true">
										<section id="cartable"  style="border: 3px solid rgba(0,0,0,0.1);">
											<!--for demo wrap-->
											<h1>현재 예약현황</h1>
											<div class="tbl-header">
												<table cellpadding="0" cellspacing="0" border="0">
													<thead>
														<tr>
															<th>이용고객(탑승자->운전자)</th>
															<th>출발</th>
															<th>도착</th>
															<th>상태</th>
															
														</tr>														
													</thead>
												</table>
											</div>
											<div class="tbl-content">
												<table cellpadding="0" cellspacing="0" border="0">
													<tbody>
														<c:forEach var="car" items="${car_list}" >
														 <tr class="demo${car.RS_NO}">																
															<td> ${car.TNAME }-> ${car.DNAME} </td>
															<td>${car.STARTPOINT}</td>
															<td>${car.ENDPOINT} </td>
															<td>${car.FINISH eq '1' ? "계약완료" : "예약진행중"}</td>														  	  
														</tr>
														<tr>
														<td class="SlideDownup" id="demo${car.RS_NO}" colspan="4">
															<div style="border: 1px solid #2d2a2a;">															
																<table >
																	<tr>
																		<td>탑승자   :</td>
																		<td>${ car.TNAME}</td>
																		<td>운전자    :  </td>
																		<td>${car.DNAME}</td>
																		<td>차량 : </td>
																		<td>${car.CARTYPE}</td>
																	</tr>
																	<tr>
																		<td>금액   :</td>
																		<td>${car.PRICE}</td>
																		<td>날짜   :</td>
																		<td>${car.TIME}</td>
																	</tr>
																	
																	<tr>
																		<td colspan='2' style="text-align: left;">추가내용 :
																			${car.CONTENT}</td>
																	</tr>
																</table>
															</div>
														</td>
													</tr>
														</c:forEach>
													
														<tr>
															<td>#</td>
															<td>#</td>
															<td>#</td>
															<td>#</td>
														</tr>
													</tbody>
												</table>
											</div>
										</section>

										<!-- follow me template -->
										<div class="made-with-love">
											Made with <i>♥</i> by <a target="_blank"
												href="https://codepen.io/nikhil8krishnan">Nikhil
												Krishnan</a>
										</div>

									</div>
									<div class="tab-pane fade" id="nav-profile" role="tabpanel"
										aria-labelledby="nav-profile-tab" aria-expanded="false">
									</div>
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
    
    <script>
    
    $(function(){
    	$('.SlideDownup').hide();
    	
    	var temptitle;
    	
    	
    	$('.tbl-content tbody tr').click(function(){    		
    		$('.SlideDownup').hide();    		
    		var no = $(this).attr("class");    		 
    		
    		var bb = "#" + no + "";
    		if(temptitle != no){
    			$(bb).show();
    			temptitle = no;
    		}
    		else
    			temptitle="";
    		
    		
    	});
    
    	
    });
    
    
    </script>
 

</body>

</html>
<!-- end document-->
