<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<style>
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 800px;
}

#category {
   position: absolute;
   top: 10px;
   left: 10px;
   border-radius: 5px;
   border: 1px solid #909090;
   box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
   background: #fff;
   overflow: hidden;
   z-index: 2;
}

#category li {
   float: left;
   list-style: none;
   width: 50px; px;
   border-right: 1px solid #acacac;
   padding: 6px 0;
   text-align: center;
   cursor: pointer;
}

#category li.on {
   background: #eee;
}

#category li:hover {
   background: #ffe6e6;
   border-left: 1px solid #acacac;
   margin-left: -1px;
}

#category li:last-child {
   margin-right: 0;
   border-right: 0;
}

#category li span {
   display: block;
   margin: 0 auto 3px;
   width: 27px;
   height: 28px;
}

/* #category li .category_bg {
   background:
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
      no-repeat;
} */

/*평점*/
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}


#category li.on .category_bg {
   background-position-x: -82px;
} 

.placeinfo_wrap {
   position: absolute;
   bottom: 28px;
   left: -150px;
   width: 300px;
}

.placeinfo {
   position: relative;
   width: 100%;
   border-radius: 6px;
   border: 1px solid #ccc;
   border-bottom: 2px solid #ddd;
   padding-bottom: 10px;
   background: #fff;
}

.placeinfo:nth-of-type(n) {
   border: 0;
   box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
   content: '';
   position: relative;
   margin-left: -12px;
   left: 50%;
   width: 22px;
   height: 12px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
   color: #fff;
   text-decoration: none;
}

.placeinfo a, .placeinfo span {
   display: block;
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

.placeinfo span {
   margin: 5px 5px 0 5px;
   cursor: default;
   font-size: 13px;
   
}

.placeinfo .title {
   font-weight: bold;
   font-size: 14px;
   border-radius: 6px 6px 0 0;
   margin: -1px -1px 0 -1px;
   padding: 10px;
   color: #fff;
   background: #d95050;
   background: #d95050
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
      no-repeat right 14px center;
}

.placeinfo .tel {
   color: #0f7833;
}

.placeinfo .jibun {
   color: #999;
   font-size: 11px;
   margin-top: 0;
}

#hospital {
   background-image : url('resources/map_icons/hos.jpg');
   
}
#emergency {
   background-image : url('resources/map_icons/emer.jpg');
   
}
#dentist {
   background-image : url('resources/map_icons/den.jpg');
   
}
#obimage {
   background-image : url('resources/map_icons/obbb.jpg');
   
}
#cafe {
   background-image : url('resources/map_icons/kizcafe.jpg');
   
}
</style>
<div class="site-section" style="height:auto; padding:2em;z-index=3" >
   <div class="main-content">   
   
      <div class="map_wrap">
          <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
          <ul id="category">
              <li id="BK9" data-order="0"> 
                  <span id="hospital" class="category_bg bank"></span>
                  소아과
              </li>       
              <li id="MT1" data-order="1"> 
                  <span id="emergency" class="category_bg mart"></span>
                  응급실
              </li>  
              <li id="PM9" data-order="2"> 
                  <span id="dentist" class="category_bg pharmacy"></span>
                  소아치과
              </li>  
              <li id="OL7" data-order="3"> 
                  <span id="obimage" class="category_bg oil"></span>
                  산부인과
              </li>        
              <li id="SC4" data-order="4"> 
                  <span id="cafe" class="category_bg oil"></span>
                  키즈카페
              </li>        
          </ul>
      </div>
<!-- Modal -->
         <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="reviewModalLabel">평점 주기</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               
               <div class="modal-body">
                  <!-- <form id="reviewform"> -->
                    <label id="kcafetitle">가게이름 : </label>
                     <label id="kcafeName">ㅁㄴㅇㅁㄴㅇ</label>
                     <div class="form-group">
                          <label for="inputName">제목</label>
                          <input type="text" class="form-control123" id="inputTitle">
                       </div>
                     <div class="form-group">
                           <label for="inputName">내용</label>                  
                           <textarea class="form-control" id="inputContext"></textarea>
                        </div>  
                        <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" value="" id="reviewId" name="reviewId">
                  <input type="hidden" value="" id="starScore" name="starScore"> 
                      </form> --%>         
                     <div class="starRev" style="margin-top: 10px">
                        <span class="starR" value="1">1</span>
                        <span class="starR" value="2">2</span>
                        <span class="starR" value="3">3</span>
                          <span class="starR" value="4">4</span>
                          <span class="starR" value="5">5</span>
                          <span class="starR" value="6">6</span>
                          <span class="starR" value="7">7</span>
                          <span class="starR" value="8">8</span>
                          <span class="starR" value="9">9</span>
                          <span class="starR" value="10">10</span>
                  </div>               
                  </div>
               
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary btngrade" id ="sendReview"  data-dismiss="modal">리뷰등록</button>
                  </div>
               
             </div>
           </div>
         </div>
         <!-- Modal -->
         <!-- Modal -->
			<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">평점 보기</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      
			      <div class="modal-body reviewtable">

			      	</div>
			      
			    </div>
			  </div>
			</div>
			<!-- Modal -->

   </div>
