<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.username" var="commentid" />
</sec:authorize>


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

<!--본문 
 -->
<div class="text-center my-3">
<h2>사이트</h2>
</div>
<br/>
<div class="text-center my-3" style="margin-left: 10%;width:80%">
<table class='table table-bordered'>
   <tr>
      <th width='15%'>No</th>
      <th width='50%'>사이트</th>
      <th>분류</th>
      <th>비고</th>
   </tr>
   <tr>
      <td>1</td>
      <td align='left'><a href="http://www.gov.kr">정부 24</a></td>
      <td align='left'>양육수당, 해산급여 등 임신*출산 관련 서비스 통합처리 신청</td>
      <td>맞춤형 혜택서비스 안내</td>
   </tr>
   <tr>
      <td>2</td>
      <td align='left'><a href="http://www.childcare.go.kr/">아이사랑</a></td>
      <td align='left'>임신,육아, 출산, 어린이집*유치원 관련 이용 서비스 안내</td>
      <td>어린이집 대기 신청</td>
   </tr>
   <tr>
      <td>3</td>
      <td align='left'><a href="http://online.bokjiro.go.kr/apl/aplMain.do">복지로</a></td>
      <td align='left'>나에게 맞는 복지 서비스 안내</td>
      <td>저소득층 기저귀 지원, 아이돌봄 서비스 신청등</td>
   </tr>
   <tr>
      <td>4</td>
      <td align='left'><a href="http://central.childcare.go.kr">육아종합지원센터</a></td>
      <td align='left'>어린이집 및 가정양육지원서비스 안내, 관련 정보 제공</td>
      <td>전국센터 부모교육 일정 안내</td>
   </tr>
   <tr>
      <td>5</td>
      <td align='left'><a href="http://www.parents.go.kr">학부모지원센터</a></td>
      <td align='left'>학부모 참여지원, 학부모 교육 및 상당심 운영</td>
      <td></td>
   </tr>
   <tr>
      <td>6</td>
      <td align='left'><a href="http://www.papanet4you.kr">아빠넷</a></td>
      <td align='left'>아빠 육아 지원 정책정보, 아빠 맞춤형 육아 정보 제공</td>
      <td>아빠 심리지원 제공</td>
   </tr>
   <tr>
      <td>7</td>
      <td align='left'><a href="http://www.familynet.or.kr">건강가정지원센터</a></td>
      <td align='left'>가족교육 및 가족상담사업,아이돌봄지원사업</td>
      <td></td>
   </tr>
   
</table>
</div>