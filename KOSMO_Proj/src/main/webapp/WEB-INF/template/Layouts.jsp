<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<html>
  <head>
  	
    <title>Aran</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
   	<meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>
  
  
  
<body>
	  
    <!-- Favicons -->
	<!-- <link rel="shortcut icon" href="/baby/resources/images/favicon.ico">
	<link rel="apple-touch-icon" href="images/icon.png"> -->
	<!-- Google font (font-family: 'Lobster', Open+Sans;) -->
	<link href="https://fonts.googleapis.com/css?family=Lobster+Two:400,400i,700,700i" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Bubblegum+Sans" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="Bootstrap/junior/css/bootstrap.min.css">
	<link rel="stylesheet" href="Bootstrap/junior/css/plugins.css">
	<link rel="stylesheet" href="Bootstrap/junior/style.css">	
	<link rel="stylesheet" href="resources/css/magnific-popup.css">
	<link rel="stylesheet" href="resources/css/jquery-ui.css">
	<link rel="stylesheet" href="resources/css/aos.css">
	
	 <!-- 라이트 박스 -->
    <link rel="stylesheet" href="/baby/resources/css/ekko-lightbox.css">

    
	<!-- Cusom css -->
   <link rel="stylesheet" href="Bootstrap/junior/css/custom.css">

   
	<!-- Modernizer js -->
	<script src="Bootstrap/junior/js/modernizr-3.5.0.min.js"></script>
	 <!-- JS Files -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 	<script src="Bootstrap/junior/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
 	<script src="//code.jquery.com/jquery.min.js"></script>
 	
	<div class="wrapper" id="wrapper">
	<!-- 탑 부분  -->
	<tiles:insertAttribute name="Top"/>
	<!-- 바디부분 -->
	<tiles:insertAttribute name="Body"/>	
	
	<!-- 푸터 부분 -->
	<tiles:insertAttribute name="Footer"/>
	</div>
	
 	 	
 	
 	<script src="Bootstrap/junior/js/popper.min.js"></script>
	<script src="Bootstrap/junior/js/bootstrap.min.js"></script>	
	
	
	
 	
<!-- 	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script> -->
	<script src="Bootstrap/junior/js/plugins.js"></script>
 	<script src="Bootstrap/junior/js/active.js"></script> 
	
	<script src="resources/js/aos.js"></script>
	<!-- 라이트 박스 -->
	<script src="resources/js/ekko-lightbox.js"></script>
	 
</body>
</html>