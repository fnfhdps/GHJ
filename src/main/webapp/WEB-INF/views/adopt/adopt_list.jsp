<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>입양 목록 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
 .adopt_img{
 	width: 40px;
 	height: 40px;
 }
 
 .pageInfo{
	list-style : none;
	display: inline-block;
	margin: 50px 0 0 100px;      
 }
 .pageInfo li{
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
 }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
 
 .active{
	background-color: #cdd5ec;
 }
  
 .search_area{
	display: inline-block;
	margin-top: 30px;
	margin-left: 260px;
 }
 .search_area input{
	height: 30px;
	width: 250px;
 }
 .search_area button{
	width: 100px;
	height: 36px;
 }
 
 .adoptSize{
 	width: 70px;
 }
 
 #gnb-root ._1knjz49b {
    line-height: 1.4;
    font-size: 1.4rem;
    background-color: var(--seed-scale-color-gray-100);
    box-sizing: border-box;
    height: 4rem;
    padding: 0.9rem 1.2rem;
    border: none;
    border-radius: 0.6rem;
    width: 100%;
    color: var(--seed-scale-color-gray-900);
}

	.search_wrap, .pageInfo_wrap {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
</style>
<body>

	
<div class="wrap">

	<jsp:include page="../fix/header.jsp"></jsp:include>
	
	
	
	
	
	<section class="py-5">
		
	
		<hr>
		<div class="search_wrap adopt_list_interface" style="vertical-align:middle; text-align:middle;">
	       	<div class="search_area">
	       		<input type="text" style="vertical-align:middle; text-align:middle;" class="_1knjz49b" name="keyword" placeholder="검색할 제목을 입력해주세요" value="${pageMaker.cri.keyword }">
	            <button type="button" style="vertical-align:middle; text-align:middle;" class="btn btn-dark">검색</button>
	       	</div>
	   	</div>   
	
	    <div class="container px-4 px-lg-5 mt-5">
	        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	        
	        
	            
	            <c:forEach items="${list}" var="list">
	            <div class="col mb-5">
	                <div class="card h-100">
	                <c:choose>
	                  <c:when test="${list.adoptState eq 'WAIT'}">
		                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양대기</div>
	                  </c:when>
	                  <c:otherwise>
	                  	<div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양완료</div>
	                  </c:otherwise>
	                </c:choose>
	                
	                    <a class="loginCheck" href="/adopt/detail/${list.boardCategory}/${list.boardSeq}/${login.userSeq}">
	                    	<img class="card-img-top" alt="" src="/resources/image/adopt/${list.adoptImg}">
	                    </a>
	                    <div class="card-body p-4">
													
								<div class="text-center">
									<h5 class="fw-bolder">${list.boardTitle}</h5>
									<p>${list.adoptKind}</p>
									<p>${list.adoptAddr}</p>
									<a href="#" class="btn btn-outline-dark">입양하기</a>
								</div>
						</div>
	                    
	                </div>
	            </div>
	            </c:forEach>

	        </div>
	        
	    </div>
	    <div>
	    
		    <div class="text-center">
				<button type="button" style="width:200px; height:50px;" class="btn btn-secondary"><a href="/adopt/new" style="color:white;">글쓰기</a></button>
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
	
	<form id="moveForm" method="get">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
	
	<input type="hidden" id="userSeq" value="${login.userSeq}">
	
	<script>
	
	let moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){
		e.preventDefault();
		moveForm.append("<input type='hidden' name='boardSeq' value='"+$(this).attr("href")+ "'>");
		moveForm.attr("action", "/adopt/get");
		moveForm.submit();
	});
	
	$(".pageInfo a").on("click", function(e){
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/adopt/list");
        moveForm.submit();
    });
	
	$(".search_area button").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        moveForm.find("input[name='keyword']").val(val);
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
	</script>

	<%-- <jsp:include page="../fix/footer.jsp"></jsp:include> --%>
	
</div>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>