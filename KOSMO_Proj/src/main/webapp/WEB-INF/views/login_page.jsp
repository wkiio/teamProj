<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<div class="site-section" style="padding: 2em;">
	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
			<div class="col-md-8 col-lg-6">
				<div class="login d-flex align-items-center py-5">
					<div class="container">
						<div class="row">
							<div class="col-md-9 col-lg-8 mx-auto">
								<h3 class="login-heading mb-4">로그인 페이지</h3>
								<sec:authorize access="isAnonymous()">
									<c:if test="${param.error != null}">
										<h3>아이디와 비밀번호가 틀려요.</h3>
									</c:if>
									<div class="col-md-12">
										<form class="form-horizontal" method="post" action="<c:url value='/Login.kosmo'/>">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											
											<div class="form-label-group">
												<input type="text" id="id" name="id" class="form-control"
													placeholder="아이디를 입력해주세요" required autofocus>
													<label for="id">아이디</label>
											</div>
											<div class="form-label-group">
												<input type="password" id="pwd" name="pwd" class="form-control"
													placeholder="비밀번호를 입력해주세요" required>
													<label for="pwd">비밀번호</label>
											</div>
											<div class="custom-control custom-checkbox mb-3">
												<input type="checkbox" id="idSaveCheck">
												<label for="checkbox">아이디 저장</label>
											</div>
											<button class="btn btn-lg btn-block btn-login font-weight-bold mb-2" type="submit">로그인</button>
										</form>
									</div>
								</sec:authorize>
								<div class="text-center">
									<a class="small" href="<c:url value='/find_Id.kosmo'/>">아이디 찾기</a> | 
									<a class="small" href="<c:url value='/find_Pwd.kosmo'/>">비밀번호 찾기</a> | 
									<a class="small" href="<c:url value='/sign_up_page.kosmo'/>">회원 가입</a>
								</div>
								
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type='text/javascript'>
	
	$(document).ready(function(){
	    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
	    $("input[name='id']").val(userInputId); 
	     
	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                           // 아이디 저장하기 체크되어있을 시,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>


