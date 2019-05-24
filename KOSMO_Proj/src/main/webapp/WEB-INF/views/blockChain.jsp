<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp"%>

<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.username" var="id" />
</sec:authorize>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<script>

$(function(){
    $('#carouselExampleIntervals').carousel({
        interval:0,
        pause: "false"
       
    });

});


</script>
<style>
.invoice-box {
   max-width: 800px;
   margin: auto;
   padding: 30px;
   border: 1px solid #eee;
   box-shadow: 0 0 10px rgba(0, 0, 0, .15);
   font-size: 16px;
   line-height: 24px;
   font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
   color: #555;
}

.invoice-box table {
   width: 100%;
   line-height: inherit;
   text-align: left;
}

.invoice-box table td {
   padding: 5px;
   vertical-align: top;
}

.invoice-box table tr td:nth-child(2) {
   text-align: right;
}

.invoice-box table tr.top table td {
   padding-bottom: 20px;
}

.invoice-box table tr.top table td.title {
   font-size: 45px;
   line-height: 45px;
   color: #333;
}

.invoice-box table tr.information table td {
   padding-bottom: 40px;
}

.invoice-box table tr.heading td {
   background: #eee;
   border-bottom: 1px solid #ddd;
   font-weight: bold;
}

.invoice-box table tr.details td {
   padding-bottom: 20px;
}

.invoice-box table tr.item td {
   border-bottom: 1px solid #eee;
}

.invoice-box table tr.item.last td {
   border-bottom: none;
}

.invoice-box table tr.total td:nth-child(2) {
   border-top: 2px solid #eee;
   font-weight: bold;
}

@media only screen and (max-width: 600px) {
   .invoice-box table tr.top table td {
      width: 100%;
      display: block;
      text-align: center;
   }
   .invoice-box table tr.information table td {
      width: 100%;
      display: block;
      text-align: center;
   }
}

/** RTL **/
.rtl {
   direction: rtl;
   font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial,
      sans-serif;
}

.rtl table {
   text-align: right;
}

.rtl table tr td:nth-child(2) {
   text-align: left;
}

.carousel-control-prev-icon {
background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
}

.carousel-control-next-icon {
background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");
}

 input {
text-align: right;
border:0;
outline: 0;
} 
.td_time {
  width: 275px;
}



</style>





<br />

<form class="form-signin" method="post"
   action="Blockchain123.kosmo?${_csrf.parameterName}=${_csrf.token}"
   autocomplete="off">
   <div style='overflow: hidden;'>
      <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" /> 
      <input
         style='margin-left: 20%; float:left; height: 40px; width: 60%;'
         id='val' name="cp_no">
      
      <button type="submit" style='border-radius:"0rem";float:left; width: 50px;' id="submit"
         class="btn btn-success btn-sm">확인</button></div>
   
</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
   integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
   integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
   integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
   crossorigin="anonymous"></script>
