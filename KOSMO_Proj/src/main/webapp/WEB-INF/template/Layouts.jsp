<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>


<html lang="en">
  <head>
  	
    <title>육아육아해</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- 카톡로그인 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

	<!-- 필수 CSS -->
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="Bootstrap/css/magnific-popup.css">
	<link rel="stylesheet" href="Bootstrap/css/jquery-ui.css">
	<link rel="stylesheet" href="Bootstrap/css/aos.css">
	<!-- 아이콘 -->
    <link rel="stylesheet" href="Bootstrap/fonts/icomoon/style.css">

	<!-- 기본 스타일 -->
	<link rel="stylesheet" href="/baby/resources/css/style.css">
	
    <!-- 캐러셀 -->
    <link rel="stylesheet" href="/baby/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/baby/resources/css/owl.theme.default.min.css">

    <!-- 라이트 박스 -->
    <link rel="stylesheet" href="/baby/resources/css/ekko-lightbox.css">
    
    <!-- 로그인, 회원가입 -->
    <link rel="stylesheet" href="/baby/resources/css/login.css">
    <!-- 마이페이지 -->
    <link rel="stylesheet" href="/baby/resources/css/mypage.css">
    <!-- 마이페이지 -->
    <link rel="stylesheet" href="/baby/resources/css/carpoolborder.css">
    
    
    <!-- 필수 JS-->
    <script src="Bootstrap/js/jquery-3.3.1.js"></script>
    <script src="Bootstrap/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="Bootstrap/js/jquery-ui.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
    <script src="Bootstrap/js/jquery.magnific-popup.min.js"></script>
    <script src="Bootstrap/js/popper.min.js"></script>
    <script src="Bootstrap/js/aos.js"></script>
    
    <!-- 스크롤 효과 -->
    <script src="Bootstrap/js/jquery.stellar.min.js"></script>
   
    <!-- 캐러셀 -->
	<script src="Bootstrap/js/owl.carousel.min.js"></script>
	
	<!-- 라이트 박스 -->
	<script src="Bootstrap/js/ekko-lightbox.js"></script>
  </head>
  
<body>
	<!-- 모바일 메뉴 -->
	<div class="site-mobile-menu">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	<!-- 탑 부분  -->
	<tiles:insertAttribute name="Top"/>
	<!-- 바디부분 -->
	<tiles:insertAttribute name="Body"/>
	<!-- 푸터 부분 -->
	<tiles:insertAttribute name="Footer"/>

	
</body>
</html>