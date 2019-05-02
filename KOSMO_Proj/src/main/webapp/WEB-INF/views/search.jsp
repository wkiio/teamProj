<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>

       
		
<link rel="stylesheet" href="<c:url value='/Bootstrap/css/search.css'/>" />

<style type="text/css">                           
	     #right_full_box {	
	         left: 0px;
	         height:600px;
	         width: 100%;
	         overflow: visible;
	     }
	
	     #right_full_box .frmap {
	         margin-left: 0px;
	         
	     }	     
</style>


<div class="site-section" style="height: auto; padding: 0em;">
	<div class="container">
		<div id="right_full_box" class="f1_box">
			<div id="city_list">
				<div class="list_title">
					<span>육아 검색</span>
				</div>
				<div class="clear"></div>
				<div class="list_search_full_box">
					<div class="list_search_box">
						<input type="text" id="keyword" placeholder="장소 검색"
							onFocus="this.value='';return true;">
					</div>
					<ul class="list_category_box" id="category">
						<li id="a12" data-order="0" class="tourist">
							<!-- 관광지 -->
						</li>
						<li id="a39" data-order="1" class="food">
							<!-- 음식 -->
						</li>
						<li id="a38" data-order="2" class="shop">
							<!-- 쇼핑 -->
						</li>
						<li id="a32" data-order="3" class="hotel">
							<!-- 숙박 -->
						</li>
						<li id="a50" class="zzim">
							<!-- 찜 -->
						</li>
					</ul>
				</div>
				<div id="menu_wrap" class="bg_white">
					<ul id="placesList" class="filterUL"></ul>
					<div id="pagination"></div>
				</div>
				<div class="clear"></div>
				<div id="map" class="frmap"></div>
				<div class="clear"></div>


			</div>
		</div>
	</div>
</div>
