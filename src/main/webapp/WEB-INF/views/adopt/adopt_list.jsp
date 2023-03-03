<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 입양 목록 css -->
<link rel="stylesheet" href="/resources/css/adopt_list.css">
<title>입양 목록 조회</title>
</head>

<body>
<div class="wrap">

	<jsp:include page="../fix/header.jsp"></jsp:include>
	
	  <section class="hero">
	    <div class="hero-inner">
	      <form role="search" class="search search-full">
	        <input type="search"
	        		name="keyword"
	        		id="query"
	        		placeholder="검색"
	        		autocomplete="off"
	        		aria-label="검색"
	        		value="${pageMaker.cri.keyword}">
	      </form>
	    </div>
	  </section>
	
	<section class="container-xxl px-4 px-lg-5">
		<div class="search_wrap adopt_list_interface" style="vertical-align:middle; text-align:middle;">
	       	<div class="container px-4 px-lg-5 mt-5">
				<input class="form-check-input mx-2 p-3" type="checkbox" id="flexCheckDefault" style="float:left;" name="keyword2" value="WAIT">
				<label class="form-check-label my-2" for="flexCheckDefault">입양대기만 보이기</label>
				
		       <select class="form-select" id="address-search" name="keyword3" aria-label="Default select example" style="float:right; margin-left:10px; width:30%" value="${pageMaker.cri.keyword3 }">
					<option value="" selected>지역을 선택하세요</option>
					<option value="수도권">수도권</option>
					<option value="강원권">강원권</option>
					<option value="충청권">충청권</option>
					<option value="전라권">전라권</option>
					<option value="경상권">경상권</option>
					<option value="제주권">제주권</option>
			   </select>
			</div>
	   	</div>   
		
	    <div class="container px-4 px-lg-5 mt-5">
	        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	            <c:forEach items="${list}" var="list">
	            <div class="col mb-5" >
	                <div class="card h-100">
		                <c:choose>
		                  <c:when test="${list.adoptState eq 'WAIT'}">
			                <div class="badge bg-dark text-white position-absolute" style="top: 0.6rem; right: 0.6rem">입양대기</div>
		                  </c:when>
		                  <c:otherwise>
		                  	<div class="badge bg-danger text-white position-absolute" style="top: 0.6rem; right: 0.6rem">입양완료</div>
		                  </c:otherwise>
		                </c:choose>
	                    <a class="loginCheck" href="/adopt/detail/${list.boardCategory}/${list.boardSeq}/${login.userSeq}">
	                    	<img class="card-img-top"
	                    		style="height: 250px;overflow: hidden;object-fit: cover;"
	                    		alt="${list.boardTitle}"
	                    		src="/resources/image/adopt/${list.adoptImg}">
	                    </a>
	                    <div class="card-body">
							<div class="">
								<div class="fw-normal pb-2">${list.boardTitle}</div>
								<c:choose>
									<c:when test="${list.adoptKind eq 'DOG'}">
										<small>강아지</small>
									</c:when>
									<c:when test="${list.adoptKind eq 'CAT'}">
										<small>고양이</small>
									</c:when>
									<c:otherwise>
										<small>${list.adoptKind}</small>
									</c:otherwise>
								</c:choose>
								<small> / ${list.adoptAddr}</small>
							</div>
						</div>
	                </div>
	            </div>
	            </c:forEach>

	        </div>
	    </div>
	    
	    <div>
		    <div class="container px-4 px-lg-5 mt-1 text-end">
				<a href="/adopt/new" style="width:150px; height:40px;" class="btn btn-outline-dark pt-2">글쓰기</a>
			</div>
		     
		    <div class="pageInfo_wrap" >
	        	<div class="pageInfo_area">
	        		<ul id="pageInfo" class="pageInfo">
		                <!-- 이전페이지 버튼 -->
		                <c:if test="${pageMaker.prev}">
		                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
		                </c:if>
		        		<!-- 각 번호 페이지 버튼 -->
		                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
		                </c:forEach>
		                <!-- 다음페이지 버튼 -->
		                <c:if test="${pageMaker.next}">
		                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
		                </c:if>    
	        		</ul>
	        	</div>
	    	</div>
    	</div>
    	
	</section>	
	
    <jsp:include page="../fix/footer.jsp"></jsp:include>

	<form id="moveForm" method="get" action="/adopt/list">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">			<!-- 제목 검색 keyword -->
        <input type="hidden" id="keyword2" name="keyword2" value="${pageMaker.cri.keyword2}">		<!-- 상태 검색 keyword -->
        <input type="hidden" id="keyword3" name="keyword3" value="${pageMaker.cri.keyword3}">		<!-- 주소 검색 keyword -->
        
	</form>
	<input type="hidden" id="userSeq" value="${login.userSeq}">
</div>

<script>
let moveForm = $("#moveForm");

/* $(".move").on("click", function(e){
	e.preventDefault();
	moveForm.append("<input type='hidden' name='boardSeq' value='"+$(this).attr("href")+ "'>");
	moveForm.attr("action", "/adopt/get");
	moveForm.submit();
}); */

$(".pageInfo a").on("click", function(e){
       e.preventDefault();
       moveForm.find("input[name='pageNum']").val($(this).attr("href"));
       moveForm.attr("action", "/adopt/list");
       moveForm.submit();
   });

// 검색 js
$("input[type='search']").on("keyup", function(e){
    // 엔터키 눌렀을 때 이벤트 실행
	if(key.keyCode==13) {
       e.preventDefault();
       let val = $("input[name='keyword']").val();
       alert(val);
       moveForm.find("#keyword").val(val);
       
       alert($("#keyword").val());
       moveForm.find("input[name='pageNum']").val(1);
       moveForm.submit();
    }
   });

$("#address-search").on("change", function(e){
	let val = $(this).val();
    moveForm.find("input[name='keyword3']").val(val);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.submit();
   });

// 로그인 체크후 게시글 상세 이동
const loginCkeck2 = $("#userSeq").val();
$("a.loginCheck").click(function () {
	if (loginCkeck2 == 0) {
		alert("로그인 후 열람 가능");
		return false;
	}
});

$("input:checkbox").click(function(e) {
	if($(this).is(":checked")){
	   let val = $("input[name='keyword2']").val();
       moveForm.find("input[name='keyword2']").val(val);
       moveForm.find("input[name='pageNum']").val(1);
       moveForm.submit();
	}else {
	}
});
if($("#keyword2").val()=="WAIT"){
	$("input:checkbox").prop("checked", true);
}

const keyword3 = $("#keyword3").val();
if(keyword3 == "수도권"){
	$('#address-search').val('수도권').prop("selected",true);
}else if(keyword3 == "강원권"){
	$('#address-search').val('강원권').prop("selected",true);
}else if(keyword3 == "충청권"){
	$('#address-search').val('충청권').prop("selected",true);
}else if(keyword3 == "전라권"){
	$('#address-search').val('전라권').prop("selected",true);
}else if(keyword3 == "경상권"){
	$('#address-search').val('경상권').prop("selected",true);
}else if(keyword3 == "제주권"){
	$('#address-search').val('제주권').prop("selected",true);
}


</script>
</body>

</html>