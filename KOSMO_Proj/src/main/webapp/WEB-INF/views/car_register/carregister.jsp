<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/template/isMember.jsp" %>
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- 데이트 피커 -->
	<link rel="stylesheet" href="/baby/resources/css/jquery.simple-dtpicker.css"/>
	<script type="text/javascript" src="/baby/resources/js/jquery.simple-dtpicker.js"></script>
	<!-- 카풀map시작-->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fc37be4712f8b89b167cddbc490382f"></script> -->
	<!-- 주소검색 자동완성 api -->
	<link rel="stylesheet" href="/baby/resources/css/s9jss_single.css"> 
	<script type="text/javascript" src="/baby/resources/js/s9soft.js"></script>
	
	<!-- 섬머노트 css/js -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
	<!-- 섬머노트 한국어 설정 -->
	<script src="/baby/resources/summernote/summernote-ko-KR.js"></script>
  	<!-- 블록체인 -->
 	<script src='/baby/resources/aranblockchain.js'></script>
	<!-- 카풀map시작-->
   	<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=b5cc2a5e-34c4-441b-96f9-0a2639aabc1a"></script>
   
<style>
.carinput_head {
  margin-bottom: 10px;
}
.carinput_icon {
  color: #f68181;
  width: 50px;
}
.carinput_title {
  display: inline-block;
  margin-bottom: 0;
  vertical-align: middle;
}
.carinput_body {
  margin: 0;
}
.custom_Button {
  width: 140px;
  background-color: #f68181;
  color: white;
  border: none;
  border-radius: 5px;
}
.box_map {
 
  height: 300px;
}
#sun {
  border-bottom: 5px solid #f68181;
  margin-top: 0;
}

.carinput_form .col-form-label {
  padding-left: 16px;
}
.btngroup {
  margin-top: 30px;
}
.datepicker_table {
  width: 197px;
}
g {
display: none;
}
.datepicker_timelist {
  height: 128px;
}
</style>
<div class="site-section" style="padding: 2em;">
	<div class="container">	
		<div class="carinput_head">
			<img class="carinput_icon" alt="아이콘" src="/baby/resources/images/car_icon2.png">
			<c:if test="${empty list }" var="isEmpty">
				<h2 class="carinput_title">카풀 등록하기</h2>
			</c:if>
			<c:if test="${not isEmpty }">
				<h2 class="carinput_title">카풀 수정하기</h2>
			</c:if>
		</div>
		<hr id="sun"/>
		<div class="carinput_body">
			<form class="carinput_form" action="Carinsert.kosmo" method="post">
				<div class="row no-gutter">
					<div class="col-md-8 col-lg-6">
						<div class="form-group">
							<label for="purpose" class="col-form-label purpose">유형: </label> 
							<div class="col">					
								<select	class="form-control" id="type" name="type">
								<c:if test='${partnerstatus eq "1" or list.partnerstatus eq "1"}' var ="partner">
									<option>타세요 </option>
								</c:if>
									<option>태워주세요</option>
								</select>
							</div>
						</div>
						<div class="form-group" id="partnerCarseat" style="display: none;">
							<label for="carseat" class="col-form-label purpose">카시트: </label> 
							<div class="col">					
								<select	class="form-control" id="carseat" name="carseat">
									<option>있어요</option>
									<option>없어요</option>
								</select>
							</div>
						</div>
						<div class="form-group" id="nomalCarseat"  style="display: none;">
							<label for="carseat" class="col-form-label purpose">카시트: </label> 
							<div class="col">					
								<select	class="form-control" id="carseat" name="carseat">
									<option>필요</option>
									<option>불필요</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="start" class="col-form-label">출발지: </label>
							<div class="col">
								<input type="text" id="start" name="startpoint" value="${list.startpoint }" class="form-control search_point" placeholder="출발위치" required/>
							</div>
						</div>
						<div class="form-group">
							<label for="end" class="col-form-label">도착지: </label>
							<div class="col">
								<input type="text" id="end" name="endpoint" value="${list.endpoint }" class="form-control search_point" placeholder="도착위치" required/>
							</div>
						</div>
						<!-- 출발 도착 위치 위도, 경도 저장용 -->
						<input class="form-control" type="hidden" id="start_xpos" name="start_xpos" value="${list.s_xpos }"/>
						<input class="form-control" type="hidden" id="start_ypos" name="start_ypos" value="${list.s_ypos }"/>
						<input class="form-control" type="hidden" id="end_xpos" name="end_xpos" value="${list.e_xpos }"/>
						<input class="form-control" type="hidden" id="end_ypos" name="end_ypos" value="${list.e_ypos }"/>
						<input class="form-control" type="hidden" id="cp_no" name="cp_no" value="${list.cp_no }"/>
						<input class="form-control" type="hidden" id="id" name="id" value="${id }"/>
						<input class="form-control" type="hidden" id="carseat" name="carseat" value="${list.carseat }"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<!-- 해시값 -->
						<input type="hidden" value="asd123" id="opened" name="opened">
						
						<div class="form-group">
							<label for="point" class="col-form-label pay">금액: </label>
							<div class="col">
								<input type="text" id="price" name="price" class="form-control" placeholder="금액 입력해주세요" value="${list.price }" required/>
							</div>
						</div>
						<div class="form-group">
							<label for="datepicker1" class="col-form-label pay">날짜: </label>
							<div class="col">
								<input type="text" id="time" name="time" class="form-control" placeholder="날짜 입력해주세요" value="${list.time }" required/>
							</div>
						</div>
					</div>
					<!-- 추가내용 -->
					<div class="col-md-8 col-lg-6">
						<div class="form-group">
							<label for="summernote" class="col-form-label">추가내용: </label>
							<textarea id="content" class="form-control" name="content">${list.content }</textarea>
						</div>
					</div>
				</div>
			</form>
			
		</div>
		<div id="initmap">
			<div id="map_div"></div>
			<p id="result"></p>
		</div>
		<!-- div class="col">
			<div id="map" class="box_map"></div>
		</div> -->
		<div class="btngroup text-center">
			<c:if test="${empty list }" var="isEmpty">
				<button type="button" class="btn btn-primary custom_Button submit">등록</button>
			</c:if>
			<c:if test="${not isEmpty }">
				<button type="button" id="edit" class="btn btn-primary custom_Button">수정</button>
			</c:if>
			<button type="button" class="btn btn-primary custom_Button">취소</button>
		</div>
	</div>