<div id="carouselExampleInterval" class="carousel slide"
   data-ride="carousel">
   <ol class="carousel-indicators">
       <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
       <li data-target="#carousel-example-generic" data-slide-to="1"></li>
       <li data-target="#carousel-example-generic" data-slide-to="2"></li>
       <li data-target="#carousel-example-generic" data-slide-to="3"></li>
     </ol>



   <div class="carousel-inner">
      <div class="carousel-item active">

         <fieldset>
            <div class="invoice-box">
               <table cellpadding="0" cellspacing="0">
                  <tr class="top">
                     <td colspan="2">
                        <table>
                           <tr>
                              <td class="title" style="font-family:sans-serif"><img style="width:23%" src='<c:url value="/resources/images/AranVal.png"/>'>
                                 <span> 글 등록<small style="font-size:large">1/4</small></span></td>

                              <td class="td_time">TimeStamp #: <input type="text" id="time1" value="" readonly/><br>
                                 Tx Hash: <input type="text" id="tranhash1" value="" readonly/><br>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="information">
                     <td colspan="2">
                        <table>
                           <tr>

                              <td>송신자 <br>수신자 <br>가스 사용량
                              </td>

                              <td><input type="text" id="from1" value="" readonly/><br> <input
                                 type="text" id="to1" value="" readonly/><br> <input type="text"
                                 id="gas1" value="" readonly/></td>

                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="heading">
                     <!-- 
            <td>TimeStamp</td>

            <td><input type="text" id="time1" value=""/></td>
         </tr>

         <tr class="details">
            <td>Tx Hash</td>

            <td><input type="text" id="tranhash1" value=""/></td>
         </tr>
 -->
                  <tr class="heading">
                     <td>항목</td>

                     <td>실제 정보</td>
                  </tr>

                  <tr class="item">
                     <td>구분</td>

                     <td><input type="text" id="division1" style="text-align: right;font-weight: 100;" readonly /></td>
                  </tr>

                  <tr class="item">
                     <td>ID</td>

                     <td><input type="text" id="iden1" style="text-align: right;font-weight: 100;"readonly /></td>
                  </tr>
            

                  <tr class="total">
                     <td></td>

                     <td></td>
                  </tr>
               </table>
            </div>
         </fieldset>

      </div>
      <!--item active 
 -->
      <div class="carousel-item">
         <fieldset>
            <div class="invoice-box">
               <table cellpadding="0" cellspacing="0">
                  <tr class="top">
                     <td colspan="2">
                        <table>
                           <tr>
                              <td class="title"><img style="width:23%;font-family:sans-serif" src='<c:url value="/resources/images/AranVal.png"/>'>
                                 <span> 계약 체결<small style="font-size:large">2/4</small></span></td>
                              <td class="td_time">TimeStamp #: <input type="text" id="time2" value="" readonly/><br>
                                 Tx Hash: <input type="text" id="tranhash2" value="" readonly/><br>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="information">
                     <td colspan="2">
                        <table>
                           <tr>

                              <td>송신자 <br>수신자 <br>가스 사용량
                              </td>

                              <td><input type="text" id="from2" value="" /><br> <input type="text" id="to2" value="" readonly/><br> 
                              <input type="text" id="gas2" value="" readonly/></td>

                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="heading">
                     <!-- 
            <td>TimeStamp</td>

            <td><input type="text" id="time1" value=""/></td>
         </tr>

         <tr class="details">
            <td>Tx Hash</td>

            <td><input type="text" id="tranhash1" value=""/></td>
         </tr>
 -->
                  <tr class="heading">
                     <td>항목</td>

                     <td>실제 정보</td>
                  </tr>

                  <tr class="item">
                     <td>구분</td>

                     <td><input type="text" id="division2" style="text-align: right;font-weight: 100;"readonly /></td>
                  </tr>

                  <tr class="item">
                     <td>ID</td>

                     <td><input type="text" id="iden2" style="text-align: right;font-weight: 100;"readonly /></td>
                  </tr>

   
                  <tr class="total">
                     <td></td>

                     <td></td>
                  </tr>
               </table>
            </div>
         </fieldset>
      </div>
      <!-- item2       -->
      <div class="carousel-item">

         <fieldset>
            <div class="invoice-box">
               <table cellpadding="0" cellspacing="0">
                  <tr class="top">
                     <td colspan="2">
                        <table>
                           <tr>
                              <td class="title"><img style="width:23%;font-family:sans-serif"
                                 src='<c:url value="/resources/images/AranVal.png"/>'
                                 ><span> 운행완료<small style="font-size:large">3/4</small></span></td>

                              <td class="td_time">TimeStamp #: <input type="text" id="time3" value="" readonly/><br>
                                 Tx Hash: <input type="text" id="tranhash3" value="" readonly/><br>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="information">
                     <td colspan="2">
                        <table>
                           <tr>

                              <td>송신자 <br> 수신자 <br> 가스 사용량
                              </td>

                              <td><input type="text" id="from3" value="" readonly/><br> <input
                                 type="text" id="to3" value="" readonly/><br> <input type="text"
                                 id="gas3" value="" readonly/></td>

                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="heading">
                     <!-- 
            <td>TimeStamp</td>

            <td><input type="text" id="time1" value=""/></td>
         </tr>

         <tr class="details">
            <td>Tx Hash</td>

            <td><input type="text" id="tranhash1" value=""/></td>
         </tr>
 -->
                  <tr class="heading">
                     <td>항목</td>

                     <td>실제 정보</td>
                  </tr>

                  <tr class="item">
                     <td>완료여부</td>

                     <td><input type="text" id="division3" style="text-align: right;font-weight: 100;" readonly /></td>
                  </tr>

                  <tr class="item">
                  </tr>

                  <tr class="item last">
                  </tr>

                  <tr class="total">
                     <td></td>

                     <td></td>
                  </tr>
               </table>
            </div>
         </fieldset>
      </div>
      <!-- item       -->      
      <div class="carousel-item">
         <fieldset>
            <div class="invoice-box">
               <table cellpadding="0" cellspacing="0">
                  <tr class="top">
                     <td colspan="2">
                        <table>
                           <tr>
                              <td class="title"><img style="width:23%;font-family:sans-serif "
                                 src='<c:url value="/resources/images/AranVal.png"/>'
                                 ><span> 평점 부여<small style="font-size:large">4/4</small></span></td>

                              <td class="td_time">TimeStamp #: <input type="text" id="time4" value="" readonly/><br>
                                 Tx Hash: <input type="text" id="tranhash4" value="" readonly/><br>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="information">
                     <td colspan="2">
                        <table>
                           <tr>

                              <td>송신자 <br> 수신자 <br> 가스 사용량
                              </td>

                              <td><input type="text" id="from4" value="" readonly/><br> <input
                                 type="text" id="to4" value="" readonly/><br> <input type="text"
                                 id="gas4" value="" readonly/></td>

                           </tr>
                        </table>
                     </td>
                  </tr>

                  <tr class="heading">
                     <!-- 
            <td>TimeStamp</td>

            <td><input type="text" id="time1" value=""/></td>
         </tr>

         <tr class="details">
            <td>Tx Hash</td>

            <td><input type="text" id="tranhash1" value=""/></td>
         </tr>
 -->
                  <tr class="heading">
                     <td>항목</td>

                     <td>실제 정보</td>
                  </tr>

                  <tr class="item">
                     <td>리뷰 제목</td>
                     <td><input type="text" id="division5" style="text-align: right;font-weight: 100;"readonly /></td>
                  </tr>
                  <tr class="item">
                     <td>리뷰 내용</td>
                     <td><input type="text" id="division6" style="text-align: right;font-weight: 100;"readonly /></td>
                  </tr>
                  <tr class="item">
                     <td>평점</td>
                     <td><input type="text" id="division4" style="text-align: right;font-weight: 100;"readonly /></td>
                  </tr>

                 
                  <tr class="item last">
                     
                  </tr>

                  <tr class="total">
                     <td></td>

                     <td></td>
                  </tr>
               </table>
            </div>
         </fieldset>
      </div>
      <!-- item -->
   </div>
   <!-- 리스트 박스 -->
   <a class="carousel-control-prev" href="#carouselExampleInterval"
      role="button" data-slide="prev" > <span
      class="carousel-control-prev-icon" aria-hidden="true" style="color:black;"></span> <span
      class="sr-only" style="color:black;">Previous</span>
   </a> <a class="carousel-control-next" href="#carouselExampleInterval"
      role="button" data-slide="next"> <span
      class="carousel-control-next-icon" aria-hidden="true" style="color:black;"></span> <span
      class="sr-only" style="color:black;">Next</span>
   </a>