</div>

 <!-- Bootstrap JS-->
    <script src="admin_assets/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="admin_assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f053d576cd5dc6d9de018d8e7da2d525&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f053d576cd5dc6d9de018d8e7da2d525&libraries=services,clusterer,drawing"></script>
<script>
   //마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
   var placeOverlay = new daum.maps.CustomOverlay({
      zIndex : 1
   }), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
   markers = [], // 마커를 담을 배열입니다
   currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
      center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
      level : 5
   // 지도의 확대 레벨
   };

   // 지도를 생성합니다    
   var map = new daum.maps.Map(mapContainer, mapOption);

   //가지고온 데이타 넣어주는거?(ajax로 지금 응급실데이터 넣어줄꺼)
   var getdata;
   var premarker;

   var emData;
   var xjb;
   var yib = 3;
	var k_no;

	

   
   //주소를 좌표로 변환 하는 객체를 생성한다.asd
   var geocoder = new daum.maps.services.Geocoder();

   // 장소 검색 객체를 생성합니다
   var ps = new daum.maps.services.Places(map);
   var counter=0;
   //비동기 async 
     function changeGeo(data){       
      emData = data;      
      emData.forEach(async function(value,index){
         var search = value.addr;
         console.log("search : " + search);
         counter=0;
         await foo(value);
      });      
   }//asd
   
     function foo(sear){    
      return new Promise(function(resolve, reject){
         resolve(
               geocoder.addressSearch(sear.addr, function(result, status) {   
                  //console.log('fff:' + sear);
                  console.log('어떤주소:' + sear.addr    +  '&& result:'+status);
                   if (status === daum.maps.services.Status.OK) {
                     sear.x = result[0].x;
                     sear.y = result[0].y;   
                     console.log(sear.addr + " vv " + sear.x);                     
                  }
                  counter++;
                  console.log('co:' + counter);
                   if(counter === emData.length){
                     goNext();
                  };  
               })
               
         );            
      })      
   }  
   
  
   
   function goNext(){
      console.log("이제 시작해라 여기서 부터");
      displayPlaces(emData);
   }
   

   // 지도에 idle 이벤트를 등록합니다
   daum.maps.event.addListener(map, 'idle', searchPlaces);

   // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
   contentNode.className = 'placeinfo_wrap';

   // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
   // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
   addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
   addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

   // 커스텀 오버레이 컨텐츠를 설정합니다
   placeOverlay.setContent(contentNode);

   // 각 카테고리에 클릭 이벤트를 등록합니다
   addCategoryClickEvent();

   // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
   function addEventHandle(target, type, callback) {
      if (target.addEventListener) {
         target.addEventListener(type, callback);
      } else {
         target.attachEvent('on' + type, callback);
      }
   }

   // 카테고리 검색을 요청하는 함수입니다
   function searchPlaces() {
      if (!currCategory) {
         return;
      }
      if(!premarker){
         return;
      }

      // 커스텀 오버레이를 숨깁니다 
      placeOverlay.setMap(null);

      // 지도에 표시되고 있는 마커를 제거합니다
      removeMarker();
      //console.log('ffff' + currCategory);

      //ajax를 통해서 디비에서 가져온다.
      sendCategory(currCategory);

      ps.categorySearch(currCategory, placesSearchCB, {
         useMapBounds : true
      });
   }

   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
   function placesSearchCB(data, status, pagination) {

      if (status === daum.maps.services.Status.OK) {
         // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
         if(counter === emData.length){
            //displayPlaces(emData);
         }
         

      } else if (status === daum.maps.services.Status.ZERO_RESULT) {
         // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

      } else if (status === daum.maps.services.Status.ERROR) {
         // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

      }
   }

   // 지도에 마커를 표출하는 함수입니다
   function displayPlaces(emdata) {
      //console.log("places1: " +JSON.stringify(places));
      //console.log(places[0].place_name)
      // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
      // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
      var order = document.getElementById(currCategory).getAttribute(
            'data-order');

      var index = 0;
      //currCategory == 'OL7' || currCategory == 'BK9' || currCategory == 'PM9' || currCategory == 'MT1' 
   
       for (var i = 0; i < emData.length; i++) {
         //console.log("마커표시 시작")   
      
         // 마커를 생성하고 지도에 표시합니다
         //search = getdata[i].addr;
         // geocoder.addressSearch(getdata[i].addr,function(result,status){           
         //console.log(search);g
         var marker = addMarker(new daum.maps.LatLng(emData[i].y,
               emData[i].x), order);
         // 마커와 검색결과 항목을 클릭 했을 때
         // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
         (function(marker, emData) {
            daum.maps.event.addListener(marker, 'click', function() {
               k_no = emData.k_no;
               ///////////////////////////////////////////////////////////////////////
               //지도를 초기화 시키는 함수
          
               
               
               
               
               
               ////////////////////////////////////////////////////////////////////////
               
               displayPlaceInfo(emData);
               $('#modalreview1').click(function(){
            	      $.ajax({
            	          data : {
            	             "${_csrf.parameterName}" : "${_csrf.token}",
            	             'k_no' : emData.k_no
            	          },
            	          type : "POST",
            	          url : "<c:url value='reviewcontent.kosmo'/>",
            	          dataType : "json",
            	          success : function(data) {						
            	             console.log(data);           	             
							
            	             var html="<table style='width: 100%; text-align: center'><thead><tr><th style='background-color: #ffaec9'>아이디</th><th style='background-color: #ffaec9'>내용</th><th style='background-color: #ffaec9'>별점</th></tr></thead>";
            	             if(data.length != 0){  
	            	             $.each(data, function(index, element){
	            	            	 console.log(data.length);    
	            	            	          	             	
	            	            	 	console.log("이게멀까"+element);
	            	            		 html+="<tr><td>"+element['id']+"</td>"+"<td>"+element['content']+"</td>"+"<td>"+element['score']+"</td></tr>";
	            	            	
	            	             });
            	             }
            	             else{html+="<tr><td colspan='3'>등록된 리뷰가 없습니다</td></tr>";}
            	             html+="</table></div><div class='modal-footer'><button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>";
            	             $('.reviewtable').html(html); 
            	            }
            	           
            	       });
       			
       	 		});
               console.log("마커표시 완료했다.")
            });
         })(marker, emData[i]);

      }
         premarker = false;
   }
      
     
       
   
   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
   function addMarker(position, order) {

      var imageSrc = 'http://192.168.0.60:8080/baby/resources/map_icons/totalicons.jpg', // 마커 이미지 url, 스프라이트 이미지를 씁니다
      imageSize = new daum.maps.Size(27, 28), // 마커 이미지의 크기
      imgOptions = {
         spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
         spriteOrigin : new daum.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
         offset : new daum.maps.Point(11, 28)
      // 마커 좌표에 일치시킬 이미지 내에서의 좌표
      }, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
            imgOptions), marker = new daum.maps.Marker({
         position : position, // 마커의 위치
         image : markerImage
      });

      marker.setMap(map); // 지도 위에 마커를 표출합니다
      markers.push(marker); // 배열에 생성된 마커를 추가합니다

      return marker;
   }

   // 지도 위에 표시되고 있는 마커를 모두 제거합니다
   function removeMarker() {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
      }
      markers = [];
   }
   var cafeNo;
   
   // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
   function displayPlaceInfo(emdata,review) {
    	console.log("emdata: "+emdata)
      var content = '<div class="placeinfo">'
         + '<a class="title" href="https://map.kakao.com/?eName='+emdata.addr+'" target="_blank" title="' + emdata.name + '">'
            + emdata.name + '</a>';

            if (emdata.addr) {
               
                  var flag = typeof(emdata.sat)!='undefined'
                  console.log('flag:' +emdata.k_no);
                 content+= '<span title="' + emdata.k_no + '" id="cafeNo" >' + emdata.addr + '</span>';
                 if(flag){
                    content+= '  <span class="jibun" title="' + emdata.addr + '">(토요일 : ' + emdata.sat + ')</span>'
                       + '  <span class="jibun" title="' + emdata.addr + '">(일요일 : ' + emdata.sun + ')</span>'
                       + '  <span class="jibun" title="' + emdata.addr + '">(공휴일 : ' + emdata.holiday + ')</span>';
                       console.log("flag : "+flag)
                       
                 }
              } else {
                 content += '<span title="' + emdata.addr + '">' + emdata.addr + '</span>';
                
              }
      

            content += '<span class="tel">' + emdata.tel + '<span class="btn btn-primary" id="reviewicon" >리뷰</span>';
            content += '<span class="btn btn-primary" id="modalreview1" data-toggle="modal" data-target="#exampleModal1" val="">리뷰보기</span></span>';
            //content +="<table style='width:100%; text-align:reft;border: 1px solid black;'><thead><tr><td>작성자</td><td>리뷰내용</td></tr></thead>";
           /*  review.forEach(function(value){
            	content+="<tr><td>"+value.id+"</td><td>"+value.content+"</td></tr>";

            });
            content+="</table></div>"; */
      contentNode.innerHTML = content;
      placeOverlay.setPosition(new daum.maps.LatLng(emdata.y, emdata.x));
      placeOverlay.setMap(map);
   }

   // 각 카테고리에 클릭 이벤트를 등록합니다
   function addCategoryClickEvent() {
      var category = document.getElementById('category'), children = category.children;

      for (var i = 0; i < children.length; i++) {
         children[i].onclick = onClickCategory;
      }
   }

   // 카테고리를 클릭했을 때 호출되는 함수입니다
   function onClickCategory() {
      console.log('카테고리 클릭');
      premarker = true;
      var id = this.id, className = this.className;
      placeOverlay.setMap(null);

      if (className === 'on') {
         currCategory = '';
         changeCategoryClass();
         removeMarker();
      } else {
         currCategory = id;
         changeCategoryClass(this);
         searchPlaces();
      }
   }

   // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
   function changeCategoryClass(el) {
      //console.log("el: " +el);
      var category = document.getElementById('category'), children = category.children, i;

      for (i = 0; i < children.length; i++) {
         children[i].className = '';
      }

      if (el) {
         el.className = 'on';
      }
   }

   //카테고리 선택했을때 ajax로 데이타값 가져오는 함수 구현하기
   function sendCategory(category) {
      console.log('이걸 보낼꺼임' + category);
      $.ajax({
         data : {
            "${_csrf.parameterName}" : "${_csrf.token}",
            'category' : category
         },
         type : "POST",
         url : "<c:url value='sendCategory.kosmo'/>",
         dataType : "json",
         success : function(data) {
            console.log('ajax일단 성공했따!');
            console.log(typeof (data));
            //emData = data;
         //   console.log(data.size()); //서울특별시 강남구 강남대로 432, 9층 802호, 803호 (역삼동, 점프밀라노)
            changeGeo(data);
            //console.log('getdata:' + typeof(getdata));
            
         }

      });

   };
   
