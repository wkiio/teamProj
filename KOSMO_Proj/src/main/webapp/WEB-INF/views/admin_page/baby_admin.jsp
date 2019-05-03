<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 시큐리티 -->
 	<sec:authentication property="principal.username" var="id"/>


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
                    <img src="resources/Baby/Aran.png" alt="Cool Admin" style="height:60px;width:190px;padding-left: 20px" />
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
            <div class="main-content" style="z-index: 100">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">육아 게시판 관리</h2>
                                   <!--  <button class="au-btn au-btn-icon au-btn--blue">
                                        <i class="zmdi zmdi-plus"></i>add item</button> -->
                                </div>
                            </div>
                        </div>
                        <div class="row col-md-11 " style="padding-top:20px">                        	
							
							<div class="table-responsive">
                                    <table id="tablego"class="table table-borderless table-data3" style="text-align: center;">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>내용</th>
                                                <th>링크(url)</th>
                                                <th>썸네일 주소</th>
                                            </tr>
                                        </thead>
                                        <tbody class="babyTable">   
                                                  
                                        </tbody>
                                    </table>
                                </div>	
						</div>
						<!-- 모달 -->
						
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
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		  <div class="modal-dialog" role="document" >
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">육아 게시판 수정하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<div class="form-group">
                    <label for="inputName">내용</label>                  
                     <textarea class="form-control" id="inputContext"></textarea>
                </div>
               <div class="form-group">
                    <label for="inputName">링크(URL)</label>
                    <input type="text" class="form-control123" id="inputUrl">
                </div>
                <div class="form-group">
                    <label for="inputName">썸네일주소</label>
                    <input type="text" class="form-control" id="inputThumbnail">
                </div>                
		      </div>
		      <div class="modal-footer">		        
		        <button type="button" class="btn btn-primary" id="clickbutton_modal" data-dismiss="modal">수정</button>
		      </div>
		    </div>
		  </div>
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
    
 
    var noo;
    var istrue=false;
    $(function(){
    	showtable();
        console.log(istrue);
    	
    	
    	
    	 $("#clickbutton_modal").click(function(){
			var title = $(".modal #inputContext").val();
			var url = $(".modal #inputUrl").val();
			var thumbnail =  $(".modal #inputThumbnail").val();  			
			
			$.ajax({
				type:"POST",
				data : {'no' : noo,'title' : title, 'url' : url, 'thumbnail' : thumbnail,"${_csrf.parameterName}" : "${_csrf.token}"},
				url:"<c:url value='/babyupdate.kosmo'/>",
				dataType:"json",
				success :function(data){  
					$('.babyTable').empty();				
					showtable();
	    			
				}   						
			});
			
			
		}); 
    });
    
    
    var showtable = function(){
    	$.ajax({
    		data : {"${_csrf.parameterName}" : "${_csrf.token}"}, 
    		type: "POST",
    		url : "<c:url value='/babyTable.kosmo'/>",
    		dataType : "json",
    		success:function(data){
    			var html = "<tr>";
    			$.each(data,function(index,baby){    				
    				html+="<td>"+baby['NO']+"</td>"+"<td>"+baby['TITLE']+"</td>"+"<td>"+baby['URL']+"</td>"+"<td>"+baby['THUMBNAIL']+"</td></tr>";    				
    			});    			
    			istrue = true;
    			$('.babyTable').html(html);   
    			console.log(istrue);
    			console.log("dd");
        		$("#tablego tr").click(function(){
    				var tr = $(this);
    				var td = tr.children();
    				
    				var tno = td.eq(0).text();
    				noo = tno;
    				//alert(noo);
    				
    				$.ajax({
    					type:"POST",
    					data : {'no' : tno,"${_csrf.parameterName}" : "${_csrf.token}"},
    					url:"<c:url value='/babyreturnNo.kosmo'/>",
    					dataType : "json",    					
    					success:function(data){
    						console.log("성공");
    						$.each(data,function(index,baby){
    							$(".modal #inputContext").val(baby["TITLE"]);
    							$(".modal #inputUrl").val(baby["URL"]);
    							$(".modal #inputThumbnail").val(baby["THUMBNAIL"]);  						
    							
    						});    						
    					}   					    					
    				});
    				$("#exampleModal").modal();    				    				
    			});
    		}
    	});
    };
    
    </script>
    
 

</body>

</html>
<!-- end document-->
