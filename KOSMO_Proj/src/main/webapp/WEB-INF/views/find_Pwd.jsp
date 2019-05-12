<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function(){
	//이메일 선택용
	$('#email2').change(function(){
		$("#email2 option:gt(0):selected").each(function() {
			var email = $('#email').val();
			if(email.includes("@")){
				$('#email').val(email.split('@')[0]+"@"+$(this).html());
			}
			else {
				$('#email').val(email+"@"+$(this).html());
			}
		});
	});
	
})
</script>
<style>
	.form-label-group input #name{
		background-color: white; !important;
	}
</style>
<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">비밀번호 찾기 페이지</h1>
			<form action="<c:url value='/findPwd.kosmo'/>">
			<div class="myCardList">
				<div class="text-center">
					<div class="form-label-group" style="width : 50%; margin-left : 25%">
						<input type="text" id="id" name="id" class="form-control" placeholder="아이디" required>
						<label for="id" style="text-align : left;">아이디</label>
					</div>
					
					<div class="form-label-group" style="width : 50%; margin-left : 25%">
						<input type="text" id="name" name="name" class="form-control" placeholder="이름" required>
						<label for="name" style="text-align : left;">이름</label>
					</div>
						
					<div class="form-label-group" style="width : 50%; margin-left : 25%">
							<div class="input-group">
								<input type="email" id="email" name="email" style="background-color: white;" class="form-control" placeholder="이메일" required>
								<label for="email" style="text-align : left;">이메일</label>
								<div class="input-group-append">
									<select class="form-control" id="email2" name="email2">
										<option>E-Mail 선택</option>
										<option>naver.com</option>
										<option>hanmail.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
									</select>
								</div>
							</div>
						</div>
					<div class="mt-1">
						<button type="submit" class="yellowBt" style="border-radius: 30px; border : 0px; outline : 0px;">확인</button> 
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>