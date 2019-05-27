
// 1. 지도 띄우기
map = new Tmap.Map({
	div : 'map_div',
	width : "100%",
	height : "400px",
});
map.setCenter(new Tmap.LonLat(s_xpos.value,s_ypos.value).transform("EPSG:4326", "EPSG:3857"), 12);
routeLayer = new Tmap.Layer.Vector("route");
map.addLayer(routeLayer);

markerStartLayer = new Tmap.Layer.Markers("start");
markerEndLayer = new Tmap.Layer.Markers("end");
pointLayer = new Tmap.Layer.Vector("point");

//2. 시작, 도착 심볼찍기
//시작
map.addLayer(markerStartLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
var marker_s = new Tmap.Marker(new Tmap.LonLat(s_xpos.value, s_ypos.value).transform("EPSG:4326", "EPSG:3857"), icon);
markerStartLayer.addMarker(marker_s);

//도착
map.addLayer(markerEndLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
var marker_e = new Tmap.Marker(new Tmap.LonLat(e_xpos.value, e_ypos.value).transform("EPSG:4326", "EPSG:3857"), icon);
markerEndLayer.addMarker(marker_e);

//경유지 마커 제거
markerWaypointLayer.clearMarkers();
markerWaypointLayer2.clearMarkers();

//4. 경로 탐색 API 사용요청
var startX = s_xpos.value;
var startY = s_ypos.value;
var endX = e_xpos.value;
var endY = e_ypos.value;
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
			//출발지,도착지 마커 제거
			markerStartLayer.clearMarkers();
			markerEndLayer.clearMarkers();
			//경유지 마커 제거
			markerWaypointLayer.clearMarkers();
							
			var trafficColors = {
					extractStyles:true,
					
					/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
					trafficDefaultColor:"#000000", //Default
					trafficType1Color:"#009900", //원할
					trafficType2Color:"#8E8111", //지체
					trafficType3Color:"#FF0000"  //정체
					
				};    
			var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
			routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
			routeLayer.addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   
			
			map.addLayer(routeLayer); // 지도에 백터 레이어 추가
			
			markerWaypointLayer2 = new Tmap.Layer.Markers("waypoint2");
			map.addLayer(markerWaypointLayer2);
			
			/*var size = new Tmap.Size(24, 38);
			var offset = new Tmap.Pixel(-(size.w / 2), -size.h); 
			var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
			var marker = new Tmap.Marker(new Tmap.LonLat("127.07389565460413","37.5591696189164").transform("EPSG:4326", "EPSG:3857"), icon);
			markerWaypointLayer2.addMarker(marker);
			
			var size = new Tmap.Size(24, 38);
			var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
			var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
			var marker = new Tmap.Marker(new Tmap.LonLat("127.13346617572014", "37.52127761904626").transform("EPSG:4326", "EPSG:3857"), icon);
			markerWaypointLayer2.addMarker(marker);*/
			
			// 6. 경로탐색 결과 반경만큼 지도 레벨 조정
			map.zoomToExtent(routeLayer.getDataExtent());
			
		
		
	},
	error:function(request,status,error){
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
	
	
});









