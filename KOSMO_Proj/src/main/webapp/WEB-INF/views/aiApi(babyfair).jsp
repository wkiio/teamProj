<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	
/
<style>

	#link {color: #E45635;display:block;font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;text-align:center; text-decoration: none;}
#link:hover {color: #CCCCCC}

#link, #link:hover {-webkit-transition: color 0.5s ease-out;-moz-transition: color 0.5s ease-out;-ms-transition: color 0.5s ease-out;-o-transition: color 0.5s ease-out;transition: color 0.5s ease-out;}

/** BEGIN CSS **/
        
@keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@-moz-keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@-webkit-keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@-o-keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@-moz-keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@-webkit-keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@-o-keyframes rotate-loading {
    0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
    100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
}

@keyframes loading-text-opacity {
    0%  {opacity: 0}
    20% {opacity: 0}
    50% {opacity: 1}
    100%{opacity: 0}
}

@-moz-keyframes loading-text-opacity {
    0%  {opacity: 0}
    20% {opacity: 0}
    50% {opacity: 1}
    100%{opacity: 0}
}

@-webkit-keyframes loading-text-opacity {
    0%  {opacity: 0}
    20% {opacity: 0}
    50% {opacity: 1}
    100%{opacity: 0}
}

@-o-keyframes loading-text-opacity {
    0%  {opacity: 0}
    20% {opacity: 0}
    50% {opacity: 1}
    100%{opacity: 0}
}
.loading-container,
.loading {
    height: 100px;
    position: relative;
    width: 100px;
    border-radius: 100%;
}


.loading-container { margin: 40px auto }

.loading {
    border: 2px solid transparent;
    border-color: transparent #ff8063 transparent #ff8063;
    -moz-animation: rotate-loading 1.5s linear 0s infinite normal;
    -moz-transform-origin: 50% 50%;
    -o-animation: rotate-loading 1.5s linear 0s infinite normal;
    -o-transform-origin: 50% 50%;
    -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
    -webkit-transform-origin: 50% 50%;
    animation: rotate-loading 1.5s linear 0s infinite normal;
    transform-origin: 50% 50%;
}

.loading-container:hover .loading {
    border-color: transparent #E45635 transparent #E45635;
}
.loading-container:hover .loading,
.loading-container .loading {
    -webkit-transition: all 0.5s ease-in-out;
    -moz-transition: all 0.5s ease-in-out;
    -ms-transition: all 0.5s ease-in-out;
    -o-transition: all 0.5s ease-in-out;
    transition: all 0.5s ease-in-out;
}

#loading-text {
    -moz-animation: loading-text-opacity 2s linear 0s infinite normal;
    -o-animation: loading-text-opacity 2s linear 0s infinite normal;
    -webkit-animation: loading-text-opacity 2s linear 0s infinite normal;
    animation: loading-text-opacity 2s linear 0s infinite normal;
    color: #ed4040;
    font-family: "Helvetica Neue, "Helvetica", ""arial";
    font-size: 10px;
    font-weight: bold;
    margin-top: 45px;
    opacity: 0;
    position: absolute;
    text-align: center;
    text-transform: uppercase;
    top: 0;
    width: 100px;
}


</style>
	
	
	
<style>	
.modal-ku {
  width: 1000px;
  height: 650px;
  margin-left: -250px;
  
}

table{
  width:100%;
  table-layout: fixed;
  font-color : #ffffff;
}
.tbl-header{
 background-color: #302f2f;
 color : #d9ff9e;
 }
