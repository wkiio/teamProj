<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp" %>
<c:if test="${error }">
<script>
alert("가입 정보와 일치하지 않습니다!");
location.replace('<c:url value="/mypage_one.kosmo"/>');
</script>
</c:if>

<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">비밀번호 확인</h1>
			<form action="mypageCheck.kosmo">
			<div class="myCardList">
				<div class="text-center">
					<p class="txt1 secret">
						회원님의 정보를 안전하게 보호하기 위해<br>회원 로그인 비밀번호를 다시 한 번 확인합니다
					</p>
					<div class="input-area">
					<input class="form-control" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="password" id="pwd" name="pwd" value="" placeholder="비밀번호를 입력해주세요" autocomplete="off">
					</div>
					<div class="mt-1">
						<button type="submit" class="yellowBt">확인</button> 
						
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>