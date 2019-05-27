<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
   .starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

.site-section{
height:800px;
}


</style>

<script>
   $(function(){
      console.log('${yes}'=="222");
      if('${yes}'=="222"){
         $('#nav-home-tab').prop('class','nav-item nav-link');
         $('#nav-profile-tab').prop('class','nav-item nav-link active');
         $('#nav-home').prop('class','tab-pane fade');
         $('#nav-profile').prop('class','tab-pane fade active show');
      }
      
   });
   

</script>

 	<!-- MAIN CONTENT-->	
	<div class="site-section" style="padding: 2em;">	
	<div class="container">
	<form class="carviewform" action="yes.kosmo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" value="" id="cp_no" name="cp_no">
		<input type="hidden" value="" id="done" name="done">
	</form>
		<nav class="nav nav-tabs" id="nav-tab" role="tablist">
	
			<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab">현재 예약</a> 
			<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab">완료 예약</a>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade active show" id="nav-home" role="tabpanel">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="data-tables datatable-dark" style="padding-top: 20px; text-align: center;">				
							<table id="dataTable3" style="width: 100%; text-align: center">
								<thead>
								
									<tr>
										<th style="background-color: #ffaec9">작성자</th>
										<th style="background-color: #ffaec9">예약신청자</th>
										<th style="background-color: #ffaec9">출발지</th>
										<th style="background-color: #ffaec9">목적지</th>
										<th style="background-color: #ffaec9">시간</th>
										<th style="background-color: #ffaec9">가격</th>
										<th style="background-color: #ffaec9">타입</th>
										<th style="background-color: #ffaec9">완료여부</th>
									</tr>
								</thead>								
									<c:forEach items="${selist }" var="items" varStatus="loop">
										<c:if test="${items.id==id2 ||items.reservationid ==id2 }">
											<c:if test="${items.finish==0}">
												<tr>
													<th>${items.id }</th>
													<th>${items.reservationid }</th>
													<th>${items.startpoint }</th>
													<th>${items.endpoint }</th>
													<th>${items.time }</th>
													<th>${items.price }</th>
													<th>${items.type }</th>												
													<c:if test="${items.type=='태워주세요' && items.reservationid ==id2}">
														<th><button class="btn btn-success btn-sm btnsubmit" id="${items.cp_no }">완료</button></th>
													</c:if>												
													<c:if test="${items.type=='타세요' && items.id ==id2}">
														<th><button class="btn btn-success btn-sm btnsubmit" id="${items.cp_no }">완료</button></th>
													</c:if>													
												</tr>
											</c:if>
										</c:if>
									</c:forEach>
							</table>
                  </div>
               </div>
            </div>

         </div>
         
         <div class="tab-pane fade" id="nav-profile" role="tabpanel">
            <div class="data-tables datatable-dark" style="padding-top: 20px; text-align: center;">
                     <table id="dataTable3" style="width: 100%; text-align: center">
                        <thead>
                           <tr>
                              <th style="background-color: #ffaec9">작성자</th>
                              <th style="background-color: #ffaec9">예약신청자</th>
                              <th style="background-color: #ffaec9">출발지</th>
                              <th style="background-color: #ffaec9">목적지</th>
                              <th style="background-color: #ffaec9">시간</th>
                              <th style="background-color: #ffaec9">가격</th>
                              <th style="background-color: #ffaec9">타입</th>
                              <th style="background-color: #ffaec9">완료여부</th>
                           </tr>
                        </thead>
                           <c:forEach items="${selist }" var="items" varStatus="loop">
                              <c:if test="${items.id==id2 || items.reservationid ==id2}">
                                 <c:if test="${items.finish==1}">
                                    <tr>
                                       <th>${items.id }</th>
                                       <th>${items.reservationid }</th>
                                       <th>${items.startpoint }</th>
                                       <th>${items.endpoint }</th>
                                       <th>${items.time }</th>
                                       <th>${items.price }</th>
                                       <th>${items.type }</th>   
                                       <c:if test="${items.score=='0'}">
                                          <c:if test="${items.type=='태워주세요' && items.id ==id2}">
                                             <th><button type="button" class="btn btn-sm btn-success btnreview" data-toggle="modal" id="${items.cp_no }" data-target="#exampleModal">평점</button></th>
                                          </c:if>                                 
                                          <c:if test="${items.type=='타세요' && items.reservationid ==id2}">
                                             <th><button type="button" class="btn-sm btn btn-success btnreview" data-toggle="modal" id="${items.cp_no }" data-target="#exampleModal">평점</button></th>
                                          </c:if>
                                       </c:if>               
                                    </tr>                                 
                                 </c:if>
                              </c:if>
                           </c:forEach>
                     </table>
                  </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">평점 주기</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               
               <div class="modal-body">
                     <form class="carriewform" action="grade.kosmo" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     <input type="hidden" value="" id="modalno" name="modalno">
                     <input type="hidden" value="" id="score" name="score">
                     <input type="hidden" value="" id="reviewed" name="reviewed">
                     <input type="hidden" value="" id="cp_no" name="cp_no">
                          <div class="input-group mb-3">
                          <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default" >제목</span>
                          </div>
                          <input type="text" class="form-control" name="title">
                     </div>
                     <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">내용</span>
                          </div>
                          <textarea class="form-control" name="content"></textarea>
                     </div>
                     <div class="starRev" style="margin-top: 10px">
                        <span class="starR" value="1">1</span>
                        <span class="starR" value="2">2</span>
                        <span class="starR" value="3">3</span>
                          <span class="starR" value="4">4</span>
                          <span class="starR" value="5">5</span>
                          <span class="starR" value="6">6</span>
                          <span class="starR" value="7">7</span>
                          <span class="starR" value="8">8</span>
                          <span class="starR" value="9">9</span>
                          <span class="starR" value="10">10</span>
                     </div>
                  </form>               
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary btngrade">리뷰등록</button>
                  </div>
               
             </div>
           </div>
         </div>
         <!-- Modal -->
         
      </div>
      <!-- 여기가 탭키 나누는곳 -->
	</div>
   </div> 
   <!-- END MAIN CONTENT-->


