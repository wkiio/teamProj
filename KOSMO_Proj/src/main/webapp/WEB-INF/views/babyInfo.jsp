<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="site-section" style="height:auto; padding:2em;">
      <div class="container" >
        
     <!--   <div style="text-align: center;">&nbsp; 
       <a href="https://www.youtube.com/watch?v=HQzu7NYlZNQ" data-toggle="lightbox" data-width="800px" ><img src="http://img.youtube.com/vi/HQzu7NYlZNQ/mqdefault.jpg"></a></div>
 -->


		<ul class="list-unstyled video-list-thumbs row">
		
			<c:if test="${empty list }" var="isEmpty">
				<span>등록된 게시물이 없어요</span>
			</c:if>
		
			<c:if test="${!isEmpty }">
				<c:forEach var="item" items="${list}" varStatus="loop">
					<li class="col-lg-4 col-sm-4 col-xs-6" data-sr="enter bottom but wait 0.1s" style="padding:10px 10px ">
						<a href="${item.url }" data-toggle="lightbox" data-gallery="youtubevideos"> 
							<img src="${item.thumbnail }" class="img-responsive">
							<h3>${item.title}</h3> 
							<%-- <span class="glyphicon glyphicon-play-circle">${item.title}</span> --%>
						</a>
					</li>
				</c:forEach>
			</c:if>
		
		</ul>

	</div>
</div> 

	
	<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
		event.preventDefault();
		$(this).ekkoLightbox();
	});

</script>

