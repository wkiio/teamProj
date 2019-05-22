<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>


<div class="row" id="comments">
	<!-- 한줄 코멘트 목록-->
	<!-- ajax로 아래에 코멘트 목록 뿌리기 -->

</div>
<br />

<div class="container">
	<div class="row">
		<div class="col-md-9" style="margin-left: 30%">
			<div class="col-md-6">
				<!-- 한줄 코멘트 입력 폼-->
				<form class="form" id="frm" method="post" enctype="multipart/form-data">

					<div id='recomment'>

						<h3>
							방명록<small> 글 입력</small>
						</h3>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" name="id" /> <input
						type="hidden" name="gno" />
					<!-- 수정 및 삭제용 파라미터 -->
					<div style='overflow: hidden;'>
						<!-- 
				<div style='float:left;'>
			    <img style="border-radius: 50px; height: 50px; width:50px;border:5px solid black;" src="resources/images/cyworldMini.jpg"   id="image_section"  alt="your image"  /> 
			    </div>
			     -->
						<!-- <div style='float:left;border:5px solid red;width:80%' id="summernote" >
			     -->
						<textarea placeholder="댓글을 입력하세요" class="form-control" type=text
							size="250" name="gcomment" id="gcomment"></textarea>
							
						<!-- </div>
				 -->


						<!-- 
				<div style='float:left;border:5px solid blue;width:30% '>
				<input id="imgInput" type="image" class="btn btn-success" value="이미지" name='image' />
				</div>
				 -->
						<div style='float: left; border: 5px solid blue; width: 30%'>
							<input type='file' name='image'  class="btn btn-success">							
						</div>

						<div style='float: left; border: 5px solid green; width: 100%'>
							<input id="submit" class="btn btn-info" value="확인" />
						</div>
					</div>
				</form>

				<!-- 
				섬머 노트
			 -->



			</div>
		</div>
	</div>

