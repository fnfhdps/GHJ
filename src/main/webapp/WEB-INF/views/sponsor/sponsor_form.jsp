<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 후원 상품 상세 css -->
<link rel="stylesheet" href="/resources/css/sponsor_form.css">
<title>후원하기</title>
</head>

<body>
<div class="wrap">
	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>
	
	<section class="container-xxl py-5">
		<div>
		    <h2 class="sponsor_title">굿즈 구매하기</h2>
		</div>
		<div class="row p-5 justify-content-md-center">
		 	<img class="col-12 pb-5 mb-5" src="/resources/image/sponsor/sponsor_content.png">	
			<img class="col-8 mb-4" style="text-align: center; border-radius: 7%;" src="/resources/image/sponsor/${sponsorItem.sponsorItemImg}">
		</div>

		<div class="d-flex justify-content-center py-4">
			<form id="sponsor_form" action="/sponsor/insert" method="post">
				<!-- 시퀀스들 -->
				<input type="hidden" id="userSeq" name="userSeq" value="${login.userSeq}">
				<input type="hidden" id="sponsorItemSeq" name="sponsorItemSeq" value="${sponsorItem.sponsorItemSeq}">
				<!-- 결제 방법 이거 테스트용이라 결과 값이 안받아짐-->
				<input type="hidden" name="payment" value="카카오페이">
				
				<article class="row pt-5 justify-content-md-center">
					<div class="py-3 col-10">
						<p class="sponsor_info" id="itemName">${sponsorItem.sponsorItemName}</p>
					</div>
					
					<div class="mb-3 col-10 d-flex">
						<label class="col-7 my-1">수량</label>
						<input class="sponsor-input form-control"
								id="amount"
								name="sponsorAmount"
								type="number"
								min="1"
								max="100"
								value="1">
					</div>
					<div class="mb-3 col-10 d-flex" id="totalPrice">
						<label class="col-7 my-1">총 구매가격</label>
						<input type="hidden" id="price" value="${sponsorItem.sponsorItemPrice}">
						<input class="form-control"
								type="text"
								id="total"
								name="sponsorTotalPrice"
								value="${sponsorItem.sponsorItemPrice}"
								readonly="readonly">
					</div>
				</article>
				
				<article class="py-5">
					<div class="row justify-content-md-center">
						<p class="col-10 sponsor_info">주문자 정보</p>
					</div>
					<div class="row justify-content-md-center">
					
						<div class="mb-3 col-10">
							<p>이름</p>
							<p class="sponsor_from_title pb-2">${login.userName}</p>
						</div>
						<div class="mb-3 col-10">
							<p>휴대폰번호</p>
							<p class="sponsor_from_title pb-2">${login.userPhone}</p>
						</div>
						<div class="mb-3 col-10">
							<p>이메일</p>
							<p class="sponsor_from_title pb-2">${login.userEmail}</p>
						</div>

					</div>
				</article>
				
				<article class="pb-5">
					<div class="row justify-content-md-center">
						<p class="col-10 sponsor_info">배송지 정보</p>
					</div>
					<div class="row justify-content-md-center">

						
						<div class="mb-3 col-10">
							<label class="form-label">이름</label>
							<input class="form-control"
								 	type="text"
								 	id="sponsorName"
								 	name="sponsorName"
								 	value="${login.userName}">
						</div>
						<div class="mb-3 col-10">
							<label class="form-label">휴대폰번호</label> 
							<input class="form-control"
									type="text"
									maxlength="13"
									id="sponsorPhone"
									name="sponsorPhone"
									oninput="autoHyphen(this)"
									value="${login.userPhone}">
						</div>
						
						<!-- 주소 합쳐서 저장하기 -->
						<input type="hidden" id="addrTotal" name="sponsorShippingAddr">
						<div class="mb-3 col-10">
							<div class="row">
								<div class="col-xs-4 col-sm-6">
									<label class="form-label">주소</label> 
									<input class="form-control"
											type="text"
											id="addr1"
											placeholder="우편번호"
											value="${login.userAddr1}"
											readonly="readonly"
											required="required">					
								</div>
								<div class="col-xs-4 col-sm-6">
									<label class="form-label" style="visibility: hidden;">빈공간</label>
									<input class="form-control btn btn-outline-dark"
											type="button"
											value="우편번호 찾기"
											onclick="excution_addr()">					
								</div>
							</div>
						</div>
						<div class="mb-3 col-10">
							<div class="row">
								<div class="col-xs-4 col-sm-6">
									<input class="form-control"
											type="text"
											id="addr2"
											placeholder="주소"
											value="${login.userAddr2}"
											readonly="readonly"
											required="required">					
								</div>
								<div class="col-xs-4 col-sm-6">
									<input class="form-control"
											type="text"
											id="addr3"
											placeholder="상세주소"
											value="${login.userAddr3}"
											readonly="readonly"
											required="required">					
								</div>
							</div>
						</div>
	
						<div class="mb-3 col-10">
							<label class="form-label">배송 메모</label> 
							<input class="form-control"
									type="text"
									id="memo"
									name="memo">
						</div>
						
						<div class="mb-5 col-10">
							<input type="checkbox" class="form-check-input">
							<label class="form-check-label" for="exampleCheck1">구매정보 확인했습니다.</label>
						</div>
						<div class=" col-10">
							<button type="button" class="btn btn-outline-dark col-12" id="form_btn"  onclick="requestPay(); return false;">결제하기</button>
						</div>
					</div>
				</article>
				
			</form>
		</div>
	</section>
	
	<jsp:include page="../fix/footer.jsp"></jsp:include>
</div>

<script type="text/javascript">

// 상품 총 가격
$("#amount").click(function() {
	let amount = $("#amount").val();
	const price = $("#price").val();
	let total = amount * price;
	$("#total").val(total);
	//alert(total);
});

// 주소 합치기
let addrTotal = "";
$("#form_btn").click(function () {
	let addr1 = $("#addr1").val();
	let addr2 = $("#addr2").val();
	let addr3 = $("#addr3").val();
	addrTotal = "(" + addr1 + ") " + addr2 + " " + addr3;
	$("#addrTotal").val(addrTotal);
});

//휴대폰 번호 패턴
const autoHyphen = function(target) {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}

</script>

<!-- 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 js -->
<script src="/resources/js/addr.js"></script>

<!-- iamport.payment api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 아임포트 KG이니시스 js -->
<script src="/resources/js/payment.js"></script>
</body>
</html>