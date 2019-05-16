<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp" %>
<sec:authentication property="principal.username" var="id"/>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="row" id="comments">
					<!-- 한줄 코멘트 목록-->
					<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
					
</div>

<div class="container">
	<div class="row">
		<div class="col-md-9" style="left:35.5%">
			<div class="col-md-offset-2 col-md-6">
				<!-- 한줄 코멘트 입력 폼-->
				<form class="form" id="frm" method="post">
				
				<div id='recomment'>
				<h2>방명록<small> 글 입력</small></h2>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				 
				<input type="hidden" name="gno" /> 
				<!-- 수정 및 삭제용 파라미터 -->
				<div style='overflow:hidden;'>
				
				<div style='float:left;'>
			    <img style="border-radius: 50px; height: 50px; width:50px" src="resources/images/cyworldMini.jpg"   /> 
			    </div>
			    <div style='float:left'>
			    <input placeholder="댓글을 입력하세요" id="title" class="form-control" type="text" size="50" name="gcomment" />
				</div>
				<div style='float:left;'>
				<input id="submit" class="btn btn-info" value="확인" />
				</div>
				<div style='float:left;'>
				<input id="image" class="btn btn-success" value="이미지"/>
				</div>
						
				</div>
				</form>
			
			</div>
		</div>
	</div>

</div>
<script>
$(function(){
	//코멘트 입력처리]
	showComments();
	$('#submit').click(function(){
		console.log('클릭 확인');
		if($(this).val()=='확인'){
			console.log('확인??');		
			$.ajax({
				url: "<c:url value='/GuestBook/Write.kosmo'/>",
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(){
					console.log('성공');
					showComments();
					//입력댓글 클리어 및 포커스 주기
					$('#title').val('');
					$('#title').focus();					
				}				
			}); 			
		}
		else if ($(this).val()=='답변'){///답변 작성용
			console.log('답변 클릭후 답변 작성 스타트');
			
			$.ajax({
				url: "<c:url value='/GuestBook/reply.kosmo'/>",
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(){
					console.log('답변 입력 성공');
					showComments();
					
					$('#title').val('');
					$('#title').focus();					
				}				
			}); 
						
			}////대댓글
		else{
			console.log('요건 수정')
		}
		
		
	});//코멘트 입력처리 끝]
	
});//////////////////$(function(){


var showComments=function(){
	$.ajax({
		url:"<c:url value='/GuestBook/List.kosmo'/>",
		//스프링 보안 적용시(단,CSRF적용시(POST방식)에만 서버에 CSRF토큰값도 같이 보내야 한다)
		data:{'${_csrf.parameterName}':'${_csrf.token}'},
		dataType:'json',
		type:'post',
		success:displayComments			
	});		
};///////////showComments	

//현재 글번호에 대한 코멘트 목록을 DIV영역에 뿌려주는 함수
//data는 아래 형태로 
//[{"NO":2,"LINECOMMENT":"댓글2","CPOSTDATE":"2018-09-12","CNO":3,"ID":"LEE","NAME":"이길동"},{"NO":2,"LINECOMMENT":"댓글1","CPOSTDATE":"2018-09-12","CNO":2,"ID":"PARK","NAME":"박길동"}]
var displayComments = function(data){
	console.log(JSON.stringify(data));
	var commentsString="";
	commentsString+="<div class='col-md-9' style='left:12.5%'><h2 style='text-align: center;'>방명록 <small>댓글 목록</small></h2><table id='add_table'  class='table table-bordered'>";
	commentsString+="<tr><th width='15%'>작성자</th><th width='50%'>댓글</th><th>작성일</th><th>답변/삭제</th></tr>";
	if(data.length==0){
		commentsString+='<tr><td colspan="4">등록된 한줄 댓글이 없어요</td></tr>';
	} 
	$.each(data,function(index,comment){
		commentsString += " ";
	
		commentsString+="<tr><td>"+comment['ID']+'</td>';
		//본인이 쓴 코멘트 수정할 수 있도록 링크 처리
		if('kim' != comment['ID'])//보안적용 후
			commentsString+="<td align='left'>"+comment['GCOMMENT']+'</td>';
			else //수정 
			commentsString+="<td align='left'><span style='cursor:pointer' class='commentEdit' title='"+comment['GNO']+"'>"+comment['GCOMMENT']+'</span></td>';
				
		commentsString+="<td>"+comment['GPOSTDATE']+'</td>';
		commentsString+="<td>";
		if('kim' != comment['ID'])//보안적용 후
			commentsString+="<span style='color:gray;font-size:.7em;font-weight:bold'>삭제불가</span>"
		else
			commentsString+="<a href='#recomment'><span class='reply' title='"+comment['GNO']+"' style='cursor:pointer;color:green;font-size:1.2em;font-weight:bold'>답변 / </span></a><span class='commentDelete' title='"+comment['GNO']+"' style='cursor:pointer;color:green;font-size:1.2em;font-weight:bold' >삭제</span>"
		commentsString+="</td></tr>";
	});
	commentsString+="</table></div>";
	$('#comments').html(commentsString);
	
	//※아래는 반드시 $('#comments').html(commentsString);이후에
	// 왜냐하면 commentEdit 및 commentDelete클래스명을 가진 span태그가
	// 생성된후 호출해야 한다
	//코멘트 제목 클릭시 코멘트 수정처리를 위한 UI변경부분]
	
	$('.commentEdit').click(function(){			
		console.log('클릭한 댓글의 키값(GNO):',$('#title').attr('title'));
		//클릭한 제목으로 텍스트박스 값 설정
		//$('#title').val($(this).html());
		
		$('#submit').val('댓글수정');
		
		$('#title').focus();
		//form의 hidden속성중 name="cno"값 설정
		
		$('input[name=gno]').val($(this).attr('title'));
		
		$('#submit').click(function(){			
			if($('#submit').val()=='댓글수정'){			
				
				//console.log('입력한값 :' + $('#title').val());			
				$.ajax({
					url:'<c:url value="/GuestBook/Edit.kosmo"/>',
					//스프링 보안 적용시(단,CSRF적용시(POST방식)에만 서버에 CSRF토큰값도 같이 보내야 한다)
					data:$('#frm').serialize(),
					dataType:'text',
					type:'post',
					success:function(){showComments(); $('#submit').val('확인');$('#title').val('');
					$('#title').focus();}
				})
			 }; 	
			});		
	});
	
	
	$('.commentDelete').click(function(){
		
		$.ajax({
			url:'<c:url value="/GuestBook/Delete.kosmo"/>',
			//스프링 보안 적용시(단,CSRF적용시(POST방식)에만 서버에 CSRF토큰값도 같이 보내야 한다)
			data:{gno:$(this).attr('title'),'_csrf':'${_csrf.token}'},
			dataType:'text',
			type:'post',
			success:function(){showComments();}
		});
		
	});
	
	$('.reply').click(function(){		
	console.log('답변 클릭 펑션:'+$(this).attr('title'));
	$('input[name=gno]').val($(this).attr('title'));
	console.log($(this).attr('title'));
 	console.log("찾은 것:" ,$(this).html());

 	$('#submit').val('답변')
 	$('#title').focus();
	console.log('답변 펑션 완료')	
	
	});
	
	
};/////////displayComments

	$('#image').click(function(){
	console.log('이미지 클릭')
	
	
	});



</script>


