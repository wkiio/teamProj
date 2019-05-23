<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp" %>

<style>
#memberphoto {
  width: 70px;
  height: 70px;
}

table, td{
text-align:center;
}

</style>
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id" />
</sec:authorize>

<div class="site-section carpool_section" style="padding: 2em;">
	<div class="container">
		<div class="carool-head row">
			<!-- 검색 폼 -->
			<form class="carool-form">
				<div class="form-inline">
					<div class="form-row">
						<!-- 카풀 유형  -->
						<div class="form-group">
							<select name="select" class="form-control cp_select">
								<option>전체</option>
								<option>타세요</option>
								<option>태워주세요</option>
							</select>
						</div>
						<!-- 출발지, 도착지 입력 -->
						<div class="form-group">
							<img class="form-image" src="/baby/Bootstrap/images/2.jpg" title="출발지" alt="출발지">
							<input class="form-control" type="text" name="serchword_one" 
								title="출발지를 입력해주세요" placeholder="출발위치 검색">
						</div>
						<div class="form-group">
							<img class="form-image" src="/baby/Bootstrap/images/3.jpg" title="도착지" alt="도착지">
							<input class="form-control" type="text" name="serchword_two" 
								title="도착지를 입력해주세요" placeholder="도착위치 검색">
						</div>
					</div>
					<input id="searchsubmit" value="검색" class="btn btn-secondary">
				</div>
			</form>
			<div class="btn-group btn-group-toggle ml-auto" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="options1" id="option1" autocomplete="off" value="전체" checked > 전체
				</label>
					<label class="btn btn-secondary">
					<input type="radio"
					name="options2" id="option2" autocomplete="off" value="타세요"> 타세요
				</label>
				<label class="btn btn-secondary">
					<input type="radio"
					name="options3" id="option3" autocomplete="off" value="태워주세요"> 태워주세요
				</label>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table cp_table tbl paginated" id="tbl">
				<thead>
					<tr class="text-center">
						<th scope="col">프로필</th>
						<th scope="col">출발</th>
						<th scope="col"></th>
						<th scope="col">도착</th>
						<th scope="col">유형</th>
						<th scope="col">금액</th>
						<th scope="col">카시트</th>
					</tr>
				</thead>
				
				<tbody class="text-center" id="carList">
					
				</tbody>
			
			</table>
			<div class="mt-1" style="text-align: right;">
				<button type="button" class="btn btn-secondary" style="border-radius : 8px;" id="register">카풀 이용하기</button>
			</div>
		</div>
	</div>
<!-- 페이징 -->
<!-- <table class="tbl paginated" id="tbl"></table> -->

</div>


