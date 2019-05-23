<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link href = "https://use.fontawesome.com/releases/v5.8.2/css/all.css" rel="stylesheet">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<div class="site-section" style="height:auto; padding:2em;z-index=3" >
	
     	<h2>채팅방입니다.</h2>
     	<fieldset>
			<legend>웹소켓 클라이언트</legend>
			<h2>닉네임</h2>	
			<div class="row">						
				<div class="col-md-3">
					<input class="form-control" type="text" id="nickname"> 
				</div>
				
				<input class="btn btn-info" type="button" id="enterBtn" value="입장">
				<input class="btn btn-danger" type="button" id="exitBtn" value="퇴장">
				
			</div>
			<h2>대화 영역</h2>
			<div class="row">
				<div id="chatArea">					
					<div class="col-md-8" id="chatMessage"	style="height: 300px;width:900px; border: 1px gray solid;overflow:auto"></div>
				</div>
			</div>
			<h2>메시지 입력</h2>
			<div class="row">				
				<div class="col-md-8">
					<input class="form-control" type="text" id="message"/>					
				</div>
				<input class="btn btn-success" type="button" id="sendBtn" value="전송">
			</div>
		</fieldset>
	
</div>
   

<!-- Bootstrap JS-->
<script src="admin_assets/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="admin_assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    
<script>
//웹소켓 객체 저장용
	var wsocket;
	//닉 네임 저장용
	var nickname;
	

	$(function(){
		
		//입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
		$('#enterBtn').one('click',function(){
			// 웹 소켓 객체로 서버에 연결하기
			wsocket= new WebSocket("ws://localhost:8080<c:url value='/echo.kosmo'/>")
			wsocket.onopen = open;
			 wsocket.onclose= function(){appendMessage('연결을 끊었어요')};
			wsocket.addEventListener('message',message);
			//사용자가 입력한 닉네임 저장
			nickname = $('#nickname').val(); 
		}); 
		
		//퇴장버튼 클릭시]
		 $('#exitBtn').one('click',function(){
			wsocket.send('msg:'+nickname+"가(이) 퇴장했어요");
			wsocket.close();
		});
		//전송버튼 클릭시]
		$('#sendBtn').click(function(){
			send_message();
		});
		
		//메시지 입력후 전송 버튼 클릭이 아닌 엔터키처리
		$('#message').on('keypress',function(e){
			//console.log('e.keyCode:%s,e.which:%s',e.keyCode,e.which);
			var keyvalue = e.keyCode ?e.keyCode :e.which;
			if(keyvalue==13){//엔터 입력
				send_message();
			}
			e.stopPropagation();
		}); 
	
	
 	//함수 정의]
	//서버에 연결되었을때 호출되는 함수
	var open = function(){
		//서버로 연결한 사람의 정보(닉네임) 전송
		wsocket.send('msg:'+nickname+'가(이) 입장햇어요'); 
		appendMessage("연결되었습니다");
	};
	//서버에서 메시지를 받을때마다 호출되는 함수
	var message = function(e){
		//서버로부터 받은 데이타는 이베튼객체(e).data속성에 저장되어 있다
		var receive_message=e.data;
		if(receive_message.substring(0, 4)=='msg:')
			appendMessage(receive_message.substring(4));
	};
	
	//메시지를 DIV태그에 뿌려주기 위한 함수]
	var appendMessage=function(message){
		//메시지 출력
		$('#chatMessage').append(message+'<br/>');
		//스크롤바 조정]  			
		$('#chatMessage').scrollTop($('#chatMessage').prop('scrollHeight'));
		
	};
	//서버로 메시지 전송하는 함수]
	var send_message = function(){
		//서버로 메시지 전송
		wsocket.send('msg:'+nickname+":"+$('#message').val());//msg:KIM:안녕
		//DIV(대화영역)에 메시지 출력
		appendMessage($('#message').val());
		//기존 메시지 클리어
		$('#message').val('');
		//포커스 주기
		$('#message').focus();
	}; 
	});

</script>