//리뷰 등록하는 부분
   
   //평점별알려주는거
   var starScore;
   var clickCafeName;
   
    //span은 동적이기때문에 이벤트추가해야됨.
    $(document).on('click','#reviewicon',function(){
        //모달창 띄우기
        //alert('fafasf');
        $("#reviewModal").modal();
        clickCafeName = $('.placeinfo a').html();
        console.log('주소는??:'+clickCafeName );
        $('#kcafeName').text(clickCafeName);
        
        
     });
     
     //별점 클릭하는거 이벤트 주는거?   
     $('.starRev span').click(function(){
       $(this).parent().children('span').removeClass('on');
       $(this).addClass('on').prevAll('span').addClass('on');
       return false;
     });
     
     $('.starR').click(function(){
        starScore = $(this).html();
        console.log(starScore); 
        
     });
     $('#sendReview').click(function(){
         //alert('이제 보내야징');
         console.log()
         console.log('평점은? ' + starScore);
         console.log('보낼려는 가게이름 : ' + clickCafeName);
         console.log('리뷰쓰는 글쓴이이름: ' + '${reviewId}');
         var id = '${reviewId}';
         var no =  $('#cafeNo').attr('title');
         var title = $("#inputTitle").val();
         var content = $("#inputContext").val();
         console.log('리뷰제목 :' + title);
         console.log("리뷰내용 :" + content);
         console.log( '번호???:' + $('#cafeNo').attr('title') );
         
         //키즈카페 함수 추가해서 해시값 받아서 ajax로 넘겨주기 만들기
         //kreview
         
         
         $.ajax({
            type : "POST",
            data : {"${_csrf.parameterName}" : "${_csrf.token}",
               "title":title,
               "content":content,
               "score":starScore,
               "id":id,
               "k_no":no
            },
            
            url:"<c:url value='/review.kosmo'/>",
            dataType : "text",
            success:function(data){
               console.log("성공하면 알람창띄워서 리뷰등록됬다고 말해주기");
            }
            
         });
         
      });
   
     
     

</script>
