<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='/baby/resources/aranblockchain.js'></script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="id" />
</sec:authorize>
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
</style>
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
            $('#time1').val(s['timestamp']);
        });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
       $('#tranhash1').val(r['transactionHash']);
       $('#to1').val(r['to']);
       $('#from1').val(r['from']);
       $('#gas1').val(r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
        	$('#division1').val(web3.toAscii(r[0]));
        	$('#iden1').val(web3.toAscii(r[1]));
        	$('#addr1').val(r[2]);
       		
        	
        });
    });
/* 
    await web3.eth.getTransactionReceipt(hash2,function(e,r){
        web3.eth.getBlock(r['blockNumber'],function(e,s){
            //$('#view7').val("TimeStamp : "+s['timestamp']);
        });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
        $('#view8').val("tx Hash : "+r['transactionHash']);
        $('#view9').val("To : "+r['to']);
        $('#view10').val("From : "+r['from']);
        $('#view11').val("GasUsed : "+r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
        	$('#view87878').val("구분 : "+web3.toAscii(r[3])+"아이디 : "+web3.toAscii(r[4])+"주소 : "+r[5]);
        });
    });

    await web3.eth.getTransactionReceipt(hash3,function(e,r){
    	 web3.eth.getBlock(r['blockNumber'],function(e,s){
             $('#view12').val("TimeStamp : "+s['timestamp']);
         });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
        $('#view13').val("tx Hash : "+r['transactionHash']);
        $('#view14').val("To : "+r['to']);
        $('#view15').val("From : "+r['from']);
        $('#view16').val("GasUsed : "+r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
        	$('#view5858').val("완료여부 : "+web3.toAscii(r[6]));
        });
    });

 await web3.eth.getTransactionReceipt(hash4,function(e,r){
        web3.eth.getBlock(r['blockNumber'],function(e,s){
            $('#view157').val("TimeStamp : "+s['timestamp']);
        });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
        $('#view13').val("tx Hash : "+r['transactionHash']);
        $('#view14').val("To : "+r['to']);
        $('#view15').val("From : "+r['from']);
        $('#view16').val("GasUsed : "+r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
        	$('#view67').val("평점 정보 : "+r[7]);
        });
    });
 */ 
 console.log('끝');
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


<br/>
<form class="form-signin" method="post"
	action="Blockchain123.kosmo?${_csrf.parameterName}=${_csrf.token}"
	autocomplete="off">
	<div style='overflow: hidden;'>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input
			style='margin-left: 10%; float: left; height: 40px; width: 80%;'
			id='val' name="cp_no">
		<button type="submit" style='float: left; width: 50px;' id="submit"
			class="btn btn-info btn-sm">확인</button>
	</div>
</form>
<fieldset>
	<div class="invoice-box">
		<table cellpadding="0" cellspacing="0">
			<tr class="top">
				<td colspan="2">
					<table>
						<tr>
							<td class="title"><img
								src="https://www.sparksuite.com/images/logo.png"
								style="width: 100%; max-width: 300px;"></td>

							<td>Invoice #: 123<br> Created: January 1, 2015<br>
								Due: February 1, 2015
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr class="information">
				<td colspan="2">
					<table>
						<tr>
						<div>
							<td>구분<br> 아이디<br> 주소
							</td>

							<td><input type="text" id="division1" readonly /><br><input type="text" id="iden1" readonly /><br><input type="text" id="addr1" readonly />
							</td>
							</div>
						</tr>
					</table>
				</td>
			</tr>

			<tr class="heading">
				<td>TimeStamp</td>

				<td><input type="text" id="time1" value=""/></td>
			</tr>

			<tr class="details">
				<td>Tx Hash</td>

				<td><input type="text" id="tranhash1" value=""/></td>
			</tr>

			<tr class="heading">
				<td>Item</td>

				<td>Price</td>
			</tr>

			<tr class="item">
				<td>FROM</td>

				<td><input type="text" id="from1" value=""/></td>
			</tr>

			<tr class="item">
				<td>TO</td>

				<td><input type="text" id="to1" value=""/></td>
			</tr>

			<tr class="item last">
				<td>GAS</td>

				<td><input type="text" id="gas1" value=""/></td>
			</tr>

			<tr class="total">
				<td></td>

				<td></td>
			</tr>
		</table>
	</div>
</fieldset>