</div>

<script src="/baby/resources/js/auto/carindexload.js"></script>

<script>
//블록체인 최초접속
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

var tHash;
$(function(){
	  if($('#type').val()=="타세요"){
	      $('#partnerCarseat').css("display", "inline");
	   }
	   else{
	      $('#nomalCarseat').css("display", "inline");
	   }
	   $('#type').change(function(){
	      if($(this).val()=="타세요"){
	         $('#partnerCarseat').css("display", "inline");
	         $('#nomalCarseat').css("display", "none");
	         $('#partnerCarseat > #carseat > option:nth-child(1)').attr("selected",true)
	      }
	      else{
	         $('#partnerCarseat').css("display", "none");
	         $('#nomalCarseat').css("display", "inline");
	         $('#nomalCarseat > #carseat > option:nth-child(1)').attr("selected",true)
	         
	         
	      }
	   });
	
	
	$('.submit').click(function(){
		
		var id = vv('${id}');
		
		console.log(id);
		var select = $('#type  option:selected').val();
		if(select === "타세요"){
			select = 'driver';
			console.log('드라이버');
		}
		else{
			select = 'user';
			console.log('유저');	
		}
		var type = vv(select);
		console.log("type:" +type);
 	    	message.openingBook(id,type,function(e,r){
			console.log('트랜잭션 해시값 :' + r);
			$('#opened').val(r);
			   
			$('.carinput_form').submit();
		});     
		
		console.log('============');

	});
	
	$('#edit').click(function(){
		$('.carinput_form').prop('action','Carupdate.kosmo')
		$('.carinput_form').submit();
		
	});
	
	
	$('*[name=time]').appendDtpicker({
		"locale": "ko"
	});
	
	$('#content').summernote({
		placeholder: '내용을 입력하세요',
		height: 400,
		lang: 'ko-KR',
		minHeight: null,
		maxHeight: null,
		tabsize: 2
	});
	
	
	
});
</script>

	  