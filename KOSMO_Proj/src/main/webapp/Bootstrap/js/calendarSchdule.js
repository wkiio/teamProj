var data = {} // List<Event>
var locationMonth = 0; // 현재 달력위치
var locationYear = 0; // 현재 년도위치
var locationWeek = 0; // 현재 주차위치
// 날짜 테그를 만들어준다
function dayTagFormat(year, month, day) {
	var tag = new StringBuffer();
	tag.append("<td id="+year+month+day+">");
	tag.append("<a onclick='schduleAdd("+year+","+month+","+day+")'>"+numFormat(day)+"</a>");
	tag.append("</td>");
	return tag.toString();
}
//숫자 5 -> 05 변경
function numFormat(num) {
	var str = ''+num;
	if(num<10 && str.indexOf('0') == -1 || str.length == 1) {
		str = '0'+num;
	}
	return str;
}
// 시간을 리턴한다
function getTime(item) {
	return numFormat(item.getHours()) + ":" + numFormat(item.getMinutes());
}
// 일정추가 폼
function schduleAdd(year, month, day) {
	$('.startDate').val(year + "-" + numFormat(month) + "-" + numFormat(day));
	$('#summary').val('');
	$('#startTime').val('');
	$('#endTime').val('');
	$('#description').val('');
	$('#schduleForm').modal();
}
// 유효성 검사 일정 저장처리
function calendarSchduleAdd() {
	var summary = $('#summary').val();
	var startTime = $('#startTime').val().split(":");
	var endTime = $('#endTime').val().split(":");
	if(summary.trim() == '' || summary.trim().length == 0) {
		swal('제목','입력해주세요');
		return false;
	}else if($('#startTime').val() == '') {
		swal('시작시간','입력해주세요');
		return false;
	}else if($('#endTime').val() == '') {
		swal('종료시간','입력해주세요');
		return false;		
	}else if(new Date(0,0,0,endTime[0],endTime[1]).getTime() - new Date(0,0,0,startTime[0],startTime[1]).getTime() < 0) {
		swal('시간','종료시간이 시작시간보다 늦습니다');
		return false;
	}else if($('#endDate').val() == '') {
		swal('종료날짜','입력해주세요');
		return false;
	}else if(new Date($('#endDate').val()).getTime() - new Date($('#startDate').val()).getTime() < 0) {
		swal('날짜','종료일이 시작일보다 늦습니다');
		return false;
	}
	$("#schduleForm").modal('hide');
	swal('calendar', 'google토큰이 필요합니다.');
	$.ajax({
		url: './calendarEventAdd.do',
		type: 'post',
		async: false,
		data : $('#frmSchdule').serialize(),
		success: function(msg) {
			if(msg.isc) {
				swal('저장', '성공하였습니다');
			}else {
				swal('저장', '실패하였습니다');
			}
		}
	});
	calendarEventList();
	screenWriteMonth();
}
//달력의 해당 날짜의 요일을 구하기위해 현재위치 반환
function monthDayIndex(month, day) {
	for(var i=0; i<month.length; i++) {
		if(month[i]==day) {
			return i;
		}
	}
}
// 달력 이전으로 이동
function moveMonthPre() {
	locationMonth--;
	screenWriteMonth();
}
// 달력 다음으로 이동
function moveMonthNext() {
	locationMonth++;
	screenWriteMonth();
}
// 달력 이전 년도로 이동
function moveFastMonthPre() {
	locationYear--;
	screenWriteMonth();	
}
// 달력 다음 년도로 이동
function moveFastMonthNext() {
	locationYear++;
	screenWriteMonth();		
}
// 화면에 달력과 이벤트를 그려준다
function screenWriteMonth() {
	var date = new Date();
	var month = date.getMonth()+1+locationMonth;
	if(month == 0) {
		locationYear--;
		locationMonth = 12 - Math.abs(locationMonth);
		month = date.getMonth()+1+locationMonth;
	}else if(month == 13) {
		locationYear++;
		locationMonth = locationMonth - 12;
		month = date.getMonth()+1+locationMonth;
	}
	var months = [month-1, month, month+1];
	if(month == 1) {
		months = [12, month, month+1];
	}else if(month == 12) {
		months = [month-1, month, 1];
	}
	var year = date.getFullYear()+locationYear;
	var monthDay = calendar.make(year, months[1]);
	var tag = new StringBuffer();
	var startIndex = monthDayIndex(monthDay, 1);
	var lastIndex = monthDayIndex(calendar.makeOne(year, months[1]), calendar.lastDay(year, months[1])) + startIndex;
	for(var i=0; i<monthDay.length; i++) {
		if(i%7 == 0) {
			tag.append('<tr>');
		}
		if(i<startIndex) {
			if(months[0]==12) {
				tag.append(dayTagFormat(year-1, months[0], monthDay[i]));
			}else {
				tag.append(dayTagFormat(year, months[0], monthDay[i]));
			}
		}else if(i <= lastIndex) {
			tag.append(dayTagFormat(year, months[1], monthDay[i]));
		}else {
			if(months[2]==1) {
				tag.append(dayTagFormat(year+1, months[2], monthDay[i]));
			}else {
				tag.append(dayTagFormat(year, months[2], monthDay[i]));
			}
		}
		if(i%7 == 6) {
			tag.append('</tr>');
		}
	}
	$('#tbody').html(tag.toString());
	$('#yearMonth').text(year + "년 " + numFormat(months[1]) + "월");
	if(data.chk) {
		for(var i=0; i<data.cnt; i++) {
			var itemMonth = data.start[i].getMonth()+1;
			var itemYear = data.start[i].getFullYear();
			if((itemMonth == months[1] || itemMonth == months[0] || itemMonth == months[2])
					&& (itemYear == year || itemYear == year-1 || itemYear == year+1)) {
				$('#'+itemYear+itemMonth+data.start[i].getDate()).append(eventTagFormat(getTime(data.start[i]), data.title[i], data.eventId[i], data.description[i]));
			}
		}
	}
}
// 일정 태그를 만들어 준다
function eventTagFormat(time, title, eventId, description) {
	var tag = new StringBuffer();
	tag.append("<p>");
	tag.append('<a data-toggle="collapse" data-target="#collapseExample'+eventId+'" aria-expanded="false" aria-controls="collapseExample" onclick="collapse(\''+eventId+'\')">');
	tag.append(time+"&nbsp;&nbsp;"+title);
	tag.append('</a>');
	tag.append('<div class="collapse" id="collapseExample'+eventId+'">');
	if(description == null) {
		tag.append('<div class="well">내용이 없습니다</div>');
	}else {
		tag.append('<div class="well">'+description+'</div>');
	}
	tag.append('<div style="text-align: right;"><input type="button" class="btn btn-sm btn-warning" value="수정" onclick="modifyEventModal(\''+title+'\',\''+eventId+'\',\''+description+'\')"/>&nbsp;');
	tag.append('<input type="button" class="btn btn-sm btn-warning" value="삭제" onclick="removeEventOne(\''+eventId+'\')"/></div>');
	tag.append('</div>');
	tag.append("</p>");
	return tag.toString();
}
// collapse 처리
function collapse(eventId) {
	$('.collapse').not('#collapseExample'+eventId).each(function(){
		$(this).attr('class', 'collapse collapse');
	});	
}
// 일정수정 modal
function modifyEventModal(title, eventId, description) {
	$('#modifySummary').val(title);
	if(description != 'undefined') {
		$('#modifyDescription').val(description);
	}else {
		$('#modifyDescription').val('');
	}
	$('#modifyEventId').val(eventId);
	$('#schduleFormModify').modal();
}
// 일정수정 처리
function modifyEvent() {
	var summary = $('#modifySummary').val();
	if(summary.trim() == '' || summary.trim().length == 0) {
		swal('제목','입력해주세요');
		return false;	
	}
	$("#schduleFormModify").modal('hide');
	$.ajax({
		url: './calendarEventModify.do',
		type: 'post',
		async: false,
		data: $('#frmSchduleModify').serialize(),
		success: function(msg) {
			if(msg.isc) {
				swal('수정', '성공하였습니다');
			}else {
				swal('수정', '실패하였습니다');
			}
		}
	});
	calendarEventList();	
	if($('#chk').val() == '1') {
		screenWriteWeek();
	}else {
		screenWriteMonth();
	}
}
// 일정삭제
function removeEventOne(eventId) {
	$.ajax({
		url: './calendarEventRemoveOne.do',
		type: 'post',
		async: false,
		data : {
			"eventId" : eventId,
			"calendarId" : $('#calendarId').val()
		},
		success: function(msg) {
			if(msg.isc) {
				swal('삭제', '성공하였습니다');
			}else {
				swal('삭제', '실패하였습니다');
			}
		}
	});
	calendarEventList();
	if($('#chk').val() == '1') {
		screenWriteWeek();
	}else {
		screenWriteMonth();
	}
}
// ajax로 이벤트 데이터를 받는다
function calendarEventList() {
	$.ajax({
		url: './calendarEventList.do',
		type: 'post',
		data: {
			"calendarId" : $('#calendarId').val()
		},
		async: false,
		success: function(lists) {
			if(lists.length != 0) {
				data.chk = true;
				data.cnt = lists.length;
				data.title = new Array();
				data.description = new Array();
				data.start = new Array();
				data.end = new Array();
				data.eventId = new Array();
				$.each(lists, function(i, item){
					data.title[i] = item.summary;
					data.description[i] = item.description;
					data.start[i] = new Date(item.start.dateTime.value);
					data.end[i] = new Date(item.end.dateTime.value);
					data.eventId[i] = item.id;
				});
			}else {
				data.chk = false;
			}
		}
	});
}
// 주단위로 화면에 그린다
function screenWriteWeek() {
	var date = new Date();
	var month = date.getMonth()+1+locationMonth;
	if(month == 0) {
		locationYear--;
		locationMonth = 12 - Math.abs(locationMonth);
		month = date.getMonth()+1+locationMonth;
	}else if(month == 13) {
		locationYear++;
		locationMonth = locationMonth - 12;
		month = date.getMonth()+1+locationMonth;
	}
	var year = date.getFullYear()+locationYear;
	if(locationWeek < 0) {
		locationMonth--;
		month = date.getMonth()+1+locationMonth;
		if(month == 0) {
			locationYear--;
			locationMonth = 12 - Math.abs(locationMonth);
			month = date.getMonth()+1+locationMonth;
			year = date.getFullYear()+locationYear;
		}
		if(new Date(year, month-1, calendar.lastDay(year, month)).getDay() == 6) {
			locationWeek = calendar.make(year, month).length/7-1;
		}else {
			locationWeek = calendar.make(year, month).length/7-2;
		}
	}else if(locationWeek > calendar.make(year, month).length/7-2) {
		locationMonth++;
		month = date.getMonth()+1+locationMonth;
		if(month == 13) {
			locationYear++;
			locationMonth = locationMonth - 12;
			month = date.getMonth()+1+locationMonth;
			year = date.getFullYear()+locationYear;
		}		
		locationWeek = 0;
	}
	var months = [month-1, month, month+1];
	if(month == 1) {
		months = [12, month, month+1];
	}else if(month == 12) {
		months = [month-1, month, 1];
	}
	var monthDay = calendar.make(year, months[1]);
	var start = 0+locationWeek*7;
	var last = 6+locationWeek*7;
	var startIndex = monthDayIndex(monthDay, 1);
	var lastIndex = monthDayIndex(calendar.makeOne(year, months[1]), calendar.lastDay(year, months[1])) + startIndex;
	for(var i=start; i<=last; i++) {
		if(i<startIndex) {
			$('.week').eq(i%7).text('('+numFormat(months[0])+'.'+numFormat(monthDay[i])+')');
		}else if(i <= lastIndex) {
			$('.week').eq(i%7).text('('+numFormat(months[1])+'.'+numFormat(monthDay[i])+')');
		}else {
			$('.week').eq(i%7).text('('+numFormat(months[2])+'.'+numFormat(monthDay[i])+')');
		}
	}
	if(locationWeek != 0) {
		$('#yearMonth').text(year + "년 " + numFormat(months[1]) + "월 " + numFormat(monthDay[start]) + "일 ~ " + numFormat(months[1]) + "월 " + numFormat(monthDay[last]) + "일");
	}else {
		if(months[1] == 1) {
			$('#yearMonth').text((year-1) + "년 " + numFormat(months[0]) + "월 " + numFormat(monthDay[start]) + "일 ~ " + year + "년 " + numFormat(months[1]) + "월 " + numFormat(monthDay[last]) + "일");
		}else {
			$('#yearMonth').text(year + "년 " + numFormat(months[0]) + "월 " + numFormat(monthDay[start]) + "일 ~ " + numFormat(months[1]) + "월 " + numFormat(monthDay[last]) + "일");
		}
	}
	var tag = new StringBuffer();
	for(var i=0, j=0, k=0; i<384; i++) {
		if(i%8 == 0) {
			tag.append('<tr style="text-align: center;">');
			j++;
		}
		if(j%2 == 1) {
			if(i%8 == 0) {
				tag.append('<td rowspan="2" style="height: 5px;></td>');
				tag.append('<td style="height: 5px; border-bottom: 1px dotted orange;">'+numFormat(k++)+':00</td>');
			}else {
				tag.append('<td class="'+j+'" style="height: 5px; border-bottom: 1px dotted orange;"></td>');
			}
		}else {
			if(i%8 < 7) {
				tag.append('<td class="'+j+'" style="height: 5px; border-top: 1px dotted orange;"></td>');
			}
		}
		if(i%8 == 7) {
			tag.append('</tr>');
		}
	}
	$('#tbody').html(tag.toString());
	// 캘린더 날짜정보 처리 고민필요 지금은 귀찮으니 대충 작성
	if(data.chk) {
		for(var i=start; i<=last; i++) {
			for(var j=0; j<data.cnt; j++) {
				if(i<startIndex) {
					weekStartTimeAppend(i, j, monthDay, months, year, -1);
					weekEndTimeAppend(i, j, monthDay, months, year, -1);
				}else if(i <= lastIndex) {
					if(monthDay[i] == data.start[j].getDate() && months[1] == data.start[j].getMonth()+1 && year == data.start[j].getFullYear()) {
						if(data.start[j].getMinutes() < 30) {
							$('.'+(data.start[j].getHours()*2+1)).eq(i%7).html(eventTagFormat(getTime(data.start[j]), data.title[j], data.eventId[j], data.description[j]));
						}else {
							$('.'+(data.start[j].getHours()*2+2)).eq(i%7).html(eventTagFormat(getTime(data.start[j]), data.title[j], data.eventId[j], data.description[j]));
						}
					}
					if(data.start[j].getHours() != data.end[j].getHours() || (data.start[j].getMinutes() < 30 && data.end[j].getMinutes() >= 30)) {
						if(monthDay[i] == data.end[j].getDate() && months[1] == data.end[j].getMonth()+1 && year == data.end[j].getFullYear()) {
							if(data.end[j].getMinutes() < 30) {
								$('.'+(data.end[j].getHours()*2+1)).eq(i%7).html(eventTagFormatEnd(getTime(data.end[j]), data.title[j], data.eventId[j], data.description[j]));
							}else {
								$('.'+(data.end[j].getHours()*2+2)).eq(i%7).html(eventTagFormatEnd(getTime(data.end[j]), data.title[j], data.eventId[j], data.description[j]));
							}
						}					
					}
				}else {
					weekStartTimeAppend(i, j, monthDay, months, year, 1);
					weekEndTimeAppend(i, j, monthDay, months, year, 1);
				}
			}
		}
	}
}
// startTime Tag append
function weekStartTimeAppend(i, j, monthDay, months, year, num) {
	if(monthDay[i] == data.start[j].getDate() && months[0] == data.start[j].getMonth()+1) {
		if(months[0] == 12 && year+num == data.start[j].getFullYear()) {
			if(data.start[j].getMinutes() < 30) {
				$('.'+(data.start[j].getHours()*2+1)).eq(i%7).html(eventTagFormat(getTime(data.start[j]), data.title[j], data.eventId[j], data.description[j]));
			}else {
				$('.'+(data.start[j].getHours()*2+2)).eq(i%7).html(eventTagFormat(getTime(data.start[j]), data.title[j], data.eventId[j], data.description[j]));
			}
		}else if(year == data.start[j].getFullYear()) {
			if(data.start[j].getMinutes() < 30) {
				$('.'+(data.start[j].getHours()*2+1)).eq(i%7).html(eventTagFormat(getTime(data.start[j]), data.title[j], data.eventId[j], data.description[j]));
			}else {
				$('.'+(data.start[j].getHours()*2+2)).eq(i%7).html(eventTagFormat(getTime(data.start[j]), data.title[j], data.eventId[j], data.description[j]));
			}						
		}
	}	
}
// endTime Tag append
function weekEndTimeAppend(i, j, monthDay, months, year, num) {
	if(data.start[j].getHours() != data.end[j].getHours() || (data.start[j].getMinutes() < 30 && data.end[j].getMinutes() >= 30)) {
		if(monthDay[i] == data.end[j].getDate() && months[2] == data.end[j].getMonth()+1) {
			if(months[2] == 1 && year+num == data.end[j].getFullYear()) {
				if(data.end[j].getMinutes() < 30) {
					$('.'+(data.end[j].getHours()*2+1)).eq(i%7).html(eventTagFormatEnd(getTime(data.end[j]), data.title[j], data.eventId[j], data.description[j]));
				}else {
					$('.'+(data.end[j].getHours()*2+2)).eq(i%7).html(eventTagFormatEnd(getTime(data.end[j]), data.title[j], data.eventId[j], data.description[j]));
				}
			}else if(year == data.end[j].getFullYear()) {
				if(data.end[j].getMinutes() < 30) {
					$('.'+(data.end[j].getHours()*2+1)).eq(i%7).html(eventTagFormatEnd(getTime(data.end[j]), data.title[j], data.eventId[j], data.description[j]));
				}else {
					$('.'+(data.end[j].getHours()*2+2)).eq(i%7).html(eventTagFormatEnd(getTime(data.end[j]), data.title[j], data.eventId[j], data.description[j]));
				}
			}
		}					
	}	
}
//일정 종료 태그를 만들어 준다
function eventTagFormatEnd(time, title, eventId, description) {
	var tag = new StringBuffer();
	tag.append("<p>");
	tag.append('<a style="color: red;" data-toggle="collapse" data-target="#collapseExample'+eventId+'" aria-expanded="false" aria-controls="collapseExample" onclick="collapse(\''+eventId+'\')">');
	tag.append(time+"&nbsp;&nbsp;"+title);
	tag.append('</a>');
	tag.append("</p>");
	return tag.toString();
}
// 이전 주 이동
function moveWeekPre() {
	locationWeek--;
	screenWriteWeek();
}
// 다음 주 이동
function moveWeekNext() {
	locationWeek++;
	screenWriteWeek();
}
//이전 달 주 이동
function moveFastWeekPre() {
	locationMonth--;
	screenWriteWeek();	
}
// 다음 달 주 이동
function moveFastWeekNext() {
	locationMonth++;
	screenWriteWeek();	
}
// 주단위로 바꾼다
function tabWeek() {
	$('#movePre').attr('onclick', 'moveWeekPre()');
	$('#moveNext').attr('onclick', 'moveWeekNext()');
	$('#moveFastPre').attr('onclick', 'moveFastWeekPre()');
	$('#moveFastNext').attr('onclick', 'moveFastWeekNext()');
	if($('#chk').val() != '1') {
		$('#thead tr:eq(0) td:eq(0)').attr('colspan', '8');
		$('#thead tr:eq(1)').prepend('<td>시간</td>');
		$('#chk').val('1');
	}
	screenWriteWeek();
}
// 월단위로 바꾼다
function tabMonth() {
	$('#movePre').attr('onclick', 'moveMonthPre()');
	$('#moveNext').attr('onclick', 'moveMonthNext()');
	$('#moveFastPre').attr('onclick', 'moveFastMonthPre()');
	$('#moveFastNext').attr('onclick', 'moveFastMonthNext()');
	if($('#chk').val() != '0') {
		$('#thead tr:eq(0) td:eq(0)').attr('colspan', '7');
		$('#thead tr:eq(1) td:eq(0)').remove();
		$('.week').text('');
		$('#chk').val('0');
	}
	screenWriteMonth();
}
$(document).ready(function(){
	calendarEventList();
	screenWriteMonth();
});