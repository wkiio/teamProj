<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id" />
</sec:authorize>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id" />
</sec:authorize>

	<header id="header" class="jnr__header header--one clearfix">
			<!-- Start Header Top Area -->
			<div class="junior__header__top">
				<div class="container">
					<div class="row">
						<div class="col-md-7 col-lg-6 col-sm-12">
							<div class="jun__header__top__left">
								<ul class="top__address d-flex justify-content-start align-items-center flex-wrap flex-lg-nowrap flex-md-nowrap">
									<li><i class="fa fa-envelope"></i><a href="#">csj_910226@gmail.com</a></li>
									<li><i class="fa fa-phone"></i><span>관리자 번호:</span><a href="#">010-9781-7521</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-5 col-lg-6 col-sm-12">
							<div class="jun__header__top__right">
								<ul class="accounting d-flex justify-content-lg-end justify-content-md-end justify-content-start align-items-center">
									<%-- 로그인 시큐리티 추가 --%>
									<sec:authorize access="isAnonymous()">
									<li><a href="login_page.kosmo">로그인</a></li>
									<li><a href="sign_up_page.kosmo">회원가입</a></li>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
									<li style="margin-right: 10px;"><span>${id }님</span></li>
				        			<li style="margin-right: 10px;"><a href="javascript:logout()">로그아웃</a></li>
									</sec:authorize>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Header Top Area -->
			<!-- Start Mainmenu Area -->
			<div class="mainmenu__wrapper bg__cat--1 poss-relative header_top_line sticky__header">
				<div class="container">
					<div class="row d-none d-lg-flex">
						<div class="col-sm-4 col-md-6 col-lg-2 order-1 order-lg-1">
							<div class="logo">
								<a href="index.kosmo">
									<img src="resources/images/Aran1.png" alt="logo images" style="height:100px">
								</a>
							</div>
						</div>
						<div class="col-sm-4 col-md-2 col-lg-9 order-3 order-lg-2">
							<div class="mainmenu__wrap">
								<nav class="mainmenu__nav">
                                    <ul class="mainmenu">
                                        <li class="drop"><a href="index.kosmo">메인</a></li>
                                        <li class="drop"><a href="serviceclick.kosmo">서비스</a>
                                        <ul class="dropdown__menu">
                                                <li><a href="carregister.kosmo">이동입력</a></li>
                                                <li><a href="Carindex.kosmo">이동리스트</a></li>
                                                <li><a href="daum.kosmo">지도검색</a></li>
                                                <li><a href="aiApi.kosmo">베이비페어</a></li>                                             
                                            </ul>
                                        </li>
                                        <li class="drop"><a href="calendar.kosmo">육아달력</a></li>
                                        <li class="drop"><a href="babyinfo.kosmo">육아정보</a></li>
                                        <li class="drop"><a href="chatView.kosmo">채팅(미정)</a></li>
                                        <li class="drop"><a href="blookChain.kosmo">검증</a></li>
                                        <li class="drop"><a href="guestbook.kosmo">검증</a></li>
                                        <li class="drop"><a href="#">마이페이지</a>
                                            <ul class="dropdown__menu">
                                                <li><a href="mypage_one.kosmo">개인정보</a></li>
                                                <li><a href="Carreservation.kosmo">예약현황</a></li>                                                
                                            </ul>
                                        </li>   
                                        	<c:set var="loginid" value="${id}" />
										<c:if test="${loginid == 'admin'}">
											<li><a href="admin_index.kosmo">관리자페이지</a></li>
										</c:if>  
                                    </ul>
                                </nav>
							</div>
						</div>						
					</div>
					<!-- Mobile Menu -->
                    <div class="mobile-menu d-block d-lg-none">
                    	<div class="logo">
                    		<a href="index.html"><img src="/Bootstrap/junior/images/logo/junior.png" alt="logo"></a>
                    	</div>
                    	<a class="minicart-trigger" href="#">
                    		<i class="fa fa-shopping-basket"></i>
                    	</a>
                    </div>
                    <!-- Mobile Menu -->
				</div>
			</div>
			<!-- End Mainmenu Area -->
		
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
