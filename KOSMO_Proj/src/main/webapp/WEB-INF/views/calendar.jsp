<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		var startDay,endDay,allday;
		var startDT,endDT;
		var events;
		$.ajax({
			url:"<c:url value='/fcevent.kosmo'/>",
			data:{"${_csrf.parameterName}":"${_csrf.token}"},
			type:'post',
			dataType:'json',
			success:function(data){
				//events='[{start: "2019-05-03",allDay: true,constraint: "businessHours",title: "Business Lunch"}]';
				events=data;
				console.log(data);
				console.log(events);
				
			}
		});
		
		var calendarEl = document.getElementById('calendar');
    	var calendar = new FullCalendar.Calendar(calendarEl, {
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
			events: [],
          	select: function(info) {
          		//모달창 리셋
          		$('.modal').find('form')[0].reset();
          		
          		if(info.startStr.includes("T")){
          			//2019-05-07T06:00:00+09:00
          			startDT = info.startStr.split('+')[0].split('T');
          			endDT = info.endStr.split('+')[0].split('T');
          			$('#startStr').val(startDT[0])
                	$('#endStr').val(endDT[0])
                	$('#startTime').val(startDT[1]);
					$('#endTime').val(endDT[1]);
					startDay = startDT[0];
              		endDay = endDT[0];
              		allday = false;
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
                	allday = true;
          		}
            	
            	alert('selected ' + startDay + ' to ' + endDay);           	
            	$('#startdate').val(startDay) 
            	$('#enddate').val(endDay) 
            	
            	$('#schduleForm').modal();
            	
          	}
			
    	});
		calendar.render();
		
		$('#submitbtn').click(function(){
			
			 $.ajax({
				url:"<c:url value='/fcinput.kosmo'/>",
				data:$('#frmSchdule').serialize(),
				type:'post',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType:'text',
				success:function(data){
					if(allday){
						calendar.addEvent({
							title: $('#caltitle').val(),
							start: startDay,
							end: endDay,
							allDay: true
						});
					}
					else{
						calendar.addEvent({
							title: $('#caltitle').val(),
							start: startDT[0]+'T'+startDT[1],
							end: endDT[0]+'T'+endDT[1]
						});
					}	
				}
			});
			$('#schduleForm').modal('hide');
			
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
					<h4 class="modal-title">일정등록</h4>
				</div>
				<div class="modal-body">
					<form class='form-margin40' role='form' method='post' id='frmSchdule'>
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
							<input class='form-control startDate' type="text" id='endStr' name='endStr'>
						</div>
						<input type="hidden" id='startdate' name='startdate'>
						<input type="hidden" id='enddate' name='enddate'>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class='form-group'>
							<label>내용</label>
							<textarea rows="7" class='form-control' id="calcontent" name='calcontent'></textarea>
						</div>
						<div class='modal-footer'>
							<input type="button" class='btn btn-sm btn-warning' id='submitbtn' value="확인"/> 
							<input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
							<input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</div>
	

