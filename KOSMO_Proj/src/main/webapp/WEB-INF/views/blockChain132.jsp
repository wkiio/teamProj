<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='/baby/resources/aranblockchain.js'></script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="id" />
</sec:authorize>

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
            $('#view1').val("TimeStamp : "+s['timestamp']);
        });
        console.log('tx Hash : '+r['transactionHash']);
        console.log('to : '+r['to']);
        console.log('from : '+r['from']);
        console.log('gasUsed : '+r['gasUsed']);
        $('#view2').val("tx Hash : "+r['transactionHash']);
        $('#view3').val("To : "+r['to']);
        $('#view4').val("From : "+r['from']);
        $('#view5').val("GasUsed : "+r['gasUsed']);
        message.getSign(${cp_no},function(e,r){
        	$('#view6').val("구분 : "+web3.toAscii(r[0])+"아이디 : "+web3.toAscii(r[1])+"주소 : "+r[2]);
        });
    });

    await web3.eth.getTransactionReceipt(hash2,function(e,r){
        web3.eth.getBlock(r['blockNumber'],function(e,s){
            $('#view7').val("TimeStamp : "+s['timestamp']);
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


	//});//윈도우
/* 	$(function(){
		$('#submit').click(function(){
		console.log('클릭 전');		
			
		var TimeStamp = "";
 */		//var hashVar ='${opened}';
	/* 	console.log("open",'${opened}');
		web3.eth.getTransactionReceipt(hashVar,function(e,r){
		    web3.eth.getBlock(r['blockNumber'],function(e,s){
		    TimeStamp = s['timestamp'];
		    	
		    });
		    $('#view1').val(TimeStamp);

		    console.log('tx Hash : '+r['transactionHash']);
		    console.log('to : '+r['to']);
		    console.log('from : '+r['from']);
		    console.log('gasUsed : '+r['gasUsed']);
		    console.log(hashVar);
			view2=r['transactionHash'];
		    //$('#view3').val(r['to']);
		    //$('#view4').val(r['from']);
		    //$('#view5').val(r['gasUsed']);
		
		});
	    

		console.log('${opened}');
		console.log('${signed}');
		hashVar ='${signed}';
		web3.eth.getTransactionReceipt(hashVar,function(e,r){
		    web3.eth.getBlock(r['blockNumber'],function(e,s){
		        console.log('timestamp : '+s['timestamp']);
		    $('#view1').val("TimeStamp : "+s['timestamp']);
		        
		    });
		});
		console.log('클릭 후');	
		}); //click 이벤트
	
		console.log(view2);
	});
 */		

 
</script>



<fieldset>



	<div class='center'>
		<legend> 전 세계 최초 육아 베팅</legend>
	</div>
	<form class="form-signin" method="post"
		action="Blockchain123.kosmo?${_csrf.parameterName}=${_csrf.token}"
		autocomplete="off">
		<div style='overflow: hidden;'>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> 
			<input
				style='margin-left: 10%; float: left; height: 40px; width: 80%;'
				id='val' name="cp_no">
			<button type="submit" style='float: left; width: 50px;' id="submit"
				class="btn btn-info btn-sm">확인</button>
		</div>
	</form>
	</br>
	<div class='center'>
		<h2>배당률 1.27X</h2>
	</div>
	</br>
	<div class='center'>
	
		<div class='show'>
			<input style='text-align: center; height: 35px; line-height: 35px;'
				id="view1" class="control1" type="text" size="100" value='' readonly />
		</div>
		<div class='show'>
			<input style='text-align: center; height: 35px; line-height: 35px;'
				id="view2" class="control2" type="text" size="100" name="" value=''
				readonly />
		</div>
		<div class='show'>
			<input style='text-align: center; height: 35px; line-height: 35px;'
				id="view3" class="control3" type="text" size="100" name="" value=''
				readonly />
		</div>
		<div class='show'>
			<input style='text-align: center; height: 35px; line-height: 35px;'
				id="view4" class="control4" type="text" size="100" name="" value=''
				readonly />
		</div>
		<div class='show'>
			<input style='text-align: center; height: 35px; line-height: 35px;'
				id="view5" class="control5" type="text" size="100" name="" value=''
				readonly />
		</div>
		<div class='show'>
			<input style='text-align: center; height: 35px; line-height: 35px;'
				id="view6" class="control6" type="text" size="100" name="" value=''
				readonly />
		</div>
		<div class='show'>
			<input style='text-align: center; height: 35px; line-height: 35px;'
				id="view7" class="control7" type="text" size="100" name="" value=''
				readonly />
		</div>
		</br> </br>
		<div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view1" class="control1" type="text" size="100" value='' />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view2" class="control2" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view3" class="control3" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view4" class="control4" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view5" class="control5" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view6" class="control6" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view7" class="control7" type="text" size="100" name="" value=''
					readonly />
			</div>
		</div>

		<div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view1" class="control1" type="text" size="100" value='' />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view2" class="control2" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view3" class="control3" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view4" class="control4" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view5" class="control5" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view6" class="control6" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view7" class="control7" type="text" size="100" name="" value=''
					readonly />
			</div>
		</div>

		<div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view1" class="control1" type="text" size="100" value='' />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view2" class="control2" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view3" class="control3" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view4" class="control4" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view5" class="control5" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view6" class="control6" type="text" size="100" name="" value=''
					readonly />
			</div>
			<div class='show'>
				<input style='text-align: center; height: 35px; line-height: 35px;'
					id="view7" class="control7" type="text" size="100" name="" value=''
					readonly />
			</div>
		</div>

	</div>


</fieldset>
