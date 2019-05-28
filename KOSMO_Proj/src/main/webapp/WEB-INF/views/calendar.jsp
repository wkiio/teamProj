<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/template/isMember.jsp" %>

<link href='/baby/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/baby/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='/baby/resources/fullcalendar/timegrid/main.css' rel='stylesheet' />
<link href='/baby/resources/fullcalendar/list/main.css' rel='stylesheet' />
<link href='/baby/resources/timepicker/jquery.timepicker.css' rel='stylesheet' />

<script src='/baby/resources/fullcalendar/core/main.js'></script>
<script src='/baby/resources/fullcalendar/daygrid/main.js'></script>
<script src='/baby/resources/fullcalendar/timegrid/main.js'></script>
<script src='/baby/resources/fullcalendar/list/main.js'></script>
<script src='/baby/resources/fullcalendar/core/locales/ko.js'></script>
<script src='/baby/resources/fullcalendar/interaction/main.js'></script>
<script src='/baby/resources/timepicker/jquery.timepicker.js'></script>
<script src='/baby/resources/timepicker/moment.js'></script>

<!-- 섬머노트 css/js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<!-- 섬머노트 한국어 설정 -->
<script src="/baby/resources/summernote/summernote-ko-KR.js"></script>


<style>
td.fc-sun .fc-day-number {
  color: red;
}
td.fc-sat .fc-day-number {
  color: blue;
}
.fc-event .fc-title {
  color: white;
}
.fc-event .fc-time {
  color: white;
}
.fc-today .fc-day-number {
  font-weight: bold;
}
.fc-event {
  cursor: pointer;
  border: none;
}
.fc-button {
  background-color: #23b8bc;
  border: none;
}
.note-editor.note-frame .note-editing-area .note-editable[contenteditable="false"] {
  background-color: white;
}
.modal-footer input {
  background: #23b8bc;
  color: #fff;
  text-align: center;
  border: none;
  border-radius: 5px;
}
.modal-footer input:hover {
  background-color: #157577;
}
.radio-inline {
  margin-right: 10px;
}
</style>
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id"/>
</sec:authorize>