<script>

   var clickchange = 1;
   var firstsearch;
   var secondsearch;
   
   $(function() {
		$('#register').click(function(){
			location.replace('carregister.kosmo');
		})
		
	})
   

  $(function(){
	 
	  firsttable();
	  
	  //타세요화면띄우기
	  	  
	  $("input[name='options1']").change(function(){
			 clickchange = 1;
			 console.log("clickchange ??" + clickchange );  
			 firsttable();
		});
		 
		 $("input[name='options2']").change(function(){
			 clickchange = 2;
			 console.log("clickchange" + clickchange );  
			 firsttable();
		});
		 
		 $("input[name='options3']").change(function(){
			 clickchange = 3;
			 console.log("clickchange" + clickchange );  
			 firsttable();
		});

		 $("#searchsubmit").click(function(){
			console.log("오냐????"); 
			firstsearch = $("input[name='serchword_one']").val();
			secondsearch = $("input[name='serchword_two']").val();
			 firsttable();
			console.log("firstsearch : " + firstsearch);
			console.log("secondsearch : " + secondsearch);
		 });
 });/////functionㅁㄴㅇㅁㄴ
 
 var firsttable = function(){
	 $.ajax({
		 data : {"${_csrf.parameterName}" : "${_csrf.token}", 'firstsearch' : firstsearch, 'secondsearch' : secondsearch},
		 type : "POST",
		 url : "<c:url value = '/Carindex1.kosmo?'/>",
		 dataType : "json",
		 success: function(data){
			 $('#carList').empty();	
			 var html="";
			
			 $.each(data,function(index,carlist){		
				if(clickchange == 1){
				 ///전체화면띄우기		
				 html += "<tr id="+carlist['cp_no']+">";
				 html+="<th scope=\"row\"><figure class=\"profile listtd\"><img id=\"memberphoto\" src=\"<c:url value='/resources/memberPhoto/"+carlist["photo"]+"'/>\" alt=\"프로필\" class=\"picture listtd\"><figcaption class=\"name listtd\"></figcaption></figure></th>";
				 html+="<td><div class=\"start_con listtd\"><h6>"+carlist['startpoint']+"</h6><span>"+carlist['time']+"</span></div></td>";
				 html+="<td class=\"px-1 py-3 listtd\"><img src=\"/baby/resources/images/arrow.jpg\" alt=\"프로필\" class=\"arrow listtd\"></td>";
				 html+="<td><div class=\"end_con listtd\"><h6>"+carlist['endpoint']+"</h6></div></td>";
				 html+="<td><h6 class=\"cp_type listtd\">"+carlist['type']+"</h6></td>";
				 html+="<td><span class=\"cp_time listtd\">"+carlist['price']+"원"+"</span></td>";			 	 
				 html+="<td><span>"+carlist['carseat']+"</span></td></tr>";			 	 
				}
				else if(clickchange == 2){
					if(carlist['type'] == "타세요"){
						 html += "<tr id="+carlist['cp_no']+">";
						 html+="<th scope=\"row\"><figure class=\"profile listtd\"><img id=\"memberphoto\" src=\"<c:url value='/resources/memberPhoto/"+carlist["photo"]+"'/>\" alt=\"프로필\" class=\"picture listtd\"><figcaption class=\"name listtd\"></figcaption></figure></th>";
						 html+="<td><div class=\"start_con listtd\"><h6>"+carlist['startpoint']+"</h6><span>"+carlist['time']+"</span></div></td>";
						 html+="<td class=\"px-1 py-3 listtd\"><img src=\"/baby/resources/images/arrow.jpg\" alt=\"프로필\" class=\"arrow listtd\"></td>";
						 html+="<td><div class=\"end_con listtd\"><h6>"+carlist['endpoint']+"</h6></div></td>";
						 html+="<td><h6 class=\"cp_type listtd\">"+carlist['type']+"</h6></td>";
						 html+="<td><span class=\"cp_time listtd\">"+carlist['price']+"원"+"</td>";
						 html+="<td><span class=\"cp_time listtd\">"+carlist['carseat']+"</td></tr>";	
					}
				}
				else{
					if(carlist['type'] == "태워주세요"){
						 html += "<tr id="+carlist['cp_no']+">";
						 html+="<th scope=\"row\"><figure class=\"profile listtd\"><img id=\"memberphoto\" src=\"<c:url value='/resources/memberPhoto/"+carlist["photo"]+"'/>\" alt=\"프로필\" class=\"picture listtd\"><figcaption class=\"name listtd\"></figcaption></figure></th>";
						 html+="<td style='width: 30%'><div class=\"start_con listtd\"><h6>"+carlist['startpoint']+"</h6><span>"+carlist['time']+"</span></div></td>";
						 html+="<td class=\"px-1 py-3 listtd\"><img src=\"/baby/resources/images/arrow.jpg\" alt=\"프로필\" class=\"arrow listtd\"></td>";
						 html+="<td style='width: 30%'><div class=\"end_con listtd\"><h6>"+carlist['endpoint']+"</h6></div></td>";
						 html+="<td><h6 class=\"cp_type listtd\">"+carlist['type']+"</h6></td>";
						 html+="<td><span class=\"cp_time listtd\">"+carlist['price']+"원"+"</td>";
						 html+="<td><span class=\"cp_time listtd\">"+carlist['carseat']+"</td></tr>";	
						 
					}
				}
			});////each
			
			$('#carList').html(html);
			page();
			
			

			 $('tbody tr').each(function(i){
		         $(this).click(function(){
		        	var id = $(this).attr('id');
		        	var type = $('tr[id="'+id+'"] td:nth-child(5) > h6').html();
		            location.href="Carview.kosmo?cp_no="+id+"&type="+type;		            
		         });		         
		      });
			 
			 
			// 만들어진 테이블에 페이지 처리
				function page(){ 
				var reSortColors = function($table) {
				  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
				  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
				 };
				 $('table.paginated').each(function() {
				  var pagesu = 10;  
				  var currentPage = 0;
				  var numPerPage = 5;  //목록의 수
				  var $table = $(this);    
				  
				  //length로 원래 리스트의 전체길이구함
				  var numRows = $table.find('tbody tr').length;
				  //Math.ceil를 이용하여 반올림
				  var numPages = Math.ceil(numRows / numPerPage);
				  //리스트가 없으면 종료
				  if (numPages==0) return;
				  //pager라는 클래스의 div엘리먼트 작성
				  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
				  
				  var nowp = currentPage;
				  var endp = nowp+10;
				  
				  //페이지를 클릭하면 다시 셋팅
				  $("#remo").remove();
				  $table.bind('repaginate', function() {
				  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
				  
				   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
				   $("#remo").html("");
				   
				   if (numPages > 1) {     // 한페이지 이상이면
				    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
				     nowp = 0;     // 1부터 
				     endp = pagesu;    // 10까지
				    }else{
				     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
				     endp = nowp+pagesu;   // 10까지
				     pi = 1;
				    }
				    
				    if (numPages < endp) {   // 10페이지가 안되면
				     endp = numPages;   // 마지막페이지를 갯수 만큼
				     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
				    }
				    if (nowp < 1) {     // 시작이 음수 or 0 이면
				     nowp = 0;     // 1페이지부터 시작
				    }
				   }else{       // 한페이지 이하이면
				    nowp = 0;      // 한번만 페이징 생성
				    endp = numPages;
				   }
				   
				   // [처음]
				   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
				          currentPage = 0;   
				          $table.trigger('repaginate');  
				          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
				      }).appendTo($pager).addClass('clickable');
				    // [이전]
				      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
				          if(currentPage == 0) return; 
				          currentPage = currentPage-1;
				    $table.trigger('repaginate'); 
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				   }).appendTo($pager).addClass('clickable');
				    // [1,2,3,4,5,6,7,8]
				   for (var page = nowp ; page < endp; page++) {
				    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
				     currentPage = event.data['newPage'];
				     $table.trigger('repaginate');
				     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				     }).appendTo($pager).addClass('clickable');
				   } 
				    // [다음]
				      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
				    if(currentPage == numPages-1) return;
				        currentPage = currentPage+1;
				    $table.trigger('repaginate'); 
				     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				   }).appendTo($pager).addClass('clickable');
				    // [끝]
				   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
				           currentPage = numPages-1;
				           $table.trigger('repaginate');
				           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
				   }).appendTo($pager).addClass('clickable');
				     
				     $($(".page-number")[2]).addClass('active');
				reSortColors($table);
				  });
				   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
				   $pager.appendTo($table);
				   $table.trigger('repaginate');
				 });
				}
		 }/////success
		 
		 
	 });////ajax
	 
	 
 }
 
	
 




</script>


