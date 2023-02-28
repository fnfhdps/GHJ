/**
 * 아임포트 KG이니시스 결제 js
 */

//const { IMP } = window;
IMP.init('imp28253632');
function requestPay() {
	
	if(!($('input[type="checkbox"]').is(':checked'))){
		alert("약관에 동의해주세요");
		return;
	}
	else {
		const itemName = $("#itemName").text();
		let sponsorTotalPrice = $("#total").val();
		
		IMP.request_pay({
		      pg: 'html5_inicis',
		      pay_method: "card",
		      merchant_uid : 'merchant_'+new Date().getTime(),
		      name : itemName,
		      amount : sponsorTotalPrice,
		      buyer_email : 'iamport@siot.do',
		      buyer_name : '고길동',
		      buyer_tel : '010-1234-5678',
		      buyer_addr : '서울시 강남구',
		      buyer_postcode : '123-456'
		    }, function (rsp) {
		    	
		        if (rsp.success) {
		        	alert('결제가 완료되었습니다.');
		        	$("#sponsor_form").submit();
		        } else {
		          let msg = '결제에 실패하였습니다.';
		          msg += rsp.error_msg;
		          alert(msg);
		        }
		});
	}
};

