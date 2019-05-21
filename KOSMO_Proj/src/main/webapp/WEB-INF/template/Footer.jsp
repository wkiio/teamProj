<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
https://mdbootstrap.com/components/bootstrap-footer/
 -->
<!-- Footer -->
<footer class="site-footer" style="border-top: 2px solid #5f84b7;background-color: #e4e2ff;">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-12">
				<div class="mb-5">
					<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
				</div>

				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<!--   Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >육아육아해</a>
       				 -->
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</div>
</footer>
<!-- 주소 검색 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/baby/resources/js/addrSearch.js"></script>
<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
		event.preventDefault();
		$(this).ekkoLightbox();
	});

</script>


<!-- 카카오 로그인 -->
<script src="Bootstrap/js/main.js"></script>

