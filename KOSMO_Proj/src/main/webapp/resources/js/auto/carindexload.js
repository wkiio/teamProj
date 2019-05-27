$(function(){
//////////////지도
	// map 생성
	// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
	var marker_s;
	var marker_e;
	var map = new Tmap.Map({div:'map_div', // map을 표시해줄 div
							width:'100%',  // map의 width 설정
							height:'400px' // map의 height 설정
	}); 
	var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
	var markerStartLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
	var markerEndLayer = new Tmap.Layer.Markers("end");// 마커 레이어 생성
	map.addLayer(routeLayer);
	map.addLayer(markerStartLayer);
	map.addLayer(markerEndLayer);
		
	///지도 이동
	function setLocation(lat,lon){
		console.log('지도이동한다');
		var lonlat = new Tmap.LonLat(lon,lat).transform("EPSG:4326", "EPSG:3857");//좌표 설정
		map.setCenter(lonlat, 15);//map의 중심 좌표 설정
	};
	
	function createstartMarker(lat,lon){
		console.log('시작 마커생성한다');	
		markerStartLayer.removeMarker(marker_s); // 기존 마커 삭제	
		var size = new Tmap.Size(24, 38);//아이콘 사이즈 설정
		var offset = new Tmap.Pixel(-(size.w/2), -(size.h));//아이콘 중심점 설정
		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',size, offset);//마커 아이콘 설정
		marker_s = new Tmap.Marker(new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857"), icon);
		markerStartLayer.addMarker(marker_s);//마커 레이어에 마커 추가
	};
	
	function createendMarker(lat,lon){
		console.log('도착 마커생성한다');
		markerEndLayer.removeMarker(marker_e); // 기존 마커 삭제	
		var size = new Tmap.Size(24, 38);//아이콘 사이즈 설정
		var offset = new Tmap.Pixel(-(size.w/2), -(size.h));//아이콘 중심점 설정
		var icon = new Tmap.Icon("http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png", size, offset);//마커 아이콘 설정
		marker_e = new Tmap.Marker(new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857"), icon);
		markerEndLayer.addMarker(marker_e);//마커 레이어에 마커 추가
	};
	function loadMap(){
		//4. 경로 탐색 API 사용요청
		var startX = $("#start_ypos").val();
		var startY = $("#start_xpos").val();
		var endX = $("#end_ypos").val();
		var endY = $("#end_xpos").val();
		console.log(startX);
		console.log(startY);
		console.log(endX);
		console.log(endY);
		var prtcl;
		var headers = {}; 
		headers["appKey"]="b5cc2a5e-34c4-441b-96f9-0a2639aabc1a";
		$.ajax({
				method:"POST",
				headers : headers,
				url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//
				async:false,
				data:{
					startX : startX,
					startY : startY,
					endX : endX,
					endY : endY,

					reqCoordType : "WGS84GEO",
					resCoordType : "EPSG3857",
					angle : "172",
					searchOption : "0",
					trafficInfo : "Y" //교통정보 표출 옵션입니다.
				},
				success:function(response){
					console.log("경로그린다");
					console.log(response);
					prtcl = response;
					// 결과 출력
					var innerHtml ="";
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
					xmlDoc = $.parseXML( prtclString ),
					$xml = $( xmlDoc ),
					$intRate = $xml.find("Document");
			    	
					var tDistance = " 총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
					var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";	
					var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	
					var taxiFare = " 예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";	

					$("#result").text(tDistance+tTime+tFare+taxiFare);
					
					//5. 경로탐색 결과 Line 그리기
					var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
					var trafficColors = {
							extractStyles:true,
							
							/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
							trafficDefaultColor:"#000000", //Default
							trafficType1Color:"#009900", //원할
							trafficType2Color:"#8E8111", //지체
							trafficType3Color:"#FF0000"  //정체
							
					};    
					var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
					console.log(kmlForm);
					routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
					routeLayer.addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   
					
					map.addLayer(routeLayer); // 지도에 백터 레이어 추가
					console.log("ㄸ떠떠떠떠떠떠떠떠"+map);
					console.log(map);
					// 6. 경로탐색 결과 반경만큼 지도 레벨 조정
					map.zoomToExtent(routeLayer.getDataExtent());
					
				
				
			},
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
			
		});
	}
	
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
			createstartMarker(start_xpos,start_ypos);
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
			createendMarker(end_xpos,end_ypos);
			$("#end").blur();
			loadMap();
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

	

});









