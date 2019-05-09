<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="site-section" style="padding: 2em;">
   <div class="container">
      <div class="col-lg-10 col-xl-9 mx-auto">
         <div class="card card-signin flex-row my-5">
            <div class="card-body">
               <h5 class="card-title text-center">회원가입</h5>
               <form class="form-signin" method="post" action="Signup.kosmo?${_csrf.parameterName}=${_csrf.token}" autocomplete="off" enctype="multipart/form-data">
                  <input class="form-control" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                 
                                       
                  <div class="form-label-group">
                     <div class="input-group">
                        <input type=text id="photo" name="file" class="form-control" placeholder="사진파일" >
                         <div class="input-group-append">
                           <a id="photo_upload" class="btn btn-singup"  data-target="#photo" style="color:white">사진 업로드</a>
                        </div> 
                     </div>
                     <small>&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;본인의 증명사진을 올려주시기 바랍니다.</small>
                  </div>
                  
                
                  <div class="form-inline">
                     <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="carpool_check">
                        <label class="form-check-label h1" for="carpool_check">카풀 등록</label>
                     </div>
                     <small class="text-muted">카풀 회원 등록시 체크</small>
                  </div>
                  <div class="card-signin card-carpool">
                     <div class="card-body">
                     <!-- 넣어야 할 목록 -->
                     <!-- 차 번호, 차종, 경력 -->
                        <h2>경력</h2>
                        <label class="checkbox-inline"><input type="radio" id="career" name="career" value="신입">신입</label>
                        <label class="checkbox-inline"><input type="radio" id="career" name="career" value="6개월 이내">6개월 이내</label>
                        <label class="checkbox-inline"><input type="radio" id="career" name="career" value="1년~2년">1년~2년</label>
                        <label class="checkbox-inline"><input type="radio" id="career" name="career" value="2년~5년">2년~5년</label>
                        <label class="checkbox-inline"><input type="radio" id="career" name="career" value="10년이상">10년이상</label>
                        <h2>차종</h2>
                        <label class="checkbox-inline"><input type="radio" id="cartype" name="cartype" value="소형차">소형차</label>
                        <label class="checkbox-inline"><input type="radio" id="cartype" name="cartype" value="중형차">중형차</label>
                        <label class="checkbox-inline"><input type="radio" id="cartype" name="cartype" value="대형차">대형차</label>
                        <h2>차 번호</h2><small>카풀 매칭시 이용자에게 알려주어 도달 시 찾기 용이하게 합니다.</small>
                        <input type="text" id="carnumber" name="carnumber" class="form-control"  placeholder="차 번호를 입력하세요">
                     </div>
                  </div>
                  <input type="hidden" value="0" name="partnerstatus" id="partnerstatus"/>
                  <button class="btn btn-lg btn-singup btn-block text-uppercase" type="submit">회원 가입</button>
                  <hr class="my-4">
                  
               </form>
            </div>
         </div>
      </div>
   </div>   
   
      <div class="modal fade" id="photomodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 9000">
        <div class="modal-dialog" role="document" >
          <div class="modal-content" >
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">사진 등록하기</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form enctype="myltipart/form-data" method="POST" id="excelForm">
               <div class="modal-body">
                     <div class="form-group">
                       <input type="file" name="photoinput" id="photoinput" onChange="getname(this);">
                       <small></small>
                      </div>
               </div>
            </form>
            <div class="modal-footer">              
              <button type="button" class="btn btn-primary" id="clickbutton_modal" data-dismiss="modal">확인</button>
            </div>
          </div>
        </div>
      </div>
</div>


<script src="https://cdn.jsdelivr.net/gh/jquery-form/form@4.2.2/dist/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>

<script>

var filename;

//사진업르도 클릭했을때 일단 제목만 가져오기
function getname(obj) 
{ 
   // var fileObj = document.getElementById("photoinput").value; //files[0].name; 
    filename = document.getElementById("photoinput").files[0].name;      
    console.log('파일은?' + filename);

}
 

$(function() {
	
 
      //사진업로드 눌렀을
     $('#photo_upload').click(function(){
        $('#photomodal').modal();
     });
     
     $('#clickbutton_modal').click(function(){
    	 
    	 filename1 = document.getElementById("photoinput").files[0];
    	 //console.log('파일은1?' + filename);
    	 var form = new FormData();
         form.append("image", filename1);
    	 
         //https://api.imgur.com/3/album/" + albumID + "/images
         $.ajax({ 
        	//url:"https://api.imgur.com/3/image",
        	url : "https://api.imgur.com/3/account/csj910226",
        	type: "POST",
        	data : form,
        	headers: { Authorization: 'Client-ID c473572e81fbb73' },      
        	processData: false,
        	mimeType : "multipart/form-data",
            contentType : false,
            success:function(data){
                console.log("sdddd");                       
                console.log('ff' + JSON.parse(data).data.link);
             }
        	
        	 
         });
         
    	
  	   $('#photo').val(filename);  	
     }); 
     
});
     
   
</script>

