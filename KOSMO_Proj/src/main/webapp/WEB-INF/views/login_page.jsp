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
												<input type="checkbox" class="custom-control-input" id="checkbox">
												<label class="custom-control-label" for="checkbox">아이디 저장</label>
											</div>
											<button class="btn btn-lg btn-block btn-login font-weight-bold mb-2" type="submit">로그인</button>
										</form>
									</div>
								</sec:authorize>
								<div class="text-center">
									<a class="small" href="#">아이디 찾기</a> | 
									<a class="small" href="#">비밀번호 찾기</a> | 
									<a class="small" href="<c:url value='/sign_up_page.kosmo'/>">회원 가입</a>
								</div>
								<a id="kakao-login-btn">카톡버튼</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('c697b4f59516842004ed550968ca1155'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			alert(JSON.stringify(authObj));
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	//]]>

	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
					alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
					console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
					console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
					console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
					// res.properties.nickname으로도 접근 가능 )
					console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
				}
			})
		},

		fail : function(error) {
			alert(JSON.stringify(error));
		}
	});

	//]]>
</script>


