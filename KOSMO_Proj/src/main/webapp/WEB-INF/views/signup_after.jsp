<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">회원가입을 축하합니다!</h1>
			<div class="myCardList">
				<div class="text-center">
					<p class="txt1 secret">
						등록하신 이메일로 인증코드를 보냈습니다.<br> 인증 후에 서비스를 이용가능합니다.
						<br>인증코드를 클릭하여 인증하기 전까지 로그인이 불가능합니다.
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