<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   <!-- 카풀map시작-->
   <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=b5cc2a5e-34c4-441b-96f9-0a2639aabc1a"></script>
   
   <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fc37be4712f8b89b167cddbc490382f"></script> -->
<style>

.carview_title {
  border-top: 3px solid #4fbdc4;
}
.carview_title .title_img {
  height: 60px;
  line-height: 60px;
  padding-left: 62px;
  display:inline-block;
  color: #4fbdc4;
  font-weight: bold;
  font-size: 18px;
  background-image: url("/baby/resources/images/car_icon.png");
  background-repeat: no-repeat;
  background-size: contain;
  
}
.carview_title .title_text {
  display:inline-block; 
  color: #9d9d9d;
  font-size: 16px;
  font-weight: bold;
  margin-left: 20px;
  
}
.table-responsive th {
  width: 100px;
}
.table-responsive td {
  width: 300px;
}
.table-responsive tbody th {
  text-align: center;
}

.table-responsive thead td {
  vertical-align: middle;
  font-size: 15px;
}
.table-responsive thead span {
  margin-right: 5px;
}
.carview_sub {
  height:174px;
  margin-bottom: 40px;
  border: 1px solid #4ebdc4;
  border-radius: 3px;
  border-bottom-width: 3px;
}

.carview_sub .carview_profile {
  padding: 15px 10px;
  text-align: center;
  border-radius: 3px;
  color: #303333;
  background-color: #edf7f8;
}
.carview_content {
  padding-right: 0;
}

.carview_profile .btn-info{
  border-radius: 10px;
}


.carview_coment h2{
  border-top: 3px solid #4fbdc4;
  height: 35px;
  line-height: 35px;
  text-indent: 5px;
  color: #4fbdc4;
  font-size: 16px;
}

.carview_coment .coment {
  min-height: 130px;
  padding: 10px;
  line-height: 20px;
  border: 1px solid #e1e1e1;
  border-radius: 5px;
  font-size: 13px;
}
.list_btn {
  margin-top: 35px;
}
.list_btn button {
  border-radius: 5px;
}
.box_map{
   height: 400px;
   width: 100%;
}

#memberphoto {
  width: 70px;
  height: 70px;
}

</style>
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id" />
</sec:authorize>


<div class="site-section" style="padding: 2em;">
   <div class="container">
		<div class="row no-gutter">
			<!-- 프로필 -->
			<div class="col-md-2">
				<div class="carview_sub">
					<div class="carview_profile">
	
						<figure class="profile">
							<img id="memberphoto" src="<c:url value='/resources/memberPhoto/${photo }'/>" title="프로필" alt="프로필" class="picture">
							<figcaption class="name">${dto.name }</figcaption>
						</figure>
						<button type="button" class="btn btn-info">메시지 보내기</button>
						<div class="mt-1">
							
						</div>
					</div>
				</div>
			</div>
			<form class="carviewform" action="CarpoolSubmit.kosmo" method="post">
				<div class="carview_content col">
	
					<div class="carview_title">
						<h1 class="title_img">단기 카풀</h1>
						<h2 class="title_text">태워주세요</h2>
					</div>
					<input type="hidden" value="${dto.start_xpos }" id="s_xpos" name="s_xpos">
					<input type="hidden" value="${dto.start_ypos }" id="s_ypos" name="s_ypos">
					<input type="hidden" value="${dto.end_xpos }" id="e_xpos" name="e_xpos">
					<input type="hidden" value="${dto.end_ypos }" id="e_ypos" name="e_ypos">
					<input type="hidden" value="${dto.cp_no }" id="cp_no" name="cp_no">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" value="${dto.startpoint }" id="startpoint" name="startpoint">
					<input type="hidden" value="${dto.endpoint }" id="endpoint" name="endpoint">
					<input type="hidden" value="${dto.time}" id="time" name="time">
					<input type="hidden" value="${dto.type }" id="type" name="type">
					<input type="hidden" value="${dto.price }" id="price" name="price">
					<input type="hidden" value='${dto.content}' id="content" name="content">
					<input type="hidden" value='${dto.carseat}' id="carseat" name="carseat">
					<div class="table-responsive" style="overflow-x:hidden;">
						<table class="table table-bordered">
							<thead class="table-borderless">
								<tr>
									<th class="pl-4"><span>출발</span> <img
										src="/baby/Bootstrap/images/2.jpg" title="출발지" alt="출발지">
									</th>
									<td>${dto.startpoint }</td>
									<th class="pl-4"><span>도착</span> <img
										src="/baby/Bootstrap/images/3.jpg" title="출발지" alt="출발지">
									</th>
									<td>${dto.endpoint }</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>출발일시</th>
									<td>${dto.time}</td>
									<th>비용</th>
									<td>${dto.price }원</td>
									
								</tr>
								<tr>
									<th>유형</th>
									<td>${dto.type }</td>
									<th>카시트</th>
									<td>${dto.carseat }</td>
								</tr>
								<tr>
									<th>평점</th>
									<td>${score }</td>
									<th>차종</th>
									<td>${dto.cartype }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 지도 -->
					<!-- <div id="map" class="box_map"></div> -->
					<div id="initmap">
						<div id="map_div"></div>
						<p id="result"></p>
					</div>
					<!-- 추가내용 -->
					<div class="carview_coment">
						<h2>추가내용</h2>
						<div class="coment">${dto.content}</div>
					</div>
					
					<c:set var="borderid" value="${dto.id}" />
					<c:set var="loginid" value="${id}" />
					
					<div class="list_btn text-center">
						<c:if test="${borderid == loginid}" var="userMatch">
							<button type="button" class="btn btn-info" id="edit">수정</button>
							<button type="button" class="btn btn-info" id="delete">삭제</button>
						</c:if>
						<c:if test="${!userMatch }">
							<button type="submit" class="btn btn-info">예약</button>
						</c:if>
						<a href="Carindex.kosmo"><button type="button" class="btn btn-info">목록 보기</button></a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	$('#edit').click(function(){
		console.log("asdfdsfgsdfg");
		$('.carviewform').prop('action','Caredit.kosmo');
		$('.carviewform').submit();
	});
	
	$('#delete').click(function(){
		$('.carviewform').prop('action','Cardelete.kosmo');
		$('.carviewform').submit();
	});

</script>

<script src="Bootstrap/js/Carload.js"></script>
