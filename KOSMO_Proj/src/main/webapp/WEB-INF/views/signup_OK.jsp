<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <link rel="stylesheet" href="Bootstrap/login&mypage/mypage.css">
 <link rel="stylesheet" href="Bootstrap/login&mypage/carpoolborder.css">

<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">회원가입을 축하합니다!</h1>
			<div class="myCardList">
				<div class="text-center">
					<p class="txt1 secret">
						이메일 인증을 완료했습니다!<br>로그인 후 이용하세요.
					</p>
					<div class="mt-1">
					<button id="gologin" class="yellowBt" 
								style="color: white; border-radius: 30px; border: 0px; outline: 0px; text-align: center;">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$('#gologin').click(function(){
			location.replace('login_page.kosmo');
		})
		
	})
</script>