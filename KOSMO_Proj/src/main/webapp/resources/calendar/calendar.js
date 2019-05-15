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
				console.log(data);
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
				console.log('클릭');
				console.log("${id}");
				console.log(info.event.id);
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
	            	$('#startStr').val(info.startStr)
	            	$('#endStr').val(str)
	      		}
	        	alert('selected ' + startDay + ' to ' + endDay);           	
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
		console.log('addevent');
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
				console.log("이벤트success");
				if($('#startTime').val()==""){				
					calendar.addEvent({
						id: data,
						title: $('#caltitle').val(),
						start: $('#startStr').val(),
						end: $('#endStr').val(),
						description: $('#calcontent').val(),
						color: color,
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
					});
				}
				console.log("이벤트");
				console.log(data);

				$('#calno').val(data);
				if($('#type').val()=="행사"){
					console.log('행사임');
					console.log($('#calno').val());
					console.log('폼이동준비');
					$('#frmSchdule').prop("action","<c:url value='/fcupload.kosmo?${_csrf.parameterName}=${_csrf.token}'/>");
					$('#frmSchdule').submit();
				}
				else {
					console.log('행사아님');
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
		console.log(info.event.borderColor);
		switch(info.event.borderColor){
			case "#872901": $('#modiftype').val("중요"); break;
			case "#a36a00": $('#modiftype').val("생일"); break;
			case "#bcb900": $('#modiftype').val("기념일"); break;
			case "#5ebc00": $('#modiftype').val("예방접종"); break;
			case "#2f00bc": $('#modiftype').val("약속"); break;
			case "#a00196": $('#modiftype').val("행사"); break;
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
	
	//일정삭제
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
	
	function seachEvent(info){
		console.log("이벤트 찾기 시작");
		$.ajax({
			url:"<c:url value='/seachevent.kosmo'/>",
			data:{'calno':info.event.id,"${_csrf.parameterName}":"${_csrf.token}"},
			type:'post',
			dataType:'text',
			success:function(data){
				console.log("이벤트 찾기 성공");
				console.log(data);
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
		console.log("시작");
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
		console.log('선택');
		console.log($('#type').val());
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