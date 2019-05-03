<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href='/baby/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/baby/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='/baby/resources/fullcalendar/timegrid/main.css' rel='stylesheet' />
<link href='/baby/resources/fullcalendar/list/main.css' rel='stylesheet' />


<script src='/baby/resources/fullcalendar/core/main.js'></script>
<script src='/baby/resources/fullcalendar/daygrid/main.js'></script>
<script src='/baby/resources/fullcalendar/timegrid/main.js'></script>
<script src='/baby/resources/fullcalendar/list/main.js'></script>
<script src='/baby/resources/fullcalendar/core/locales/ko.js'></script>
<script src='/baby/resources/fullcalendar/interaction/main.js'></script>
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
</style>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

    	var calendar = new FullCalendar.Calendar(calendarEl, {
	      	plugins: [ 'dayGrid','timeGrid','list','interaction' ],
	      	locale:'ko',
	      	eventLimit: true,
	      	selectable: true,
	      	header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'dayGridMonth,timeGridWeek,timeGridDay'
			},
          	select: function(info) {
            	alert('selected ' + info.start + ' to ' + info.end);
            	$('#startDate').val(info.startStr)
            	console.log(info.endStr);
            	console.log(info.endStr.length-1);
            	console.log(info.endStr.indexOf(3));
            	$('#endDate').val(info.endStr)
            	//$('#schduleForm').modal();
            	calendar.addEvent({
					title: '이벤트',
					start: info.start,
					end: info.end,
					allDay: true
				});
          	}
			
    	});
		calendar.render();
  });
</script>

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
					<h4 class="modal-title">일정등록</h4>
				</div>
				<div class="modal-body">
					<form class='form-margin40' role='form' action="#" method='post' id='frmSchdule'>
						<div class='form-group'>
							<label>제목</label> 
							<input type='text' class='form-control' id='summary' name='summary' placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사">
						</div>
						<div class='form-group'>
							<label>시작날짜</label> 
							<input class='form-control startDate' type="text" id='startDate' name='startDate' readonly="readonly">
						</div>
						<div class='form-group'>
							<label>종료날짜</label> 
							<input class='form-control startDate' type="text" id='endDate' name='endDate'>
						</div>
						<div class='form-group'>
							<label>내용</label>
							<textarea rows="7" class='form-control' id="description" name='description'></textarea>
						</div>
						<div class='modal-footer'>
							<input type="button" class='btn btn-sm btn-warning' value="확인"/> 
							<input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
							<input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</div>
	