<script src="admin_assets/bootstrap_table/jquery-3.3.1.js"></script>
<script src="admin_assets/bootstrap_table/jquery.dataTables.min.js"></script>
<script src="admin_assets/bootstrap_table/dataTables.bootstrap4.min.js"></script>
   
<!-- Bootstrap JS-->
<script src="admin_assets/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="admin_assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>

<script src="admin_assets/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="admin_assets/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="admin_assets/vendor/circle-progress/circle-progress.min.js"></script>
<script src="admin_assets/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="admin_assets/vendor/select2/select2.min.js"></script>

  <!-- 블록체인 -->
    <script src='/baby/resources/aranblockchain.js'></script>


<script>
var message;

window.addEventListener('load', async () => {

    if (window.ethereum) {
        window.web3 = new Web3(ethereum);
        try {
            // Request account access if needed
            await ethereum.enable();
            // Acccounts now exposed
            web3.eth.sendTransaction({ /* ... */ });
        } catch (error) {
            // User denied account access...
        }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
        window.web3 = new Web3(web3.currentProvider);
        // Acccounts always exposed
        web3.eth.sendTransaction({ /* ... */ });
    }
    // Non-dapp browsers...
    else {
        console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
    }
    
    message=web3.eth.contract(abi).at(contractAddress);
    //startApp();
});
////////////////////////////////////////////////////////



$('.btnsubmit').click(function(){
   
   $('#cp_no').val($(this).attr('id'));
   console.log('번호:' + $('#cp_no').val($(this).attr('id')));
   var no = $('#cp_no').val();
   nono = no;
   console.log(no);
   //console.log("제공자:" + $(this).parent().parent().children().eq(0).text());
   console.log('asdasd:' + $(this).parent().parent().children().eq(0).text());
   var provider = vv($(this).parent().parent().children().eq(0).text());
   var user = vv($(this).parent().parent().children().eq(1).text());
   console.log(provider + " :: " + user);
   
/*       message.closingbook(no,function(e,r){
       $('#done').val(r);
       $('.carviewform').submit();  
    });  */
     
   /* $('#done').val("ㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇ");
   $('.carviewform').submit(); */
}); 

var nono;
var provider;
var user;


$('.btnreview').click(function(){
   $('#modalno').val($(this).attr('id'));
   nono = $('#modalno').val();
   console.log('번호:' + nono);
   console.log('클릭한 번호:' + $(this).attr('id'));
   
   //var no = $('#cp_no').val();
   var cp_no = '${items.cp_no }';
   var modalno = $('#modalno').val();
   provider = vv($(this).parent().parent().children().eq(0).text());
   user = vv($(this).parent().parent().children().eq(1).text());
   console.log(provider + " :: " + user);
   
});

$('.starRev span').click(function(){
     $(this).parent().children('span').removeClass('on');
     $(this).addClass('on').prevAll('span').addClass('on');
     console.log('클릭한 번호2:' + $('modalno').val());
     console.log("nononononononononononono : "+nono)
     return false;
     
});

$('.starR').click(function(){
	var no = $(this).attr('id')
   console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+no);
	console.log('클릭한 번호3:' + $('modalno').val());
   var score = $(this).html();
   var h_Score = vv($(this).html());
   console.log('adsasd:' + score);
   $('#score').val(score);
   $('#modalno')
   $('.btngrade').click(function(){
      //CpReview(번호,카페주인,유저,점수)      
      $('#cp_no1').val(nono);
      console.log(nono);
      console.log($('#cp_no1').val());
      
      console.log('provider:' + provider);
      console.log('user' + user);
      console.log('score' + parseInt(score));

        console.log('리뷰등록을 해봐?');
         /*   message.CpReview(nono,provider,score,function(e,r){
         	console.log(r);
          $('#reviewed').val(r);
          $('.carriewform').submit();
      });      */
      
       
/*          message.getSign(6,function(e,r){
    	  console.log(r);
      })    */
      /*  $('#reviewed').val("0xe785414c9dde601e734879578ab856541b3203d211e004e14b611ec22c87ef03");
         $('.carriewform').submit(); */
   });
});
</script>

<script src="https://code.jquery.com/jquery-latest.js"></script>