.tbl-content{
  height:500px;
  overflow-x:auto;
  margin-top: 0px;

}
th{
  padding: 5px 3px;
  text-align: left;
  font-weight: 900;
  font-size: 20px;
  color : #ffffff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-size: 13px;
  font-weight : 900;
  color : #302f2f;
  border-bottom: solid 1px rgba(0,0,0,1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
 
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 10px;
}


/* follow me template */
.made-with-love {
  margin-top:10px;
  padding: 2px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}

#cartable{
  background: -webkit-linear-gradient(left, #ffffff, #ffffff);
  background: linear-gradient(to right, #ffffff, #ffffff);
  color : #262022;
}

/*  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4); */


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}


/*테이블 감추는거 */
.table tr {
    cursor: pointer;
}
.hiddenRow {
    padding: 0 4px !important;
}

/*이미지 둥그렇게 image_one*/
.image_one{
  border: 3px solid #fcabab;
  border-radius: 30px;
}

.image_two{
  border: 4px solid #5f84b7;
  border-radius: 30px;
  

  
}


</style>
  	

<div class="site-section" style="height:auto; padding:2em;z-index=3" >
     <div class ="row">     
     	<div class="offset-md-1 col-md-4" style="margin-top: 30px">
     		<div class="row">
     		<h3>행사 타이틀 : 수원베이비엑스포</h3>  
     		<h3>기  간  : 5.16(목)-5.19(일)&emsp;&emsp;&emsp;&emsp;</h3>  
     		<h3>시  간  : 10:00 ~ 18:00&emsp;&emsp;&emsp;&emsp;&emsp;</h3> 
     		<h3>장  소  : 광교 수원컨벤션센터 </h3>  
     		</div>
     	</div>
     	<div class="col-md-7" > <!-- style="text-align: center;" -->
     		<img alt="행사이미지" class="image_two" src= "<c:url value='/resources/Baby/수원베이비엑스포.jpg'/>" style="height:300px;width:800px;" />	
     	</div>
     	
        	 <div class="col-md-12" style="text-align: center;" >        	 
     			<h2 style="text-align: center;"	>전시 품목(브랜드)</h2>
        	 	<div class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지2" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/유모차2.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	             				
        		</div>    
        		<div class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지3" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/임산부복.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지4" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기매트.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지5" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기과자.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지6" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기하우스.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지7" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기힙시트.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지8" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/카시트2.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<%-- <div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지9" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기젖병.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지10" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기침대.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>    
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지10" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기베개.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지10" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/체온계.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>   
        		<div   class = "col-md-6" style="z-index:25;display:inline; " >
        			<img id="이미지10" class="image_one" alt="이미지" src= "<c:url value='/resources/Baby/아기침대.jpg'/>" style="height:150px;width:150px;z-index: 15;" />	
        		</div>    --%>
        		
        		
			</div>
       		 <div   class="col-md-12" style="z-index=10;text-align: center;margin-top: 20px">
       		 <h2>전시품목 가격 알아보기</h2>        		
        	 <!--   <p align="center" id = "이미지받기" style="height:150px;width:150px;border: 3px solid #5f84b7;margin:0 auto;">여기에 제품을 끌어보세요!</p> -->
        	   <div class="loading-container">
			    <div class="loading"></div>
			    <div id="loading-text">loading</div>
				</div>	
        	   <p align="center" id = "이미지받기" style="margin:0 auto;">여기에 제품을 끌어보세요!</p>
        	   <i id = "이미지받기" class="fas fa-shopping-bag fa-10x"style="color:red;"></i>	
        	</div> 
     </div>
     
     
     <!-- 모달창(가격같은거) -->
     <div class="modal fade bd-example	" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 9000">
		  <div class="modal-dialog " role="document" >
		    <div class="modal-content modal-ku">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">실시간 네이버 쇼핑 가격</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
					
						<section id="cartable">
									<!--for demo wrap-->
									<div class="tbl-header">
										<table cellpadding="0" cellspacing="0" border="0" style="text-align: center;">
											<thead>
												<tr >
													<th>이미지</th>
													<th>이름</th>
													<th>가격</th>
													<th>링크</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="tbl-content">
										<table cellpadding="0" cellspacing="0" border="0">
											<tbody class="serach_shopping">
										  
											</tbody>
										</table>
									</div>


								</section>

							

						</div>
					


				</div>		      
		    </div>
		  </div>
		</div>
   

<!-- Bootstrap JS-->
    <script src="admin_assets/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="admin_assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    
<script>

var getAiImage;

$(".loading-container").hide();


//로딩바 함수

function showLoading(){
	console.log('들어온다');
	$('.loading-container').show();
}

function hideLoading(){
	console.log('들어온다');
	$('.loading-container').hide();
}



function checkImage(data) {
	
	//indexOf는 맞으면 0 아니면 -1을 반환한다;
	
	console.log('data : ' + data);
	console.log("??? : " + data.indexOf("riding"));
	
	
	if((data.indexOf("carriage") != -1 ) && (data.indexOf("riding") != -1) ) //유모차
		return "유모차";	
	else if( (data.indexOf("wearing") != -1 )&& (data.indexOf("clothing") != -1) && (data.indexOf("underwear") != -1) )//임산부복
		return "임산부복";   
	else if( (data.indexOf("plate") != -1 )&& (data.indexOf("bed") != -1) && (data.indexOf("young") != -1) )//아기매트
		return "아기매트";   
	else if( (data.indexOf("bed") != -1 )&& (data.indexOf("baby") != -1) && (data.indexOf("lying") != -1) )//아기베개
		return "아기베개";   
	else if( (data.indexOf("holding") != -1 )&& (data.indexOf("wearing") != -1) && (data.indexOf("person") != -1) )//힙시트
		return "힙시트";   
	else if( (data.indexOf("playing") != -1 )&& (data.indexOf("water") != -1) && (data.indexOf("sitting") != -1) )//아기튜브
		return "아기튜브";   
	else if( (data.indexOf("food") != -1 )&& (data.indexOf("refrigerator") != -1) )//아기과자	
		return "아기과자";   
	
	else if( (data.indexOf("sitting") != -1 )&& (data.indexOf("holding") != -1) && (data.indexOf("bed") != -1) && (data.indexOf("teeth") == -1) && (data.indexOf("room") == -1) && (data.indexOf("video") == -1) )//카시트
		return "카시트";   
	
	else if( (data.indexOf("standing") != -1 )&& (data.indexOf("board") != -1) && (data.indexOf("holding") != -1) )//아기하우스
		return "아기하우스";   
	else if( (data.indexOf("toothbrush") != -1 )&& (data.indexOf("baby") != -1) && (data.indexOf("teeth") != -1) )//아기젖병
		return "아기젖병";   
	else if( (data.indexOf("game") != -1 )&& (data.indexOf("video") != -1) && (data.indexOf("young") != -1) )//체온계
		return "체온계";   
	else if( (data.indexOf("bed") != -1 )&& (data.indexOf("large") != -1) && (data.indexOf("room") != -1) )//아기침대
		return "아기침대";   
	
	
}; 
var imagecheck;
var aa;


$(function(){
	$('.image_one').draggable({helper: 'clone'});
	
	
	
	
	
	// $( "#이미지2" ).draggable({  helper: 'clone'});

    $( "#이미지받기" ).droppable({
    	 activeClass: "active",
         hoverClass:  "hover",
      drop: function( event, ui ) {
        //$( this );
        //ui.attr("src");
        var $item = ui.draggable.clone();
		$item.remove();         
		showLoading();
		
        // ui.draggable.remove();
    	//var filepath = $('#이미지2').attr("src");
    	var filepath = $item	.attr("src");
    	//ui.draggable.remove();
    	filepath = filepath.substring(5,filepath.length);
    	console.log(filepath);
    	 $.ajax({
    		data :  {"${_csrf.parameterName}" : "${_csrf.token}", "filepath" : filepath}, 
    		type : "POST",
    		url : " <c:url value='gotoAI.kosmo'/>",
    		dataType : "json",
    		success:function(data){
    			//var abc = JSON.stringify(data.tags);
    			//console.log("data.tags:" + data.tags);
    			//console.log(checkImage(data.tags));
    			var aa = new Array();
    			$.each(data.tags,function(index,value){
    				aa[index] = value;    				
    			});
    			
    	
    			getAiImage = checkImage(aa);
    			console.log("getAiImage:"+ getAiImage);

     			NaverApiSearch();
    		}
    	});       
      }
    });	 
}); //function()

var NaverApiSearch = function(){
	$.ajax({
		data : {"${_csrf.parameterName}" : "${_csrf.token}", "getAiImage" : getAiImage}, 
		type : "POST",
		url : "<c:url value='gotoSearch.kosmo'/>",
		dataType : "json",
		success:function(data){
			hideLoading();
			console.log("네이버:" + data);
			var html = "<tr>";
			$.each(data.items,function(index,value){
				//console.log("상품이름 : " + value['title'] + " , " + "가격 : " + value['lprice']);
				html+="<td><img src="+ value['image'] +" " +"style=\"height:200px;width:200px;z-index:15;\"> "+ "</img></td>";	
	    		html+="<td>" + value['title'] + "</td>" + "<td>" + value['lprice'] +"원" + "</td>";
	    		//<button onclick="window.open('address')">button</button>
	    		html +="<td>" + "<button type=\"button\" class=\"btn btn-info\" onclick=\"window.open("+"\'" + value['link']+"\'"+")\">"+"링크연결"+"</button></td></tr>";
				
				//console.log(html);
			});			
			$('.serach_shopping').html(html);  
			
			$("#exampleModal").modal();		
		}
	});
	
	
};



</script>
	

