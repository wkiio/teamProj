<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#serviceImg {
	width: 250px;
	height: 250px;
}

#serviceDiv {
	height: 600px;
	margin: auto;
	text-align: center;
}

#serviceChoice {
	font-size: 1.5em;
	margin-top: 15%;
}
</style>

<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-md-12" id="serviceDiv">
			<div id="serviceChoice">서비스 선택 페이지</div>
			<a href="daumapi.kosmo">
					<img id="serviceImg" src="./Bootstrap/images/map1.png" alt="맵 이미지1"
						title="병원 등 공공장소를 검색합니다." />
			</a>
			<a href="Car.kosmo">
				<img id="serviceImg" src="./Bootstrap/images/car1.png" alt="자동차 이미지1"
					title="카풀 이용 사이트로 이동합니다." />
			</a>
		</div>
	</div>
</div>


<!-- 그리드 시스템 : 12칸으로 나눠져있다. -->