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
			
		<!-- 

			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.1s" style="padding:10px 10px "><a
				href="https://www.youtube.com/watch?v=gcAbeTWjHvQ"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/gcAbeTWjHvQ/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span>
			</a></li>
			
			
			
			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.1s" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=pe1asLzVQBQ"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/pe1asLzVQBQ/mqdefault.jpg"
					class="img-responsive">내아이 키우기 프로젝트 <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li>

			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.15" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=IDPPkozCxOw"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/IDPPkozCxOw/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li>
			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.2s" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=2ktbTawmR28
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/2ktbTawmR28/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li>
			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.25s" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=krbcaUy8K24"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/krbcaUy8K24/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li>

			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.3s" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=Z0usnVLGWtM"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/Z0usnVLGWtM/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li>
			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.2s" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=FqFmMFrRWew"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/FqFmMFrRWew/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li>
			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.25s" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=M4x-SWwc6dI"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/M4x-SWwc6dI/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li>

			<li class="col-lg-4 col-sm-4 col-xs-6"
				data-sr="enter bottom but wait 0.3s" style="padding:10px 10px" ><a
				href="https://www.youtube.com/watch?v=ZnLQKTXAtMs"
				data-toggle="lightbox" data-gallery="youtubevideos"> <img
					src="http://img.youtube.com/vi/ZnLQKTXAtMs/mqdefault.jpg"
					class="img-responsive"> <span
					class="glyphicon glyphicon-play-circle"></span> 
			</a></li> -->
		</ul>

	</div>
</div> 

	

