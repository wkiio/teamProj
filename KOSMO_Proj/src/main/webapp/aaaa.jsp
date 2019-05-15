<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fc37be4712f8b89b167cddbc490382f"></script>
</head>
<body>
	
	<button onclick="javascript:searchPubTransPathAJAX();">버튼</button>
	<div id="map" style="width:100%;height:400px;"></div>
	<!-- daum Developers에서 발급받은 네이버지도 Application Key 입력  -->
	
	
	
</body>
<script>
//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

var map = new daum.maps.Map(mapContainer, mapOption); 

function searchPubTransPathAJAX() {
		var xhr = new XMLHttpRequest();
		var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX=126.9027279&SY=37.5349277&EX=126.9145430&EY=37.5499421&apiKey=L8xT8/5kgzhIaJyY1O2m4hgM22isfk6Wzh/HMf7/R0A";
		xhr.open("GET", url, true);
		xhr.send();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText ); // <- xhr.responseText 로 결과를 가져올 수 있음
			}
		}
		
	}///search
	
	
	
	
	 
		var mapOptions = {
			center: new daum.maps.LatLng(37.3595704, 127.105399),
			zoom: 10
		};

		var map = new daum.maps.Map('map', mapOptions);
		
		var sx = 126.93737555322481;
		var sy = 37.55525165729346;
		var ex = 126.88265238619182;
		var ey = 37.481440035175375;
		
		function searchPubTransPathAJAX() {
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey=L8xT8/5kgzhIaJyY1O2m4hgM22isfk6Wzh/HMf7/R0A";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
				console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
				//노선그래픽 데이터 호출
				callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
				}
			}
		}
		
		//길찾기 API 호출
		searchPubTransPathAJAX();
		
		function callMapObjApiAJAX(mabObj){
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey=L8xT8/5kgzhIaJyY1O2m4hgM22isfk6Wzh/HMf7/R0A";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultJsonData = JSON.parse(xhr.responseText);
					drawNaverMarker(sx,sy);					// 출발지 마커 표시
					drawNaverMarker(ex,ey);					// 도착지 마커 표시
					drawNaverPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
					// boundary 데이터가 있을경우, 해당 boundary로 지도이동
					if(resultJsonData.result.boundary){
							var boundary = new daum.maps.LatLngBounds(
					                new daum.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
					                new daum.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
					                );
							map.panToBounds(boundary);
					}
				}
			}
		}
		
		// 지도위 마커 표시해주는 함수
		function drawNaverMarker(x,y){
			var marker = new daum.maps.Marker({
			    position: new daum.maps.LatLng(y, x),
			    map: map
			});
		}
		
		// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
		function drawNaverPolyLine(data){
			var lineArray;
			
			for(var i = 0 ; i < data.result.lane.length; i++){
				for(var j=0 ; j <data.result.lane[i].section.length; j++){
					lineArray = null;
					lineArray = new Array();
					for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
						lineArray.push(new daum.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
					}
					
				//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
					if(data.result.lane[i].type == 1){
						var polyline = new daum.maps.Polyline({
						    map: map,
						    path: lineArray,
						    strokeWeight: 3,
						    strokeColor: '#003499'
						});
					}else if(data.result.lane[i].type == 2){
						var polyline = new daum.maps.Polyline({
						    map: map,
						    path: lineArray,
						    strokeWeight: 3,
						    strokeColor: '#37b42d'
						});
					}else{
						var polyline = new daum.maps.Polyline({
						    map: map,
						    path: lineArray,
						    strokeWeight: 3
						});
					}
				}
			}
		}
	</script>
</html>