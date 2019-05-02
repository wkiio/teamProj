var tooltip = false;
$(function(){
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new daum.maps.LatLng(33.452613, 126.570888),//지도의 중심좌표.
		level : 5
	//지도의 레벨(확대, 축소 정도)
	};	
	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	map.setDraggable(false);
	map.setZoomable(false);
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [null,null];
	var polyline = null;
	
	//현재 유저 위치 얻고 지도 이동
	navigator.geolocation.getCurrentPosition(function(pos) {
		var latitude = pos.coords.latitude;
		var longitude = pos.coords.longitude;
		//지도 이동
		setLocation(latitude,longitude)
	});
	
	//지도 이동
	function setLocation(lat,lon){
		// 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng(lat, lon);	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	};
	
	//출발 마커 생성 시작======================
	function createStartMarker(slat,slon) {
		markerCheck(0);
		lindCheck();
		console.log('시작 마커 그린다')
		var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
		startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		startOption = {
			offset : new daum.maps.Point(15, 43)
		// 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		
		// 출발 마커 이미지를 생성합니다
		var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);
		
		// 출발 마커가 표시될 위치입니다 
		var startPosition = new daum.maps.LatLng(slat, slon);
		
		// 출발 마커를 생성합니다
		var startMarker = new daum.maps.Marker({
			map : map, // 출발 마커가 지도 위에 표시되도록 설정합니다
			position : startPosition,
			draggable : false, // 출발 마커가 드래그 가능하도록 설정합니다
			image : startImage
		// 출발 마커이미지를 설정합니다
		});
		markers[0]=startMarker;
	};
	
	//도착 마커 생성 시작======================
	function createEndMarker(elat,elon){
		markerCheck(1);
		console.log('도착 마커 그린다')
		var arriveSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
		arriveSize = new daum.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
		arriveOption = {
			offset : new daum.maps.Point(15, 43)
		// 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		
		// 도착 마커 이미지를 생성합니다
		var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
		
		// 도착 마커가 표시될 위치입니다 
		var arrivePosition = new daum.maps.LatLng(elat, elon);
		
		// 도착 마커를 생성합니다 
		var arriveMarke = new daum.maps.Marker({
			map : map, // 도착 마커가 지도 위에 표시되도록 설정합니다
			position : arrivePosition,
			draggable : false, // 도착 마커가 드래그 가능하도록 설정합니다
			image : arriveImage
		// 도착 마커이미지를 설정합니다
		});
		markers[1]=arriveMarke;
	};	
	
	// 선그리기===================
	function createLine(slat,slon,elat,elon){
		console.log('선 그린다')
		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		var linePath = [ new daum.maps.LatLng(slat, slon),
		
		new daum.maps.LatLng(elat, elon) ];
		
		// 지도에 표시할 선을 생성합니다
		polyline = new daum.maps.Polyline({
			path : linePath, // 선을 구성하는 좌표배열 입니다
			strokeWeight : 5, // 선의 두께 입니다
			strokeColor : '#ff0000', // 선의 색깔입니다
			strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		// 지도에 선을 표시합니다 
		polyline.setMap(map); 
		
	};
	function setBounds(slat,slon,elat,elon){
		var spoint = new daum.maps.LatLng(slat, slon);
		var epoint = new daum.maps.LatLng(elat, elon);
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new daum.maps.LatLngBounds();
		bounds.extend(spoint);
		bounds.extend(epoint);
		map.setBounds(bounds);
	}
	
	function markerCheck(i) {
		if(markers[i] != null){	
			console.log('이전 마크가 있다')
			markers[i].setMap(null);
		}
		else {
			console.log('이전 마크가 없다')
		}
		
	};
	function lindCheck(){
		if(polyline != null){
			console.log('이전 라인이 있다')
			polyline.setMap(null);
		}
		else {
			console.log('이전 라인이 없다')
		}
	};
	
	//========================주소검색 자동완성=====================================================================================================
	var searched = "";
	var oldQuery = "";
	var query;
	var sequence = -1;
	
	var start_xpos;
	var start_ypos;
	var end_xpos;
	var end_ypos;
	
	//출발지 주소검색
	$("#start").focus().on("click", function(event) {
		console.log('이벤트 시작');
		$(".contents").hide();
		if ($(this).val() == "") {
			console.log('입력값 없어');
			return false;
		}
		$(this).autocomplete("search");
	}).autocomplete({
		source : function(request, response) {
			query = S9QC.clean(request.term);
			if (query == '') {
				if (S9QC.isEmpty) {
					$(".contents").hide();
				}
				return;
			}
			console.log('에이작스 시작할께')
			//데이터 요청
			$.ajax({
				url : "http://202.8.161.50:9191/suggest",
				dataType : "jsonp",
				cache : false,
				data : {query : query},
				success : function(data) {
					console.log('에이작스 성공')
					searched = data.query;
					response(data.values);
				}
			});
		},
		minLength : 1,
		delay : 300,
		select : function(event, ui) {
			console.log('데이터 저장할께')
			//얻어온 데이터 지정한 위치에 출력
			var ssido = ui.item.ssido.toString();
			var jibun = ui.item.jibun.toString();
			var jibunno = ui.item.jibunno.toString();
			var buildname = ui.item.buildname.toString();//건물명
			var latlng = ui.item.latlng.toString().split(",");//위도 경도
			start_xpos=latlng[0];
			start_ypos=latlng[1];
			$("#start").val(ssido+jibun+jibunno+buildname);
			$("#start_xpos").val(start_xpos);
			$("#start_ypos").val(start_ypos);
			setLocation(start_xpos,start_ypos);
			createStartMarker(start_xpos,start_ypos);
			$("#start").blur();
			return false; // false: leave input value, true: resert input value
		},
		focus : function(event, ui) {

			return false; // false: leave input value, true: resert input value
		}
	}).autocomplete("instance")._renderItem = function(ul, item) {
		console.log('자동완성 그린다')
		//얻은 데이터로 자동완성 그리기
		item.jibunTX = item.ssido + " " + item.jibun + " " + item.jibunno + (item.buildname.length > 0 ? " " + item.buildname : "");
		item.jibunHL = S9HL.highlight(item.jibunTX, searched);

		return $("<li>").append("<jbn>지번</jbn> ").append(item.jibunHL).appendTo(ul);
	};
	
	//도착지 주소검색
	$("#end").focus().on("click", function(event) {
		console.log('이벤트 시작2');
		$(".contents").hide();
		if ($(this).val() == "") {
			console.log('입력값 없어2');
			return false;
		}
		$(this).autocomplete("search");
	}).autocomplete({
		source : function(request, response) {
			query = S9QC.clean(request.term);
			if (query == '') {
				if (S9QC.isEmpty) {
					$(".contents").hide();
				}
				return;
			}
			console.log('에이작스 시작할께2')
			//데이터 요청
			$.ajax({
				url : "http://202.8.161.50:9191/suggest",
				dataType : "jsonp",
				cache : false,
				data : {query : query},
				success : function(data) {
					console.log('에이작스 성공2')
					searched = data.query;
					response(data.values);
				}
			});
		},
		minLength : 1,
		delay : 300,
		select : function(event, ui) {
			console.log('데이터 저장할께2')
			//얻어온 데이터 지정한 위치에 출력
			var ssido = ui.item.ssido.toString();//시,도
			var jibun = ui.item.jibun.toString();//지번
			var jibunno = ui.item.jibunno.toString();//지번 번호
			var buildname = ui.item.buildname.toString();//건물명
			var latlng = ui.item.latlng.toString().split(",");//위도 경도
			end_xpos=latlng[0];
			end_ypos=latlng[1];
			$("#end").val(ssido+jibun+jibunno+buildname);
			$("#end_xpos").val(end_xpos);
			$("#end_ypos").val(end_ypos);
			setLocation(end_xpos,end_ypos);
			createEndMarker(end_xpos,end_ypos);
			if(start_xpos !=null && end_xpos != null){
				createLine(start_xpos,start_ypos,end_xpos,end_ypos);
				setBounds(start_xpos,start_ypos,end_xpos,end_ypos);
			}
			$("#end").blur();
			return false; // false: leave input value, true: resert input value
		},
		focus : function(event, ui) {

			return false; // false: leave input value, true: resert input value
		}
	}).autocomplete("instance")._renderItem = function(ul, item) {
		console.log('자동완성 그린다2')
		//얻은 데이터로 자동완성 그리기
		item.jibunTX = item.ssido + " " + item.jibun + " " + item.jibunno + (item.buildname.length > 0 ? " " + item.buildname : "");
		item.jibunHL = S9HL.highlight(item.jibunTX, searched);

		return $("<li>").append("<jbn>지번</jbn> ").append(item.jibunHL).appendTo(ul);
	};
	
	$('#start_xpos').change(function(){
		console.log('변함')
		
	});
	
	
	
});			