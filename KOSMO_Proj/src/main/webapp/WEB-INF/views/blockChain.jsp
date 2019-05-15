<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp" %>
<sec:authentication property="principal.username" var="id"/>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='/baby/resources/aranblockchain.js'></script>
<style>

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

    message=web3.eth.contract(abi).at(contractAddress);
    //startApp();
});
$(function(){
	
	$('#submit').click(function(){
		console.log('클릭 클릭')
		var hashVar = $('#val').val();
		console.log(hashVar)
		let receipt=web3.eth.getTransactionReceipt(hashVar,function(e,r){
		    web3.eth.getBlock(r['blockNumber'],function(e,s){
		        console.log('timestamp : '+s['timestamp']);
		        view1 = s['timestamp'];
		        console.log(view1)
		        $('#view1').val(view1)
		        view2 = r['to'];
		        view3 = r['from'];
		        view4 = r['gasUsed'];
		        view5 = web3.toAscii(r['logs']);
		        //view6 = r['to'];
		        view7 = r['transactionHash'];
		        
		        $('#view2').val(view2)
		        $('#view3').val(view3)
		        $('#view4').val(view4)
		        $('#view5').val(view5)
		        $('#view6').val(view6)
		        $('#view7').val(view7)
		          
		        
		    });
		    	
		    console.log('to : '+r['to']);
		    console.log('from : '+r['from']);
		    console.log('gasUsed : '+r['gasUsed']);
		    console.log('logs : '+r['logs']);
		    //console.log('to : '+r['to']);
		    console.log('tx Hash : '+r['transactionHash']);
		    
		  
		  	console.log("111111:"+$('#view1').val("s['timestamp']"));
		  	$('#view1').val(view1)
		    
		});
	
		 
	
	});//클릭 이벤트 
	
});

</script>



<fieldset>
	<legend>블록체인 검증</legend>

<div style='overflow:hidden;'>
	<textarea  style='margin-left:10%;float:left;height:40px;width:80%;' id='val'></textarea>
	<input style='float:left;width:50px;' id="submit" class="btn btn-info btn-sm " value="확인" />
</div>
<h2>검증 내용 </h2>
<div class='center'>
	<div>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view1" class="control1" type="text" size="100" value='' />
	</div></br>
	<div>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view2" class="control2" type="text" size="100" name="" value='' readonly/>
	</div>
	<div>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view3" class="control3" type="text" size="100" name="" value='' readonly/>
	</div>
	<div>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view4" class="control4" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view5" class="control5" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view6" class="control6" type="text" size="100" name="" value=''  readonly/>
	</div>
	<div>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view7" class="control7" type="text" size="100" name="" value=''  readonly/>
	</div>


</div>


</fieldset>