</div>
<!-- 컨테이너 -->
<script>
var message;
window.addEventListener('load', async () => {
    // Modern dapp browsers...
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


let receipt=async function(hash1,hash2,hash3,hash4){
    try{
       console.log('시작');
    await web3.eth.getTransactionReceipt(hash1,function(e,r){
        web3.eth.getBlock(r['blockNumber'],function(e,s){
            
           var timestamp = s['timestamp'];
           var myDate = new Date(timestamp*1000);
           var formattedDate=myDate.toLocaleString();
           
           $('#time1').val(formattedDate);
        });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
       $('#tranhash1').val(r['transactionHash']);
       $('#to1').val("아란 컨트랙트");
       $('#from1').val(r['from']);
       $('#gas1').val(r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
           $('#division1').val(web3.toAscii(r[0]));
           $('#iden1').val(web3.toAscii(r[1]));
           $('#addr1').val(r[2]);
             
           
        });
    });
 
    await web3.eth.getTransactionReceipt(hash2,function(e,r){
        web3.eth.getBlock(r['blockNumber'],function(e,s){

           var timestamp = s['timestamp'];
           var myDate = new Date(timestamp*1000);
           var formattedDate=myDate.toLocaleString();
        
           $('#time2').val(formattedDate);
            });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
        $('#tranhash2').val(r['transactionHash']);
        $('#to2').val(r['to']);
        $('#from2').val(r['from']);
        $('#gas2').val(r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
           $('#division2').val(web3.toAscii(r[3]));
           $('#iden2').val(web3.toAscii(r[4]));
           $('#addr2').val(r[5]);
        });
    });

    await web3.eth.getTransactionReceipt(hash3,function(e,r){
        web3.eth.getBlock(r['blockNumber'],function(e,s){
           var timestamp = s['timestamp'];
            var myDate = new Date(timestamp*1000);
            var formattedDate=myDate.toLocaleString();
         
            $('#time3').val(formattedDate);
         });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
        $('#tranhash3').val(r['transactionHash']);
        $('#to3').val("아란 컨트랙트");
        $('#from3').val(r['from']);
        $('#gas3').val(r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
           $('#division3').val(web3.toAscii(r[6]));
        });
    });

 await web3.eth.getTransactionReceipt(hash4,function(e,r){
        web3.eth.getBlock(r['blockNumber'],function(e,s){
           var timestamp = s['timestamp'];
           var myDate = new Date(timestamp*1000);
           var formattedDate=myDate.toLocaleString();
        
           $('#time4').val(formattedDate);
        });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
        $('#tranhash4').val(r['transactionHash']);
        $('#to4').val("아란 컨트랙트");
        $('#from4').val(r['from']);
        $('#gas4').val(r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
        var i = web3.toDecimal(r[7]);
        var star = "";
        switch(i) {
        case 1 : star = "★☆☆☆☆☆☆☆☆☆"; break;
        case 2 : star = "★★☆☆☆☆☆☆☆☆"; break;
        case 3 : star = "★★★☆☆☆☆☆☆☆"; break;
        case 4 : star = "★★★★☆☆☆☆☆☆"; break;
        case 5 : star = "★★★★★☆☆☆☆☆"; break;
        case 6 : star = "★★★★★★☆☆☆☆"; break;
        case 7 : star = "★★★★★★★☆☆☆"; break;
        case 8 : star = "★★★★★★★★☆☆"; break;
        case 9 : star = "★★★★★★★★★☆"; break;
        case 10 : star = "★★★★★★★★★★"; break;
        }
           $('#division4').val(star + "("+i+")");
           $('#division5').val('${title}');
           $('#division6').val('${content}');

    });
  
 console.log('끝');
});
    }
catch(error){
    return 'SHIT THE FUCK';
}

};

if('${opened}'!=null){
   receipt('${opened}','${signed}','${done}','${reviewed}');
}
else{
   console.log('가즈아!!');
};

$(function(){
      $('#submit').click(function(){
        

      }); 
      //click 이벤트

});

 
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='/baby/resources/aranblockchain.js'></script>
