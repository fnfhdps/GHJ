<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- header&footer css -->
<link rel="stylesheet" href="/resources/css/fix.css">
<!-- qna form css -->
<link rel="stylesheet" href="/resources/css/cs_form.css">

<title>내입양글</title>
</head>

<body>
<div class="wrap">

  	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>
	
	<section class="css-6vucnj ew8njf63">
	  <div class="css-1h7izmk ew8njf62">
	    <p class="css-1afs6cq ew8njf61">1:1 문의하기</p>
	    <p class="css-zce699 ew8njf60">상품/배송 등 쇼핑 관련 문의는<a href="#">고객센터</a>에서 요청해주세요.</p>
	  </div>
	  <div class="css-mieii2 e1yarwt10">
	    <form id="qna_form" action="/mypage/qna/new" method="post">
	 	  <!-- 시퀀스 -->
          <input type="hidden" name="boardCategory" value="QNA">
          <input type="hidden" name="userSeq" value="${login.userSeq}">
	    
	      <div class="css-lkffw3 e1yarwt9">
	        <div width="343" class="css-1v6bcwv e1yarwt7">
	          <div class="_3Bt8k">
	            <select class="_3ASDR _1qwAY _3K8Q8 css-1dwz3w6 e3x1g180" id="board_subCategory" name="boardSubCategory">
	              <option value="" selected>-- 문의 유형 --</option>
	              <option value="회원정보 문의">회원정보 문의</option>
	              <option value="주문/결제 관련 문의">주문/결제 관련 문의</option>
	              <option value="배송 관련 문의">배송 관련 문의</option>
	              <option value="서비스 개선 제안">서비스 개선 제안</option>
	              <option value="시스템 오류 제보">시스템 오류 제보</option>
	              <option value="불편 신고">불편 신고</option>
	              <option value="기타문의">기타문의</option>
	            </select>
	            <svg width="1em" height="1em" viewBox="0 0 10 10" fill="currentColor" class="IgBXR">
	              <path d="M0 3l5 5 5-5z"></path>
	            </svg>
	          </div>
	        </div>
	      </div>
	      <div class="css-lkffw3 e1yarwt9">
	        <div width="343" class="css-1v6bcwv e1yarwt7">
	          <input class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" value="${login.userName}" readonly="readonly">
	        </div>
	      </div>
	      <div class="css-lkffw3 e1yarwt9">
	        <div width="343" class="css-1v6bcwv e1yarwt7">
	          <input class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" value="${login.userEmail}" readonly="readonly">
	        </div>
	      </div>
	      <div class="css-lkffw3 e1yarwt9">
	        <input class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" id="board_title" value="${qnaDetail.boardTitle}" name="boardTitle" placeholder="제목">
	      </div>
	      <div class="css-lkffw3 e1yarwt9">
	        <textarea class="_3ASDR _1qwAY css-1xrt6sk e1rxfajn1"
        			id="board_content"
        			name="boardContent"
        			maxlength="500"
        			placeholder="문의 내용"
        			rows="1"
        			style="overflow: hidden;
        			overflow-wrap: break-word;
        			height: 160px;">
        			${qnaDetail.boardContent}
	        </textarea>
	      </div>
	      <!-- <div class="css-lkffw3 e1yarwt9">
	        <label class="css-6lgku7 e12vmj862">
	          <span class="css-h26ndt e12vmj861">
	            <span>nav_logo2.png</span>
	          </span>
	          <span class="css-94jutt e12vmj860">첨부파일</span>
	          <input type="file" name="file" hidden="">
	        </label>
	      </div> -->
	      <div class="css-1bkpu5b e1yarwt5">
	        <button class="_1eWD8 _3SroY _27do9 css-1pz165y e1yarwt0" id="qna_submit" type="button">저장</button>
	      </div>
	    </form>
	  </div>
	</section>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>
</div>

<script type="text/javascript">
	// 공백 체크
	$("#qna_submit").click(function() {
		if($("#board_subCategory").val() == ''){
			alert("유형을 선택해주세요.");
		}else if($("#board_title").val() == ''){
			alert("제목을 입력해주세요.");
		}else if($("#board_content").val() == 0){
			alert("내용을 입력해주세요.");
		}else {
			$("#qna_form").submit();
		}
	});
</script>
</body>
</html>