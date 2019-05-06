<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<stlye>
<!-- .image_one1{
  height: 100px;
  width: 100px;
} -->

</stlye>


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
     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 9000">
		  <div class="modal-dialog" role="document" >
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">육아 게시판 수정하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<h2>여기에 가격표시해주기</h2>
		      </div>
		      <div class="modal-footer">		        
		        <button type="button" class="btn btn-primary" id="clickbutton_modal" data-dismiss="modal">수정</button>
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



$(function(){
	$( "#이미지1" ).draggable();

    $( "#이미지받기" ).droppable({
    	 activeClass: "active",
         hoverClass:  "hover",
      drop: function( event, ui ) {
        $( this )
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
			$.each(data.items,function(index,value){
				console.log("번 : " + value['title']); 
				
			});
			$("#exampleModal").modal();		
		}
	});
	
	
};

	


</script>
	

