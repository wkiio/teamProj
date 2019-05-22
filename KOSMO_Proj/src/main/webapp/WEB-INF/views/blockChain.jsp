<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='/baby/resources/aranblockchain.js'></script>
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="id" />
</sec:authorize>


<style>
.show {
	margin-bottom: 5px;

}
.center {
			text-align: center; 	
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

  
    //startApp();
});

	
	//});//윈도우
	$(function(){
		$('#submit').click(async function(){
		console.log('클릭 전');		
		 var message=web3.eth.contract(abi).at(contractAddress);
			
		var hashVar ='${opened}';
		var cp_noo = '${cp_no}';
		console.log("open",'${opened}');
		let receipt=await web3.eth.getTransactionReceipt(hashVar,function(){
		    web3.eth.getBlock(r['blockNumber'],function(e,s){
		    $('#view1').val("TimeStamp : "+s['timestamp']);
		    });

		    console.log('tx Hash : '+r['transactionHash']);
		    console.log('to : '+r['to']);
		    console.log('from : '+r['from']);
		    console.log('gasUsed : '+r['gasUsed']);
		    console.log(hashVar);
			view2=r['transactionHash'];
		
		});
	    
	    $('#view3').val("To : "+r['to']);
	    $('#view4').val("From : "+r['from']);
	    $('#view5').val("GasUsed : "+r['gasUsed']);
		console.log('${opened}');
		console.log('${signed}');
		hashVar ='${signed}';
		receipt=web3.eth.getTransactionReceipt(hashVar,function(e,r){
		    web3.eth.getBlock(r['blockNumber'],function(e,s){
		        console.log('timestamp : '+s['timestamp']);
		    $('#view7').val("TimeStamp : "+s['timestamp']);
		        
		    });
		    $('#view8').val("TransactionHash : "+r['transactionHash']);
		    $('#view9').val("To : "+r['to']);
		    $('#view10').val("From : "+r['from']);
		    $('#view11').val("GasUsed : "+r['gasUsed']);
		});
		
		console.log('클릭 후');	
		}); 
		//click 이벤트
		//$('#view2').val(view2);
		console.log(view2);
		message.getSign(cp_noo,function(e,r){
			console.log(web3.toAscii(r));
		});
	});
	
</script>



<fieldset>



<div class='center'>
	<legend> 전 세계 최초 육아 베팅</legend>
</div>
	<form class="form-signin" method="post" action="Blockchain123.kosmo?${_csrf.parameterName}=${_csrf.token}" autocomplete="off">
		<div style='overflow: hidden;'>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input style='margin-left:10%;float:left;height:40px;width:80%;' id='val' name="cp_no">
			<button type="submit" style='float:left;width:50px;' id="submit" class="btn btn-info btn-sm">확인</button>
			${opened } , ${signed }, ${done }, ${reviewed }
		</div>
	</form>
	</br>
<div class='center'>
<h2> 배당률 1.27X </h2>
</div>
</br>
<div class='center' >
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view1" class="control1" type="text" size="100" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view2" class="control2" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view3" class="control3" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view4" class="control4" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view5" class="control5" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view6" class="control6" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view7" class="control7" type="text" size="100" name="" value=''  readonly/>
	</div>
</br>
</br>
<div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view1" class="control1" type="text" size="100" value='' />
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view2" class="control2" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view3" class="control3" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view4" class="control4" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view5" class="control5" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view6" class="control6" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view7" class="control7" type="text" size="100" name="" value=''  readonly/>
	</div>
</div>

<div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view1" class="control1" type="text" size="100" value='' />
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view2" class="control2" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view3" class="control3" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view4" class="control4" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view5" class="control5" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view6" class="control6" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view7" class="control7" type="text" size="100" name="" value=''  readonly/>
	</div>
</div>

<div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view1" class="control1" type="text" size="100" value='' />
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view2" class="control2" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view3" class="control3" type="text" size="100" name="" value='' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view4" class="control4" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view5" class="control5" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view6" class="control6" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view7" class="control7" type="text" size="100" name="" value=''  readonly/>
	</div>
</div>

</div>


</fieldset>