</div>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			//height: 100,                 // set editor height
			minHeight : 100, // set minimum height of editor
			maxHeight : 400, // set maximum height of editor
			focus : true,
			placeholder : '댓글을 입력하세요',
			toolbar : [],
			focus : true,

		});
	});

	$(function() {
		//코멘트 입력처리]
		showComments();
		$('#submit').click(function() {
			console.log('클릭 확인');
			if ($(this).val() == '확인') {
				console.log('확인??');
				$.ajax({
					url : "<c:url value='/GuestBook/Write.kosmo'/>",
					data : $('#frm').serialize(),
					dataType : 'text',
					type : 'post',
					success : function() {
						console.log('성공');
						showComments();
						//입력댓글 클리어 및 포커스 주기
						$('#gcomment').focus();
						$('#gcomment').val('');
						
						
					}
				});
			} else if ($(this).val() == '답변') {///답변 작성용
				console.log('답변 클릭후 답변 작성 스타트');
				$('#title').focus();
				$.ajax({
					url : "<c:url value='/GuestBook/reply.kosmo'/>",
					data : $('#frm').serialize(),
					dataType : 'text',
					type : 'post',
					success : function() {
						console.log('답변 입력 성공');
						showComments()
						$('#gcomment').focus();
						$('#gcomment').val('');
						$('#submit').val('확인')

					}
				});

			}////대댓글
			else {
				console.log('요건 수정')
			}

		});//코멘트 입력처리 끝]

	});//////////////////$(function(){

	var showComments = function() {
		$.ajax({
			url : "<c:url value='/GuestBook/List.kosmo'/>",
			//스프링 보안 적용시(단,CSRF적용시(POST방식)에만 서버에 CSRF토큰값도 같이 보내야 한다)
			data : {
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : 'json',
			type : 'post',
			success : displayComments
		});
	};///////////showComments	

	//현재 글번호에 대한 코멘트 목록을 DIV영역에 뿌려주는 함수
	//data는 아래 형태로 
	//[{"NO":2,"LINECOMMENT":"댓글2","CPOSTDATE":"2018-09-12","CNO":3,"ID":"LEE","NAME":"이길동"},{"NO":2,"LINECOMMENT":"댓글1","CPOSTDATE":"2018-09-12","CNO":2,"ID":"PARK","NAME":"박길동"}]
	var displayComments = function(data) {
		var commentsString = "";
		/* if(data.length==0){
			commentsString+='<tr><td colspan="4">등록된 한줄 댓글이 없어요</td></tr>';
		} */

		$ .each(data,function(index, comment) {
							var B = 53;
						 	commentsString += "<div class='col-md-9' style='left:30%;margin-left:" + B * comment['depth'] + "px'><p>";
							commentsString += "<img style='width:50px;height:50px;margin-top: 15px;' src=\"<c:url value='/resources/memberPhoto/"+comment["photo"]+"'/>\" alt=\"프로필\" style='cursor: pointer;'/>";
							commentsString += "<span style='line-height:center;'><strong>" + comment['id'] + "</strong></span>"; 
							//console.log(comment["ID"]);
							//본인이 쓴 코멘트 수정할 수 있도록 링크 처리
							
							if('${id}' != comment['ID'])//보안적용 후
								commentsString+="<td align='left' id='preview'>"+comment['gComment']+'</td>';
							else //수정 
							
							commentsString += "<div style='margin-top: -15px;margin-left: 75px;width:300px;'><span style='margin-left:-25px;cursor:pointer' class='commentEdit' title='"+comment['gNo']+"'>"
									+ comment['gComment'] + '</span></div>';
							commentsString += "<span style='color:black;margin-left:50px;'>"
									+ comment['gPostdate'] + "</span>";
							commentsString += "<a href='#recomment'><span class='reply' title='"+comment['gNo']+"' style='cursor:pointer;color:black;'>  답변  </span></a><span class='commentDelete' title='"+comment['gNo']+"' style='cursor:pointer;color:black;'>삭제</span>";
							commentsString += "</p></div>";
						});

		$('#comments').html(commentsString);

		//※아래는 반드시 $('#comments').html(commentsString);이후에
		// 왜냐하면 commentEdit 및 commentDelete클래스명을 가진 span태그가
		// 생성된후 호출해야 한다
		//코멘트 제목 클릭시 코멘트 수정처리를 위한 UI변경부분]

		$('.commentEdit').click(function() {
			console.log('클릭한 댓글의 키값(GNO):', $('#title').attr('title'));
			//클릭한 제목으로 텍스트박스 값 설정
			//$('#title').val($(this).html());

			$('#submit').val('댓글수정');

			$('#summernote').focus();
			//form의 hidden속성중 name="cno"값 설정

			$('input[name=gno]').val($(this).attr('title'));

			$('#submit').click(function() {
				if ($('#submit').val() == '댓글수정') {

					//console.log('입력한값 :' + $('#title').val());			
					$.ajax({
						url : '<c:url value="/GuestBook/Edit.kosmo"/>',
						//스프링 보안 적용시(단,CSRF적용시(POST방식)에만 서버에 CSRF토큰값도 같이 보내야 한다)
						data : $('#frm').serialize(),
						dataType : 'text',
						type : 'post',
						success : function() {
							showComments();
							$('#submit').val('확인');
							$('#summernote').val('');
							$('#summernote').focus();
						}
					})
				}
				;
			});
		});

		$('.commentDelete').click(function() {

			$.ajax({
				url : '<c:url value="/GuestBook/Delete.kosmo"/>',
				//스프링 보안 적용시(단,CSRF적용시(POST방식)에만 서버에 CSRF토큰값도 같이 보내야 한다)
				data : {
					gno : $(this).attr('title'),
					'_csrf' : '${_csrf.token}'
				},
				dataType : 'text',
				type : 'post',
				success : function() {
					showComments();
				}
			});

		});

		$('.reply').click(function() {
			console.log('답변 클릭 펑션:' + $(this).attr('title'));
			$('input[name=gno]').val($(this).attr('title'));
			console.log($(this).attr('title'));
			console.log("찾은 것:", $(this).html());

			$('#submit').val('답변')
			$('#summernote').focus();
			console.log('답변 펑션 완료')

		});

	};/////////displayComments
	/*
	$('#image').click(function(){
	console.log('이미지 클릭')
	
	
	});
	
	var file = document.querySelector('#image');
	
	file.onchange = function() {
		console.log('파일 이미지 스타트')
		
		var fileList = file.files;
		//읽기
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);
		
		reader.onload = function(){
			document.querySelector('#preview').src = reader.result;
		};
		
	};
	 */
	/* 
	 function readURL(input) {
	
	 if (input.files && input.files[0]) {
	 var reader = new FileReader();
	
	 reader.onload = function (e) {
	 $('#image_section').attr('src', e.target.result);
	 }
	
	 reader.readAsDataURL(input.files[0]);
	 }
	 }
	
	 $("#imgInput").change(function(){
	 readURL(this);
	 });

	 */

	 
	 
	 
	 
	 
	 
	 
</script>
