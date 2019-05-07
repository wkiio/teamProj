<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


<div class="site-section" style="height:auto; padding:2em;z-index=3" >
     <div class ="row">
       <!--   <div onload="initTmap()"> -->
    <div id=initTmap">
		  <div id="map_div">
		   </div>
	<p id="result">결과 표시</p>
	</div>
  </div>
</div>
  


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=d221b4f7-4d7b-4b51-9140-31993be4af51"></script>
        <!-- 발급받은 인증키를 위에 넣는다 -->
      <!--   <script >
        initTmap('initTmap');
        function initTmap(){
        	console.log("fff");
            var map = new Tmap.Map({
                div:'map_div',  // 결과 지도를 표시할 곳
            	width : "800px",
            	height : "400px",
            });
            // 경로 탐색 출발지점과 도착 지점의 좌표
            // 구글 지도에서 나오는 좌표의 x, y를 바꾸면 된다.
            var startX = 127.104997;
            var startY = 37.220800;
            var endX = 127.028131;
            var endY = 37.239072;
            var passList = null;
            var prtcl;
            var headers = {};

            headers["appKey"]="d221b4f7-4d7b-4b51-9140-31993be4af51"; // 발급받은 인증키를 넣어야 한다
            $.ajax({
                method:"POST",
                headers : headers,
                url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",
                async:false,
                data:{
                    startX : startX,
                    startY : startY,
                    endX : endX,
                    endY : endY,
                    passList : passList,
                    reqCoordType : "WGS84GEO",
                    resCoordType : "EPSG3857",
                    angle : "172",
                    searchOption : "0",
                    trafficInfo : "Y", //교통정보 표출 옵션입니다.
                    "${_csrf.parameterName}" : "${_csrf.token}"
                },

                success:function(response){ //API가 제대로 작동할 경우 실행될 코드
                    prtcl = response;

                    // 결과 출력 부분 - 여기는 잘 모르겠음.
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

                    // 실시간 교통정보 추가
                    var trafficColors = {
                        extractStyles:true,
                        /* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
                        trafficDefaultColor:"#000000", //Default
                        trafficType1Color:"#009900", //원활
                        trafficType2Color:"#8E8111", //지체
                        trafficType3Color:"#FF0000", //정체
                    };    
                    var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
                    routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
                    routeLayer.addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   

                    map.addLayer(routeLayer); // 지도에 백터 레이어 추가

                    // 경로탐색 결과 반경만큼 지도 레벨 조정
                    map.zoomToExtent(routeLayer.getDataExtent());
                },
                error:function(request,status,error){ // API가 제대로 작동하지 않을 경우
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }
        
        
        </script> -->

	<script>
	
	// 1. 지도 띄우기
	map = new Tmap.Map({
		div : 'map_div',
		width : "800px",
		height : "400px",
	});
	map.setCenter(new Tmap.LonLat("127.058908811749", "37.52084364186228").transform("EPSG:4326", "EPSG:3857"), 12);
	routeLayer = new Tmap.Layer.Vector("route");
	map.addLayer(routeLayer);

	markerStartLayer = new Tmap.Layer.Markers("start");
	markerEndLayer = new Tmap.Layer.Markers("end");
	markerWaypointLayer = new Tmap.Layer.Markers("waypoint");
	markerWaypointLayer2 = new Tmap.Layer.Markers("waypoint2");
	pointLayer = new Tmap.Layer.Vector("point");

	// 2. 시작, 도착 심볼찍기
	// 시작
	map.addLayer(markerStartLayer);

	var size = new Tmap.Size(24, 38);
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
	var marker_s = new Tmap.Marker(new Tmap.LonLat("127.02810900563199", "37.519892712436906").transform("EPSG:4326", "EPSG:3857"), icon);
	markerStartLayer.addMarker(marker_s);

	// 도착
	map.addLayer(markerEndLayer);

	var size = new Tmap.Size(24, 38);
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
	var marker_e = new Tmap.Marker(new Tmap.LonLat("127.13281976335786", "37.52130314703887").transform("EPSG:4326", "EPSG:3857"), icon);
	markerEndLayer.addMarker(marker_e);

	//경유지 마커 제거
	markerWaypointLayer.clearMarkers();
	markerWaypointLayer2.clearMarkers();

	</script>>
	
