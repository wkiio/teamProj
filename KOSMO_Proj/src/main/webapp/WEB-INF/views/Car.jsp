<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp" %>
<script>
/*    $(function(){
      $('tbody tr').each(function(i){
         $(this).click(function(){
        	var id = $(this).attr('id');
            location.href="Carview.kosmo?cp_no="+id;
            
         });
         
      });
   }); */
</script>
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
								title="출발지를 입력해주세요" placeholder="서울">
						</div>
						<div class="form-group">
							<img class="form-image" src="/baby/Bootstrap/images/3.jpg" title="도착지" alt="도착지">
							<input class="form-control" type="text" name="serchword_two" 
								title="도착지를 입력해주세요" placeholder="경기도">
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
			<table class="table cp_table">
				<thead>
					<tr class="text-center">
						<th scope="col">프로필</th>
						<th scope="col">출발</th>
						<th scope="col"></th>
						<th scope="col">도착</th>
						<th scope="col">유형</th>
						<th scope="col">자리/금액</th>
					</tr>
				</thead>
				
				<tbody class="text-center" id="carList">
						
				</tbody>
			</table>
		</div>
	</div>	
</div>

<script>

   var clickchange = 1;
   var firstsearch;
   var secondsearch;
   

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
 });/////function
 
 var firsttable = function(){
	 $.ajax({
		 data : {"${_csrf.parameterName}" : "${_csrf.token}", 'firstsearch' : firstsearch, 'secondsearch' : secondsearch},
		 type : "POST",
		 url : "<c:url value = '/Carindex1.kosmo'/>",
		 dataType : "json",
		 success: function(data){
			 $('#carList').empty();	
			 var html="";
			 $.each(data,function(index,carlist){		
				if(clickchange == 1){
				 ///전체화면띄우기				
				 html += "<tr id="+carlist['cp_no']+">";
				 html+="<th scope=\"row\"><figure class=\"profile\"><img src=\"./Bootstrap/images/3.jpg\" alt=\"프로필\" class=\"picture\"><figcaption class=\"name\"></figcaption></figure></th>";
				 html+="<td><div class=\"start_con\"><h6>"+carlist['startpoint']+"</h6><span>"+carlist['time']+"</span></div></td>";
				 html+="<td class=\"px-1 py-3\"><img src=\"/baby/resources/images/arrow.jpg\" alt=\"프로필\" class=\"arrow\"></td>";
				 html+="<td><div class=\"end_con\"><h6>"+carlist['endpoint']+"</h6></div></td>";
				 html+="<td><h6 class=\"cp_type\">"+carlist['type']+"</h6></td>";
				 html+="<td><h6 class=\"cp_type\">"+"2자리"+"</h6><span class=\"cp_time\">"+carlist['price']+"원"+"</td></tr>";			 	 
				}
				else if(clickchange == 2){
					if(carlist['type'] == "타세요"){
						 html += "<tr id="+carlist['cp_no']+">";
						 html+="<th scope=\"row\"><figure class=\"profile\"><img src=\"./Bootstrap/images/3.jpg\" alt=\"프로필\" class=\"picture\"><figcaption class=\"name\"></figcaption></figure></th>";
						 html+="<td><div class=\"start_con\"><h6>"+carlist['startpoint']+"</h6><span>"+carlist['time']+"</span></div></td>";
						 html+="<td class=\"px-1 py-3\"><img src=\"/baby/resources/images/arrow.jpg\" alt=\"프로필\" class=\"arrow\"></td>";
						 html+="<td><div class=\"end_con\"><h6>"+carlist['endpoint']+"</h6></div></td>";
						 html+="<td><h6 class=\"cp_type\">"+carlist['type']+"</h6></td>";
						 html+="<td><h6 class=\"cp_type\">"+"2자리"+"</h6><span class=\"cp_time\">"+carlist['price']+"원"+"</td></tr>";			
					}
				}
				else{
					if(carlist['type'] == "태워주세요"){
						 html += "<tr id="+carlist['cp_no']+">";
						 html+="<th scope=\"row\"><figure class=\"profile\"><img src=\"./Bootstrap/images/3.jpg\" alt=\"프로필\" class=\"picture\"><figcaption class=\"name\"></figcaption></figure></th>";
						 html+="<td><div class=\"start_con\"><h6>"+carlist['startpoint']+"</h6><span>"+carlist['time']+"</span></div></td>";
						 html+="<td class=\"px-1 py-3\"><img src=\"/baby/resources/images/arrow.jpg\" alt=\"프로필\" class=\"arrow\"></td>";
						 html+="<td><div class=\"end_con\"><h6>"+carlist['endpoint']+"</h6></div></td>";
						 html+="<td><h6 class=\"cp_type\">"+carlist['type']+"</h6></td>";
						 html+="<td><h6 class=\"cp_type\">"+"2자리"+"</h6><span class=\"cp_time\">"+carlist['price']+"원"+"</td></tr>";			
					}
				}
			});////each
			$('#carList').html(html);
			
			
			 $('tbody tr').each(function(i){
		         $(this).click(function(){
		        	var id = $(this).attr('id');
		            location.href="Carview.kosmo?cp_no="+id;		            
		         });		         
		      });			 
		 }/////success
		 
	 });////ajax
	 
 }
 
	
 




</script>


