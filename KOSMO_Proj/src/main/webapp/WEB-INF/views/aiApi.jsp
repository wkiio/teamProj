<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<style>
h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 900;
  text-align: center;
  background-color: #302f2f;
  
}
table{
  width:100%;
  table-layout: fixed;
  font-color : #ffffff;
}
.tbl-header{
 background-color: #302f2f;
 color : #ffffff;
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;

}
th{
  padding: 20px 15px;
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
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
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


</style>
  	

<div class="site-section" style="height:auto; padding:2em;z-index=3" >
     <div class ="row">
        	<div class="col-md-6">
        	<%-- 	<div   class = "col-md-offset-1 col-md-5 " style="z-index:25;" >
        			<img id="이미지2" class="image_one1" alt="이미지" src= "<c:url value='/resources/Baby/유모차2.jpg'/>" style="height:250px;z-index: 15;" />	
        		</div>    --%>
			<div style="position: absolute;">
				<div id="이미지1"  style="position: relative;z-index:25; top: 30px; left: 80px;">
					<img  id="이미지2" src="<c:url value='/resources/Baby/유모차2.jpg'/>" style="height:250px;z-index: 15;" ></img>
				</div>
			</div>
			<div style="position: absolute;">
				<div style="position: relative; top: 30px; left: 80px;">
					<img src="<c:url value='/resources/Baby/유모차2.jpg'/>" style="height:250px;z-index: 15;"></img>
				</div>
			</div>
		</div>
        <div   class="col-md-6" style="z-index=10">
        		<div  id = "이미지받기">
        			<p style="height:150px;width:150px;background-color: red">Drop here</p>
        		</div>     	
        	</div>
     </div>
     
     
     <!-- 모달창(가격같은거) -->
     <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 9000">
		  <div class="modal-dialog modal-lg" role="document" >
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">실시간 네이버 쇼핑 가격</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
					<div>
						<section id="cartable">
									<!--for demo wrap-->
									<div class="tbl-header">
										<table cellpadding="0" cellspacing="0" border="0">
											<thead>
												<tr>
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
										 		<%-- <tr>
										          <td><img src="<c:url value='/resources/Baby/한지민.jpg'/>" style="height:100px;width:100px;z-index: 15;"></img></td>
										          <td>#</td>
										          <td>##</td>
										          <td>##</td>
										        </tr>
										        <tr>
										         <td><img src="<c:url value='/resources/Baby/한지민.jpg'/>" style="height:100px;width:100px;z-index: 15;"></img></td>
										          <td>#</td>
										          <td>##</td>
										          <td>##</td>
										        </tr>
										        <tr>
										          <td>#</td>
										          <td>#</td>
										          <td>#</td>
										          <td>#</td>
										        </tr>        --%>
											</tbody>
										</table>
									</div>


								</section>

							</div>

						</div>
					


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

//boolean to revert check

var isRevert = true;

var iiiimage = $('#이미지1');
console.log(iiiimage);

$(function(){
	$( "#이미지1" ).draggable();

    $( "#이미지받기" ).droppable({
    	 activeClass: "active",
         hoverClass:  "hover",
      drop: function( event, ui ) {
        $( this );
        
        $("#exampleModal").modal();
        // ui.draggable.remove();
    	var filepath = $('#이미지2').attr("src");
    	ui.draggable.remove();
    	filepath = filepath.substring(5,filepath.length);
    	console.log(filepath);
    	 $.ajax({
    		data :  {"${_csrf.parameterName}" : "${_csrf.token}", "filepath" : filepath}, 
    		type : "POST",
    		url : " <c:url value='gotoAI.kosmo'/>",
    		dataType : "json",
    		success:function(data){
    			//console.log(data);   
    			console.log(data.tags[0]);
    		 	 $.each(data.tags,function(index,value){
    		 		if(value == "carriage")
    		 			getAiImage = "유모차";
    		 			console.log("캐리어가 있따?");
    		 		//console.log(value);
    		 		 //console.log(value.tags[index]);
    				/* console.log(value[0].class);    	
    				getAiImage = value[0].class; */
    			});

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
			console.log("네이버:" + data);
			var html = "<tr>";
			$.each(data.items,function(index,value){
				console.log("상품이름 : " + value['title'] + " , " + "가격 : " + value['lprice']); 				
			});			
			//$("#exampleModal").modal();		
		}
	});
	
	
};

	


</script>
	

