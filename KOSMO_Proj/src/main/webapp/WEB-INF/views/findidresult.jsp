<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty id and empty pwd }">
<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">아이디 찾기</h1>
			<div class="myCardList">
				<div class="text-center">
					<p class="txt1 secret">
						회원님의 현재 가입하신 아이디는  ${id } 입니다.
					</p>
					<div class="mt-1">
						<a href="login_page.kosmo" class="yellowBt" style="color:white; border-radius: 30px; border : 0px; outline : 0px;">로그인 페이지로 가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</c:if>
<c:if test="${not empty pwd }">
<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">비밀번호 찾기</h1>
			<div class="myCardList">
				<div class="text-center">
					<p class="txt1 secret">
						 ${id } 회원님의 비밀번호는 ${pwd } 입니다
					</p>
					<div class="mt-1">
						<a href="login_page.kosmo" class="yellowBt" style="color:white; border-radius: 30px; border : 0px; outline : 0px;">로그인 페이지로 가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</c:if>

<c:if test="${not empty findError }">
<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">찾기 실패!</h1>
			<div class="myCardList">
				<div class="text-center">
					<p class="txt1 secret">
						${findError }
					</p>
					<div class="mt-1">
						<a href="login_page.kosmo" class="yellowBt" style="color:white; border-radius: 30px; border : 0px; outline : 0px;">로그인 페이지로 가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</c:if>