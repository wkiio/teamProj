<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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


<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/baby/resources/emoji/css/emoji.css" rel="stylesheet">
<script src="/baby/resources/emoji/js/config.js"></script>
<script src="/baby/resources/emoji/js/util.js"></script>
<script src="/baby/resources/emoji/js/jquery.emojiarea.js"></script>
<script src="/baby/resources/emoji/js/emoji-picker.js"></script>

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
.fc-unthemed td.fc-today {
  background-color: #91ff96;
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

</style>

<script>
//이모지
$(function() {
    window.emojiPicker = new EmojiPicker({
      emojiable_selector: '[data-emojiable=true]',
      assetsPath: '/baby/resources/emoji/img',
      popupButtonClasses: 'fa fa-smile-o'
    });
    window.emojiPicker.discover();
});
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
		console.log('캘린더 시작');
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
			    alert('Event: ' + info.event.title);
			    alert('id: ' + info.event.id);
			    alert('description: ' + info.event.extendedProps.description);
			    editCalendar(info); 
			   
			},
	      	select: function(info) {
	      		//모달창 리셋
	      		$('.modal').find('form')[0].reset();
	      		
	      		if(info.startStr.includes("T")){
	      			//2019-05-07T06:00:00+09:00
	      			var startDT = info.startStr.split('+')[0].split('T');
	      			var endDT = info.endStr.split('+')[0].split('T');
	      			$('#startStr').val(startDT[0])
	            	$('#endStr').val(endDT[0])
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
	            	if(inv<10){
	            		str = info.endStr.substr(0,info.endStr.length-1)+inv
	            	}
	            	else{
	            		str = info.endStr.substr(0,info.endStr.length-2)+inv
	            	}
	            	$('#startStr').val(info.startStr)
	            	$('#endStr').val(str)
	      		}
	        	alert('selected ' + startDay + ' to ' + endDay);           	
	        	$('#startdate').val(startDay) 
	        	$('#enddate').val(endDay) 
	        	
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
		 $.ajax({
			url:"<c:url value='/fcinput.kosmo'/>",
			data:$('#frmSchdule').serialize(),
			type:'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			success:function(data){	
				if($('#startTime').val()==""){				
					calendar.addEvent({
						id: data,
						title: $('#caltitle').val(),
						start: $('#startStr').val(),
						end: $('#endStr').val(),
						description: $('#calcontent').val()
					});
				}
				else{
					calendar.addEvent({
						id: data,
						title: $('#caltitle').val(),
						start: $('#startStr').val().concat('T'.concat($('#startTime').val())),
						end: $('#endStr').val().concat('T'.concat($('#endTime').val()))
					});
				}
			}
		});
		$('#schduleForm').modal('hide');
		
	});
	
	//일정 확인용 모달 생성
	function editCalendar(info) {
		$('.modal').find('form')[0].reset();
		var start = moment(info.event.start).format().split("T");
		var end = moment(info.event.end).format().split("T");
		$('#modifyEventId').val(info.event.id);
		$('#modiftitle').val(info.event.title);
		$('#modifstartTime').val(start[1].split("+")[0]);
		$('#modifstartStr').val(start[0]);
		if(info.event.end!=null){
			$('#modifendTime').val(end[1].split('+')[0]);
			$('#modifendStr').val(end[0]);
		}	
		$('#modifcontent').val(info.event.extendedProps.description);
		$('#schduleFormModify').modal();
	};
	
	//일정 수정
	$('#caledit').click(function(){
		console.log('수정한다');
		$.ajax({
			url:"<c:url value='/fcupdate.kosmo'/>",
			data:$('#frmSchduleModify').serialize(),
			type:'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			success:function(data){	
				console.log('수정성공')			
				$('#schduleFormModify').modal('hide');
				calendar.destroy();
				getevent(true);
				
			}
		});
	});
	
	$('#caldelet').click(function(){
		console.log('삭제한다');
		$.ajax({
			url:"<c:url value='/fcdelete.kosmo'/>",
			data:$('#frmSchduleModify').serialize(),
			type:'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			success:function(data){	
				console.log('삭제성공')			
				$('#schduleFormModify').modal('hide');
				calendar.destroy();
				getevent(false);
				
			}
		});		
		
	});
	
	
});


</script>
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id" />
</sec:authorize>
<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div id='calendar'></div>		
	</div>
	<!-- 일정 생성 modal -->
	<div class="modal fade" id="schduleForm" role="dialog" style="z-index:2001">
		<div class="modal-dialog">
			<div class="modal-content"  >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">일정등록&#x1F601;</h4>
				</div>
				<div class="modal-body">
					<form class='form-margin40' role='form' method='post' id='frmSchdule'>
						<div class='form-group'>
							<label>제목</label>
							<p class="lead emoji-picker-container">
								<input type='text' class='form-control' id='caltitle' name='caltitle' placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사" 
								data-emojiable="true" data-emoji-input="unicode">
							</p>
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
							<select class="form-control" id="type">
								<option selected="selected" disabled="disabled">선택하세요</option>
								<option>중요</option>
								<option>생일</option>
								<option>기념일</option>
								<option>예방접종</option>
								<option>약속</option>
								<option>행사</option>
						    </select>
						</div>
						<input type="hidden" id='startdate' name='startdate'>
						<input type="hidden" id='enddate' name='enddate'>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class='form-group'>
							<label>내용</label>
							<p class="lead emoji-picker-container">
								<textarea rows="7" class='form-control' id="calcontent" name='calcontent' 
								data-emojiable="true" data-emoji-input="unicode"></textarea>
							</p>
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
	
	<!-- 일정 수정 modal -->
	<div class="modal fade" id="schduleFormModify" role="dialog" style="z-index:2001">
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
							<p class="lead emoji-picker-container">
								<input type='text' class='form-control' id='modiftitle' name='modiftitle' data-emojiable="true">
							</p>
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
							<label>내용</label>
							<p class="lead emoji-picker-container">
								<textarea rows="7" class='form-control' id="modifcontent" name='modifcontent' data-emojiable="true"></textarea>
							</p>
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
	

