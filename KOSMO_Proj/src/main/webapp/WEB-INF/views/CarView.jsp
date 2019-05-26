<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   <!-- 카풀map시작-->
   <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=b5cc2a5e-34c4-441b-96f9-0a2639aabc1a"></script>
     <!-- 블록체인 -->
 	<script src='/baby/resources/aranblockchain.js'></script>
 	
   <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fc37be4712f8b89b167cddbc490382f"></script> asdasdasd-->
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
							<h2>등록자</h2>
							<img id="memberphoto" src="<c:url value='/resources/memberPhoto/${photo }'/>" title="프로필" alt="프로필" class="picture">
							<figcaption class="name">${dto.name }</figcaption>
							<h5>${pre.cp_no } / ${pre.finish }</h5>
						</figure>
						<div class="mt-1">
							
						</div>
					</div>
				</div>
			</div>
			<form class="carviewform" action="CarpoolSubmit.kosmo" method="post">
				<div class="carview_content col">
	
					<div class="carview_title">
						<h1 class="title_img">카풀</h1>
					</div>
					<input type="hidden" value="${dto.start_xpos }" id="start_xpos" name="start_xpos">
					<input type="hidden" value="${dto.start_ypos }" id="start_ypos" name="start_ypos">
					<input type="hidden" value="${dto.end_xpos }" id="end_xpos" name="end_xpos">
					<input type="hidden" value="${dto.end_ypos }" id="end_ypos" name="end_ypos">
					<input type="hidden" value="${dto.cp_no }" id="cp_no" name="cp_no">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" value="${dto.startpoint }" id="startpoint" name="startpoint">
					<input type="hidden" value="${dto.endpoint }" id="endpoint" name="endpoint">
					<input type="hidden" value="${dto.time}" id="time" name="time">
					<input type="hidden" value="${dto.type }" id="type" name="type">
					<input type="hidden" value="${dto.price }" id="price" name="price">
					<input type="hidden" value='${dto.content}' id="content" name="content">
					<input type="hidden" value='${dto.carseat}' id="carseat" name="carseat">
					<input type="hidden" value='${partnerstatus}' id="partnerstatus" name="partnerstatus">
					<input type="hidden" value="" id="signed" name="signed">
				
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
								<c:if test="${partnerstatus eq '1' }">
								<tr>
									<th>평점</th>
									<td>${score }</td>
									<th>차종</th>
									<td>${dto.cartype }</td>
								</tr>
								</c:if>
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
							<c:if test="${dto.status == 0 }" var="statusfinish">
								<button type="button" class="btn btn-info" id ="resbutton">예약</button>
							</c:if>
							<c:if test="${!statusfinish }">
								<button type="button" class="btn btn-info" id="return">예약취소</button>
							</c:if>
						</c:if>
						<a href="Carindex.kosmo"><button type="button" class="btn btn-info">목록 보기</button></a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
var message;
window.addEventListener('load', async () => {
    // Modern dapp browsers...
    if (window.ethereum) {
        window.web3 = new Web3(ethereum);
        try {
            // Request account access if needed
            await ethereum.enable();
            // Acccounts now exposed
            web3.eth.sendTransaction({ /* ... */ });
        } catch (error) {
            // User denied account access...
        }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
        window.web3 = new Web3(web3.currentProvider);
        // Acccounts always exposed
        web3.eth.sendTransaction({ /* ... */ });
    }
    // Non-dapp browsers...
    else {
        console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
    }
    
    message=web3.eth.contract(abi).at(contractAddress);
    //startApp();
});
$('#resbutton').click(function(){
	
	var id = vv('${userId}');
	console.log('id:'+id);

	var id2 = vv('${writerId}');
	console.log('id2:'+id2);
	var num = parseInt('${dto.cp_no}');
	console.log('num:'+num);
	console.log('타입?' + '${dto.type }');
	var vtype = '${dto.type }';
	var type;
	if( vtype == "타세요"){
		type = vv("user");
		console.log("유저저??");
	}
	else
		type = vv("driver");
	  message.signBook(num,id2,id,type,function(e,r){
		 $('#signed').val(r); 
		 $('.carviewform').submit();
	  });    
	    

});







	$('#edit').click(function(){
		console.log("asdfdsfgsdfg");
		$('.carviewform').prop('action','Caredit.kosmo');
		$('.carviewform').submit();
	});
	
	$('#delete').click(function(){
		$('.carviewform').prop('action','Cardelete.kosmo');
		$('.carviewform').submit();
	});

	$('#return').click(function(){
		console.log("취소할거야")
		$('.carviewform').prop('action','Back_reser.kosmo');
		$('.carviewform').submit();
	})


	
</script>

<script src="resources/js/carload.js"></script>
