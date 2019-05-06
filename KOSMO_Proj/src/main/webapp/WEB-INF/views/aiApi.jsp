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


<div class="site-section" style="height:auto; padding:2em;">
     <div class ="row">
        	<div class="col-md-6">
        		<div  id="이미지1" class = "col-md-offset-1 col-md-5 " style="z-index:25;" >
        			<img id="이미지2" class="image_one1" alt="이미지" src= "<c:url value='/resources/Baby/유모차2.jpg'/>" style="height:250px;z-index: 15;" />	
        		</div>     	
        	</div>
        <div   class="col-md-6" style="z-index=10">
        		<div  id = "이미지받기">
        			<p style="height:150px;width:150px;background-color: red">Drop here</p>
        		</div>     	
        	</div>
     </div>
     
    
</div>


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
		}
	});
	
	
};

	


</script>
	

