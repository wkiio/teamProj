<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="site-section" style="height:auto; padding:2em;">
      <div class="container" >
        
     <!--   <div style="text-align: center;">&nbsp; 
       <a href="https://www.youtube.com/watch?v=HQzu7NYlZNQ" data-toggle="lightbox" data-width="800px" ><img src="http://img.youtube.com/vi/HQzu7NYlZNQ/mqdefault.jpg"></a></div>
 -->

<%-- 
		<ul class="list-unstyled video-list-thumbs row">
		
			<c:if test="${empty list }" var="isEmpty">
				<span>등록된 게시물이 없어요</span>
			</c:if>
		
			
					<li class="col-lg-4 col-sm-4 col-xs-6" data-sr="enter bottom but wait 0.1s" style="padding:10px 10px ">
						<a href="${item.url }" data-toggle="lightbox" data-gallery="youtubevideos"> 
							<img src="${item.thumbnail }" class="img-responsive">
							<h3>${item.title}</h3> 
							<span class="glyphicon glyphicon-play-circle">${item.title}</span>
						</a>
					</li>
				
		
		</ul> --%>
		<c:if test="${empty list }" var="isEmpty">
				<span>등록된 게시물이 없어요</span>
			</c:if>
	
		<section class="junior__gallery__area bg--white section-padding--lg">
			<div class="container">
				<div class="row galler__wrap mt--40">
					<c:if test="${!isEmpty }">
						<c:forEach var="item" items="${list}" varStatus="loop">			
					<div class="col-lg-4 col-md-6 col-sm-6 col-12">
						<div class="gallery wow fadeInUp">
							<div class="gallery__thumb">
								 <a> 
									<img src="${item.thumbnail }" alt="gallery images" style="width:370px;height:320px">
								</a>
							</div>
							<div class="gallery__hover__inner">
								<div class="gallery__hover__action">
									<ul class="gallery__zoom">
										<li><a href="${item.url }" data-toggle="lightbox" data-gallery="youtubevideos" ><i class="fa fa-link"></i></a></li>
										<!-- <li><a href="https://www.youtube.com/watch?v=gcAbeTWjHvQ"><i class="fa fa-link"></i></a></li> -->
									</ul>
									<h4 class="gallery__title"><a href="#">${item.title}</a></h4>
								</div>
							</div>
						</div>
					</div>
						</c:forEach>
					</c:if>		
				</div>				
			</div>	
			
		</section>
		
	</div>
</div> 

	
	<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
		event.preventDefault();
		$(this).ekkoLightbox();
	});

</script>