<script>
document.addEventListener('DOMContentLoaded', function() {		
	$('#startTime').timepicker({'noneOption':['리셋'], 'timeFormat': 'H:i' });
	$('#endTime').timepicker({'noneOption':['리셋'], 'timeFormat': 'H:i' });
	$('#modifstartTime').timepicker({'noneOption':['리셋'], 'timeFormat': 'H:i' });
	$('#modifendTime').timepicker({'noneOption':['리셋'], 'timeFormat': 'H:i' });
	
	var startDay,endDay;
	var calendar;
	
	//일정 가져오기
	function getevent(flag){
		$.ajax({
			url:"<c:url value='/fcevent.kosmo'/>",
			data:{"${_csrf.parameterName}":"${_csrf.token}"},
			type:'post',
			dataType:'json',
			success:function(data){
				createCalendar(data,flag);
			}
			
		});	
	};
	getevent(false);
	
	//캘린더 생성
	function createCalendar(event,flag) {
		var calendarEl = document.getElementById('calendar');
		calendar = new FullCalendar.Calendar(calendarEl, {
	      	plugins: [ 'dayGrid','timeGrid','list','interaction' ],
	      	locale:'ko',
	      	eventLimit: true,
	      	selectable: true,
	      	selectHelper: true,
	      	header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			events: event,
			eventClick: function(info) {
				seachEvent(info);
			   
			},
	      	select: function(info) {
	      		//모달창 리셋	      		
	      		$('.modal').find('form')[0].reset();
	      		$('#calcontent').summernote('destroy')     		
	      		if(info.startStr.includes("T")){
	      			//2019-05-07T06:00:00+09:00
	      			var startDT = info.startStr.split('+')[0].split('T');
	      			var endDT = info.endStr.split('+')[0].split('T');
	      			$('#startStr').val(startDT[0]);
	            	$('#endStr').val(endDT[0]);
	            	$('#startTime').val(startDT[1]);
					$('#endTime').val(endDT[1]);
					
					startDay = startDT[0];
	          		endDay = endDT[0];
	      		}
	      		else{
	          		startDay = info.startStr;
	          		endDay = info.endStr;
	      			var str = info.endStr.substr(info.endStr.length-2)
	            	var inv = parseInt(str)==1?1:parseInt(str)-1;
	            	if(inv<=9){
	            		str = info.endStr.substr(0,info.endStr.length-2)+"0"+inv
	            	}
	            	else{
	            		str = info.endStr.substr(0,info.endStr.length-2)+inv
	            	}
	            	$('#startStr').val(info.startStr);
	            	$('#endStr').val(str);

	      		}

	        	$('#startdate').val(startDay);
	        	$('#enddate').val(endDay);
	        	$('#calcontent').val(null);
	        	$('#calcontent').summernote({
					placeholder: '내용을 입력하세요',
					height: 200,
					lang: 'ko-KR',
					minHeight: null,
					maxHeight: null,
					tabsize: 2
					
				});
	        	$('#schduleForm').modal();
	        	
	      	}
			
		});
		if(flag){
			calendar.gotoDate($('#modifstartStr').val());
		}
		calendar.render();
		
	};
	
	//일정 입력
	$('#submitbtn').click(function(){
		var flag = emptycheck();
		if(flag=="false"){
			return
		}
		var color;
		var event;
		switch($("#type").val()){
			case "중요": color="#872901"; break;
			case "생일": color="#a36a00"; break;
			case "기념일": color="#bcb900"; break;
			case "예방접종": color="#5ebc00"; break;
			case "약속": color="#2f00bc"; break;
			case "행사": color="#a00196"; break;	
		}
		if("${id}"=="admin"){
			color="gray";
		}
		 $.ajax({
			url:"<c:url value='/fcinput.kosmo'/>",
			data:$('#frmSchdule').serialize(),
			type:'post',
			dataType:'text',
			success:function(data){
				if($('#startTime').val()==""){				
					calendar.addEvent({
						id: data,
						title: $('#caltitle').val(),
						start: $('#startStr').val(),
						end: $('#endStr').val(),
						description: $('#calcontent').val(),
						color: color,
						className: $('.notif[checked="checked"]').val()
					});
				}
				else{
					calendar.addEvent({
						id: data,
						title: $('#caltitle').val(),
						start: $('#startStr').val().concat('T'.concat($('#startTime').val())),
						end: $('#endStr').val().concat('T'.concat($('#endTime').val())),
						description: $('#calcontent').val(),
						color: color,
						className: $('.notif[checked="checked"]').val()
					});
				}

				$('#calno').val(data);
				if($('#type').val()=="행사"){
					$('#frmSchdule').prop("action","<c:url value='/fcupload.kosmo?${_csrf.parameterName}=${_csrf.token}'/>");
					$('#frmSchdule').submit();
				}
			}
			
		});	
		$('#schduleForm').modal('hide');
		
	});
	
	//일정 확인 및 수정 모달 생성
	function editCalendar(info) {
		$('.modal').find('form')[0].reset();
		$('#modifcontent').summernote('destroy');
		var start = moment(info.event.start).format().split("T");
		var end = moment(info.event.end).format().split("T");
		$('#modifyEventId').val(info.event.id);
		$('#modiftitle').val(info.event.title);
		$('#modifstartStr').val(start[0]);
		if(start[1].split("+")[0]!="00:00:00"){
			$('#modifstartTime').val(start[1].split("+")[0]);
		}
		if(info.event.end!=null){
			$('#modifendStr').val(end[0]);
			if(start[1].split("+")[0]!="00:00:00"){
				$('#modifendTime').val(end[1].split('+')[0]);
			}
		}
		switch(info.event.borderColor){
			case "#872901": $('#modiftype').val("중요"); break;
			case "#a36a00": $('#modiftype').val("생일"); break;
			case "#bcb900": $('#modiftype').val("기념일"); break;
			case "#5ebc00": $('#modiftype').val("예방접종"); break;
			case "#2f00bc": $('#modiftype').val("약속"); break;
			case "#a00196": $('#modiftype').val("행사"); break;
		}
		switch(info.event.classNames[0]){
			case "0": $('#moti1').prop("checked","checked"); break;
			case "1": $('#moti2').prop("checked","checked"); break;
			case "2": $('#moti3').prop("checked","checked"); break;
		}
		$('#modifcontent').val(info.event.extendedProps.description);
		$('#modifcontent').summernote({
			placeholder: '내용을 입력하세요',
			height: 200,
			lang: 'ko-KR',
			minHeight: null,
			maxHeight: null,
			tabsize: 2
		});
		if(info.event.borderColor=='gray'&&"${id}"!="admin"){
			$('#modiftitle').prop( 'disabled', true ).css('backgroundColor',"white");
			$('#modifstartStr').prop( 'disabled', true ).css('backgroundColor',"white");
			$('#modifstartTime').prop( 'disabled', true ).css('backgroundColor',"white");
			$('#modifendStr').prop( 'disabled', true ).css('backgroundColor',"white");
			$('#modifendTime').prop( 'disabled', true ).css('backgroundColor',"white");
			$('#modiftype').prop( 'disabled', true ).css('backgroundColor',"white");
			$('#modifcontent').summernote('disable');
			$('#caledit').css('display',"none");
			$('#caldelet').css('display',"none");
		}
		else{
			$('#modiftitle').removeProp("disabled");
			$('#modifstartStr').removeProp("disabled");
			$('#modifstartTime').removeProp("disabled");
			$('#modifendStr').removeProp("disabled");
			$('#modifendTime').removeProp("disabled");
			$('#modiftype').removeProp("disabled");
			$('#modifcontent').summernote('enable');
			$('#caledit').css('display',"");
			$('#caldelet').css('display',"");
		}
		$('#schduleFormModify').modal();
	};
	
	//일정 수정
	$('#caledit').click(function(){
		$.ajax({
			url:"<c:url value='/fcupdate.kosmo'/>",
			data:$('#frmSchduleModify').serialize(),
			type:'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			success:function(data){			
				$('#schduleFormModify').modal('hide');
				calendar.destroy();
				getevent(true);
				
			}
		});
	});
	
	//일정삭제
	$('#caldelet').click(function(){
		$.ajax({
			url:"<c:url value='/fcdelete.kosmo'/>",
			data:$('#frmSchduleModify').serialize(),
			type:'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			success:function(data){				
				$('#schduleFormModify').modal('hide');
				calendar.destroy();
				getevent(false);
				
			}
		});		
		
	});
	
	function seachEvent(info){
		$.ajax({
			url:"<c:url value='/seachevent.kosmo'/>",
			data:{'calno':info.event.id,"${_csrf.parameterName}":"${_csrf.token}"},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data=="true"){
					$(location).attr("href", "<c:url value='/pairview.kosmo?calno="+info.event.id+"'/>");
				}
				else{
					 editCalendar(info); 
				}
			}
			
		});
	};
	
	function emptycheck(){
		if($('#type').val()=="행사"){
			if($('#caltitle').val()==""){
				alert("타이틀을 입력하세요");
				return "false";
			}
			if($('#startTime').val()==""){
				alert("시작시간을 입력하세요");
				return "false";
			}
			if($('#endTime').val()==""){
				alert("종료시간을 입력하세요");
				return "false";
			}
			if($('#timg').val()==""){
				alert("타이틀 이미지를 선택하세요");
				return "false";
			}
			if($('#file').val()==""){
				alert("아이템 이미지를 선택하세요");
				return "false";
			}
		}
		else {
			if($('#caltitle').val()==""){
				alert("타이틀을 입력하세요");
				return "false";
			}
			if($('#type').val()==null){
				alert("분류를 선택하세요");
				return "false";
			}
		}
		return "true";
	};
	
	
	
	$('#type').change(function(){
		if($('#type').val()=="행사"){paircontent
			$('#modaltitle').html("행사등록");
			$('.calcontent').css("display", "none");
			$('.paircontent').css("display", "inline");
			$('#imgdiv1').css("display", "inline");
			$('#imgdiv2').css("display", "inline");
		}
		else{
			$('#modaltitle').html("일정등록");
			$('.calcontent').css("display", "inline");
			$('.paircontent').css("display", "none");
			$('#imgdiv1').css("display", "none");
			$('#imgdiv2').css("display", "none");
		}
	});
	
});
</script>

