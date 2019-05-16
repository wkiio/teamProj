<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/template/isMember.jsp" %>
<sec:authentication property="principal.username" var="id"/>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='/baby/resources/aranblockchain.js'></script>
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

    message=web3.eth.contract(abi).at(contractAddress);
    //startApp();
});
$(function(){

	
	});//클릭 이});

</script>



<fieldset>
<div class='center'>
	<legend> 전 세계 최초 육아 베팅</legend>
</div>
<div style='overflow:hidden;'>
	<textarea  style='margin-left:10%;float:left;height:40px;width:80%;' id='val'></textarea>
	<input style='float:left;width:50px;' id="submit" class="btn btn-info btn-sm " value="확인" />
</div>
</br>
<div class='center'>
<h2> 배당률 1.27X </h2>
</div>
</br>
<div class='center' >
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view1" class="control1" type="text" size="100" value='100코인' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'  id="view2" class="control2" type="text" size="100" name="" value='200코인' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view3" class="control3" type="text" size="100" name="" value='300코인' readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view4" class="control4" type="text" size="100" name="" value='400코인'  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view5" class="control5" type="text" size="100" name="" value='500코인'  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view6" class="control6" type="text" size="100" name="" value='600코인'  readonly/>
	</div>
	<div class='show'>
	<input style='text-align:center;height:35px;line-height:35px;'   id="view7" class="control7" type="text" size="100" name="" value='700코인'  readonly/>
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
