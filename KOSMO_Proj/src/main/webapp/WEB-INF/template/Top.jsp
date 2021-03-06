<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id" />
</sec:authorize>

<header class="site-navbar" role="banner">
	<div class="container-fluid" style="border-bottom: 2px solid #ff6a00;">
		<div class="row align-items-center">
			<div data-aos="fade-down">
				<img src="resources/images/Aran.png" alt="img" class="img"
					style="width: 50px; height: 50px;">
			</div>
			<div class="col-offset-3 col-xl-offset-3" data-aos="fade-down">
				<h1 class="mb-0">
					<a href="index.kosmo" class="text-black h2 mb-0">Aran(아란)</a>
				</h1>
			</div>

			<ul class="site-menu ml-auto list-unstyled d-flex text-right mb-0"
				data-class="social" data-aos="fade-down">
				<%-- 0424 pm 4:00 로그인 시큐리티 추가 --%>
				<sec:authorize access="isAnonymous()">
					<li><a href="login_page.kosmo" class="pl-0 pr-3 text-black">로그인</a></li>
					<li><a href="sign_up_page.kosmo" class="pl-3 pr-3 text-black">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li style="margin-right: 10px;"><span>${id }님</span></li>
        			<li style="margin-right: 10px;"><a href="javascript:logout()">로그아웃</a></li>
				</sec:authorize>
			</ul>

			<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
				style="position: relative; top: 3px;">
				<a href="#" class="site-menu-toggle js-menu-toggle text-black">
					<span class="icon-menu h3"></span>
				</a>
			</div>
			<div class="col-12 col-md-12 d-none d-xl-block " data-aos="fade-down">
				<nav
					class="site-navigation position-relative text-right text-lg-center"
					role="navigation">
					<ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
						<li class="has-children active"><a href="index.kosmo">메인</a>
							<ul class="dropdown">
								<li><a href="word.kosmo">실시간검색</a></li>
								<li><a href="wordCloud.kosmo">실시간검색cloud</a></li>
							</ul>
						</li>
						<li class="has-children"><a href="serviceclick.kosmo">서비스</a>
							<ul class="dropdown">
								<li><a href="carregister.kosmo">이동입력</a></li>
								<li><a href="Carindex.kosmo">이동리스트</a></li>
								<li><a href="daum.kosmo">지도검색</a></li>
								<li><a href="aiApi.kosmo">베이비페어</a></li>
							</ul></li>
						<li><a href="calendar.kosmo">육아달력</a></li>
						<li><a href="babyinfo.kosmo">육아정보</a></li>
						<li class="has-children active"><a href="#">마이페이지</a>
							<ul class="dropdown">
								<li><a href="mypage_one.kosmo">개인정보</a></li>
								<li><a href="Carreservation.kosmo">예약현황</a></li>
							</ul></li>
							<c:set var="loginid" value="${id}" />
						<c:if test="${loginid == 'admin'}">
							<li><a href="admin_index.kosmo">관리자페이지</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<%-- 시큐리티 적용 코드 시작 --%>
	<script>
	//csrf 사용시에만 아래 코드를 작성한다.
		function logout(){
			$('#logoutForm').submit();
		}
	</script>
		<form id="logoutForm" method="POST" action="<c:url value='/logout'/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	<%-- 시큐리티 적용 코드 끝 --%>
	
</header>