<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div id='calendar'></div>
	</div>
	<!-- 일정 생성용 modal -->
	<div class="modal fade" id="schduleForm" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content"  >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="modaltitle">일정등록</h4>
				</div>
				<div class="modal-body">
					<form class='form-margin40' role='form' method='post' id='frmSchdule' enctype="multipart/form-data">
						<div class='form-group'>
							<label>제목</label>
							<input type='text' class='form-control' id='caltitle' name='caltitle' placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사">
						</div>
						<div class='form-group'>
							<label>시작시간</label>
							<input class='form-control' type="time" id='startTime' name='startTime'>
						</div>
						<div class='form-group'>
							<label>시작날짜</label> 
							<input class='form-control startDate' type="text" id='startStr' name='startStr'>
						</div>
						<div class='form-group'>
							<label>종료시간</label>
							<input class='form-control' type="time" id='endTime' name='endTime'>
						</div>
						<div class='form-group'>
							<label>종료날짜</label> 
							<input class='form-control endDate' type="text" id='endStr' name='endStr'>
						</div>
						<div class='form-group'>
							<label>분류</label> 
							<select class="form-control" id="type" name="type">
								<option selected="selected" disabled="disabled" value="noselect">선택하세요</option>
								<option value="중요">중요</option>
								<option value="생일">생일</option>
								<option value="기념일">기념일</option>
								<option value="예방접종">예방접종</option>
								<option value="약속">약속</option>
						    </select>
						</div>
						<div class='form-group'>
							<label style="display: block;">알림 설정</label>
							<div>
								<label class="radio-inline"><input class="notif" type="radio" name="noti" value="0"> 알림 없음</label>
								<label class="radio-inline"><input class="notif" type="radio" name="noti" value="1"> 알림 1회</label>
								<label class="radio-inline"><input class="notif" type="radio" name="noti" value="2"> 계속 알림</label>
							</div>
						</div>
						<div id="imgdiv1" class='form-group' style="display: none;">
							<label>타이틀 이미지</label> 
							<input class='form-control timg'  type="file" id='timg' name='timg'>
						</div>
						<div id="imgdiv2" class='form-group' style="display: none;">
							<label>아이템 이미지</label> 
							<input class='form-control img' multiple="multiple" type="file" id='file' name='file'>
						</div>
						<input type="hidden" id='startdate' name='startdate'>
						<input type="hidden" id='enddate' name='enddate'>
						<input type="hidden" id="calno" name="calno" >
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class='form-group calcontent'>
							<label>내용</label>
							<textarea rows="7" class='form-control' id="calcontent" name='calcontent'></textarea>
						</div>
						<div class='form-group paircontent' style="display: none;">
							<label>행사장소</label>
							<input class='form-control' type="text" id='paircontent' name='paircontent' placeholder="행사장소를 입력하세요">
						</div>
						<div class='modal-footer'>
							<input type="button" class='btn btn-sm btn-warning' id='submitbtn' value="확인"/> 
							<input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 일정 확인 및 수정,삭제용  modal -->
	<div class="modal fade" id="schduleFormModify" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">일정수정</h4>
				</div>
				<div class="modal-body">
					<form class='form-margin40' role='form' method='post'id='frmSchduleModify'>
						<div class='form-group'>
							<label>제목</label>
							<input type='text' class='form-control' id='modiftitle' name='modiftitle'>
						</div>
						<div class='form-group'>
							<label>시작시간</label>
							<input class='form-control' type="time" id='modifstartTime' name='modifstartTime'>
						</div>
						<div class='form-group'>
							<label>시작날짜</label> 
							<input class='form-control startDate' type="text" id='modifstartStr' name='modifstartStr'>
						</div>
						<div class='form-group'>
							<label>종료시간</label>
							<input class='form-control' type="time" id='modifendTime' name='modifendTime'>
						</div>
						<div class='form-group'>
							<label>종료날짜</label> 
							<input class='form-control startDate' type="text" id='modifendStr' name='modifendStr'>
						</div>
						<div class='form-group'>
							<label>분류</label> 
							<select class="form-control" id="modiftype" name="modiftype">
								<option selected="selected" disabled="disabled">선택하세요</option>
								<option value="중요">중요</option>
								<option value="생일">생일</option>
								<option value="기념일">기념일</option>
								<option value="예방접종">예방접종</option>
								<option value="약속">약속</option>
						    </select>
						</div>
						<div class='form-group'>
							<label style="display: block;">알림 설정</label>
							<div>
								<label class="radio-inline"><input id="moti1" type="radio" name="modifnoti" value="0"> 알림 없음</label>
								<label class="radio-inline"><input id="moti2"  type="radio" name="modifnoti" value="1"> 알림 1회</label>
								<label class="radio-inline"><input id="moti3"  type="radio" name="modifnoti" value="2"> 계속 알림</label>
							</div>
						</div>
						<div class='form-group'>
							<label>내용</label>
							<textarea rows="7" class='form-control' id="modifcontent" name='modifcontent'></textarea>
						</div>
						<input type="hidden" id="modifyEventId" name="modifyEventId" />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class='modal-footer'>
							<input type="button" class='btn btn-sm btn-warning' id="caledit" value="수정" /> 
							<input type="reset" class='btn btn-sm btn-warning' id="caldelet" value="삭제" /> 
							<input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</div>
	