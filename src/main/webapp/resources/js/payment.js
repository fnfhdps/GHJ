/**
 * 아임포트 KG이니시스 결제 js
 */



const postcode = $("#addr1").val();

//const { IMP } = window;
IMP.init('imp28253632');
function requestPay() {
	if(!($('input[type="checkbox"]').is(':checked'))){
		alert("약관에 동의해주세요");
		return;
	}
	else {
		const itemName = $("#itemName").text();

		const userSeq = $("#userSeq").val();
		const sponsorItemSeq = $("#sponsorItemSeq").val();
		let sponsorAmount = $("#amount").val();
		let sponsorTotalPrice = $("#total").val();
		let sponsorShippingAddr = $("#addrTotal").val();
		const sponsorName = $("#sponsorName").val();
		const sponsorPhone = $("#sponsorPhone").val();
		const payment = 'kakao';
		const memo = $("#memo").val();
		alert("주소: "+sponsorShippingAddr)
		alert(itemName+sponsorTotalPrice);
		
		IMP.request_pay({
		      pg: 'html5_inicis',
		      pay_method: "card",
		      merchant_uid : 'merchant_'+new Date().getTime(),
		      name : itemName,
		      amount : sponsorTotalPrice,
		      buyer_email : 'iamport@siot.do',
		      buyer_name : sponsorName,
		      buyer_tel : sponsorPhone,
		      buyer_addr : sponsorShippingAddr,
		      buyer_postcode : postcode
		    }, function (rsp) {

		        if (rsp.success) {
		        	alert('결제가 완료되었습니다.');
		        	alert('주소:'+sponsorShippingAddr);
//		        	sponsorAjax();

		        } else {
		          let msg = '결제에 실패하였습니다.';
		          msg += rsp.error_msg;
		          alert(msg);
		        }
		});
	}
};

function sponsorAjax() {
	const data = {
			"userSeq" : userSeq,
			"sponsorItemSeq" : sponsorItemSeq,
			"sponsorAmount" : sponsorAmount,
			"sponsorTotalPrice" : sponsorTotalPrice,
			"sponsorShippingAddr" : sponsorShippingAddr,
			"sponsorName" : sponsorName,
			"sponsorPhone" : sponsorPhone,
			"payment" : payment,
			"memo" : memo
	}
	
    $.ajax({
        url : "/sponsor/insert",
        type :'post',
        data : JSON.stringify(data),
        dataType : "json",
        contentType : "application/json",
        success : function(result){
            if(result == 0){
            	alert("성공")
            	window.location.href = "/sponsor/list";
            } else {
            	alert("실패");
            	return;
            }
        },
        error : function(errorThrown){
         alert(errorThrown.statusText);
      }
     });
}