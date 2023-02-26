<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- header&footer css -->
<link rel="stylesheet" href="/resources/css/fix.css">
<style type="text/css">

.sponsor_title {
	font-size: 22px bold;
	/* border-top: 1px solid black; */
	border-bottom: 1px solid black;
	padding: 2.4rem;
	margin-bottom: 1.5rem;
}
.sponsor_border{
	border-bottom: 1px solid black;
	padding: 2.4rem;
	
}
.sponsor-input{
	flex: 1 0 0;
}

p {
	font-size: 17px;
}

.text-end {
  text-align: right !important;
}
</style>
<title>후원하기</title>
</head>
<body>
<!--
여러 상품 등록시 선택한 상품 정보 입력되도록
저장된 전화번호가 없으면 회원 정보에서 수정하도록 만들기
입력 이후
-->
<div class="wrap">
	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>
	
	<section class="container py-5">
		<div>
		    <h2 class="sponsor_title">굿즈 구매하기</h2>
		</div>
		<div class="row sponsor_border">
		 	<img class="col-12" src="/resources/image/sponsor/sponsor_content.png">	
			<img class="col-12" src="/resources/image/sponsor/${sponsorItem.sponsorItemImg}">
			<div>			
				<p id="itemName">${sponsorItem.sponsorItemName}</p><br>
				${sponsorItem.sponsorItemPrice}원
			</div>
		</div>
		
		<form id="sponsor_form">
			<article class="row py-5 justify-content-md-center">
				<div class="mb-3 col-5 d-flex">
					<label class="col-2 my-1">수량</label>
					<input class="sponsor-input form-control"
							id="amount"
							type="number"
							min="1"
							max="100"
							value="1">
				</div>
				<div class="mb-3 col-5 d-flex" id="totalPrice">
					<label class="col-2 my-1">총 구매가격</label>
					<input type="hidden" id="price" value="${sponsorItem.sponsorItemPrice}">
					<input class="form-control"
							type="text"
							id="total"
							value="${sponsorItem.sponsorItemPrice}"
							readonly="readonly">
				</div>
			</article>
			
			<article class="py-5">
				<div class="row justify-content-md-center">
					<p class="col-10">주문자 정보</p>
				</div>
				<div class="row justify-content-md-center">
					<div class="mb-3 col-10 d-flex">
						<label class="col-2 my-1">이름</label>
						<input class="sponsor-input form-control"
							 	type="text"
								value="${login.userName}">
					</div>
					<div class="mb-3 col-10 d-flex">
						<label class="col-2 my-1">휴대폰번호</label>
						<input class="sponsor-input form-control"
							 	type="text"
								value="${login.userPhone}"
								readonly="readonly">
					</div>
					<div class="mb-3 col-10 d-flex">
						<label class="col-2 my-1">이메일</label>
						<input class="sponsor-input form-control"
							 	type="text"
								value="${login.userEmail}"
								readonly="readonly">
					</div>
				</div>
			</article>
			
			<article class="pb-5">
				<div class="row justify-content-md-center">
					<p class="col-10">배송지 정보</p>
				</div>
				<div class="row justify-content-md-center">
					
					<!-- 시퀀스들 -->
					<input type="hidden" id="userSeq" value="${login.userSeq}">
					<input type="hidden" id="sponsorItemSeq" value="${sponsorItem.sponsorItemSeq}">
					<div class="mb-3 col-10">
						<label class="form-label">이름</label>
						<input class="form-control"
							 	type="text"
							 	id="sponsorName">
					</div>
					<div class="mb-3 col-10">
						<label class="form-label">전화번호</label> 
						<input class="form-control"
								type="text"
								id="sponsorPhone">
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
								<input class="form-control btn btn-warning"
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
								id="memo">
					</div>
					
					<div class="mb-3 col-10">
						<input type="checkbox" class="form-check-input">
						<label class="form-check-label" for="exampleCheck1">구매정보 확인했습니다.</label>
					</div>
					<div class="mb-3 col-10">
					</div>
						<button type="button" class="btn btn-warning col-10" id="form_btn"  onclick="requestPay(); return false;">결제하기</button>
					<div class="mb-3 col-10">
					</div>
				</div>
			</article>
		</form>
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
$(function () {
	let addr1 = $("#addr1").val();
	let addr2 = $("#addr2").val();
	let addr3 = $("#addr3").val();
	const addrTotal = "(" + addr1 + ") " + addr2 + " " + addr3;
	$("#addrTotal").val(addrTotal);	
});



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