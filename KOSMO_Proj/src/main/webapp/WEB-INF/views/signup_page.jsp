<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
	
		//아이디 중복 체크
		$("#id_check").click(function(){
			console.log($('#id').val());
			if($('#id').val().length >=3 && $('#id').val().length <=10){
			//Ajax로 요청
			$.ajax({
				url:"<c:url value='/idCheck.kosmo'/>",
				data: {
					'id' : $('#id').val(),
					"${_csrf.parameterName}":"${_csrf.token}"
					},
				dataType:'text',
				type:'post',
				success:function(data){
					console.log("sdddd");
					if(data=="true") {
						alert('사용가능한 아이디 입니다');
						$('#pwd').focus()
					}
					else {
						alert('중복된 아이디 입니다');
						$('#id').val('');
						$('#id').focus()
					}
					
				}/* ,
				error:function(request,status,error){
					console.log('code:%s,message:%s,error:%s,status:%s',request.status,request.responseText,error,status);
				} */
			});
		}
		else {
			alert('아이디는 3자 이상, 10자 이하 사용해야 합니다.')
			$('#id').val('').focus();
		}
		});
		

		
		
		
		//비밀번호를 숫자 영문자 특수문자 8자리 이상으로 조합하게하기
		$("#pwd").change(function(){
		    checkPassword($('#pwd').val());
		});
		function checkPassword(pwd){		    
		    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/.test(pwd)){            
		        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
		        $('#pwd').val('').focus();
		        return false;
		    }    
		    var checkNumber = password.search(/[0-9]/g);
		    var checkEnglish = password.search(/[a-z]/ig);
		    if(checkNumber <0 || checkEnglish <0){
		        alert("숫자와 영문자를 혼용하여야 합니다.");
		        $('#pwd').val('').focus();
		        return false;
		    }
		    return true;
		}
		//비밀번호 입력칸과 비밀번호 확인칸이 동일하지 않으면 다시 입력하게하기
		$('#pwdsubmit').change(function(){
			checkPwdSubmit($('#pwd').val(),$('#pwdsubmit').val());
		});
		function checkPwdSubmit(pwd,pwdsubmit){
			if(pwd != pwdsubmit){
				alert('비밀번호와 동일하게 입력해야 합니다.');
				$('#pwdsubmit').val('').focus();
				return false;
			}
			
			return true;
		}
		//휴대폰 번호 유효성체크 
		$('#tel').keypress(function(evt){
			var code = evt.which?evt.which:event.keyCode;
			if(code < 48 || code > 57){
				return false;
			}
		});
		
		//이메일 선택용
		$('#email2').change(function(){
			$("#email2 option:gt(0):selected").each(function() {
				var email = $('#email').val();
				if(email.includes("@")){
					$('#email').val(email.split('@')[0]+"@"+$(this).html());
				}
				else {
					$('#email').val(email+"@"+$(this).html());
				}
			});
		});
		
		//제휴 회원용 입력창 토글용
		$('#carpool_check').click(function(){
			$(".card-carpool").fadeToggle("slow");
		});	
		
		//제휴 회원용 입력창 토글용
		$('.form-signin').submit(function(){
        if($('#carpool_check').prop('checked')){
           //카풀등록 체크시
           $('#partnerstatus').attr('value',"1")
        }
        else {
           //카풀등록 체크 안했을시
           $('#partnerstatus').attr('value',"0")
        }
     });
	});
</script>
<div class="site-section" style="padding: 2em;">
	<div class="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<div class="card card-signin flex-row my-5">
				<div class="card-body">
					<h5 class="card-title text-center">회원가입</h5>
					<form class="form-signin" method="post" action="Signup.kosmo" autocomplete="off">
						<input class="form-control" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="form-label-group">
							<div class="input-group">
								<input type="text" id="id" name="id" class="form-control" placeholder="아이디" required autofocus>
								<label for="id">아이디</label>
								<div class="input-group-append">
									<button id="id_check" class="btn btn-singup">중복 체크</button>
								</div>
							</div>
							<small>&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;아이디는 3자 이상, 10자 이하로 입력해야 합니다.</small>
						</div>
						<div class="form-label-group">
							<input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호" required>
							<label for="pwd">비밀번호</label>
							<small>&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;비밀번호는 영문자, 특수준자, 숫자의 조합으로 8자리 이상 입력해야 합니다.</small>
						</div>
						
						<div class="form-label-group">
							<input type="password" id="pwdsubmit" class="form-control" placeholder="확인용 비밀번호" required>
							<label for="pwdsubmit">확인용 비밀번호</label>
							<small>&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;위의 비밀번호와 동일하게 입력해주세요</small>
						</div>
						<div class="form-label-group">
							<input type="text" id="name" name="name" class="form-control" placeholder="이름" required>
							<label for="name">이름</label>
						</div>
						
						
						
						
						<div class="form-label-group">
							<div class="input-group">
								<input type="text" id="photo" name="photo" class="form-control" placeholder="사진파일" required>
								<div class="input-group-append">
									<a id="photo_upload" class="btn btn-singup"  data-toggle="modal" data-target="#photo" style="color:white">사진 업로드</a>
								</div>
							</div>
							<small>&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;본인의 증명사진을 올려주시기 바랍니다.</small>
						</div>
						
						
						
						
						
						<div class="form-label-group">
							<div class="input-group">
								<input type="email" id="email" name="email" class="form-control" placeholder="이메일" required>
								<label for="email">이메일</label>
								<div class="input-group-append">
									<select class="form-control" id="email2">
										<option>E-Mail 선택</option>
										<option>naver.com</option>
										<option>hanmail.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
									</select>
								</div>
							</div>
							<small>&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;추후 이메일 인증을 위해 정확히 입력 해주시기 바랍니다.</small>
						</div>
						<div class="form-label-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<select class="form-control" id="sel1" name="telfront">
										<option selected="selected">010</option>
										<option>011</option>
										<option>019</option>
										<option>016</option>
									</select>
								</div>
								<input type="text" id="tel" class="form-control" name="telback" placeholder="전화번호" required> 
									<label for="tel">전화번호</label>
							</div>
						</div>
						<div class="form-label-group">
							<div class="input-group">
								<input type="text" id="addr0" name="addr0" class="form-control" placeholder="우편번호" required>
								<label for="addr0">우편번호</label>
								<div class="input-group-append">
									<button id="addrSearch" class="btn btn-singup">주소 검색</button>
								</div>
							</div>
						</div>
						<div class="form-label-group">
							<input type="text" id="addr1" name="addr1" class="form-control"  placeholder="지번주소" required>
							<label for="addr1">지번주소</label>
						</div>
						<div class="form-label-group">
							<input type="text" id="addr2" name="addr2" class="form-control"  placeholder="상세주소" required>
							<label for="addr2">상세주소</label>
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
								<h2>차 번호</h2>
								<input type="text" id="carnumber" name="carnumber" class="form-control"  placeholder="차 번호를 입력하세요">
								<small>&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;카풀 매칭시 이용자에게 알려주어 도달 시 찾기 용이하게 합니다.</small>
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
	
		<div class="modal fade" id="photomodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		  <div class="modal-dialog" role="document" >
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">사진 등록하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form enctype="myltipart/form-data" >
		      	<div class="modal-body">
               		<div class="form-group">
                  	  <input type="file" class="form-control123" id="photoinput">
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
<script>

$(function() {
	
	$('#photo_upload').click(function(){
		$('#photomodal').modal();
	}) 
})
	



</script>



