<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>입양 목록 조회</title>
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
</style>
<body>

<div class="wrap">

	<jsp:include page="../fix/header.jsp"></jsp:include>
	
	<section class="py-5">
		<div>
			<button type="button" class="btn btn-secondary"><a href="/adopt/new">글쓰기</a></button>
		</div>
	
	    <div class="container px-4 px-lg-5 mt-5">
	        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	           
	            <%-- <c:forEach items="${adoptList}" var="adopt">
	            <div class="col mb-5">
	                <div class="card h-100">
	                <c:choose>
	                  <c:when test="${adopt.adoptState eq 'WAIT'}">
		                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양대기</div>
	                  </c:when>
	                  <c:otherwise>
	                  	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양완료</div>
	                  </c:otherwise>
	                </c:choose>
	                    <a href="/adopt/detail/${adopt.boardCategory}/${adopt.boardSeq}/${login.userSeq}">
	                    	<img class="card-img-top adopt_img" alt="" src="${adopt.adoptImg}">
	                    </a>
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <h5 class="fw-bolder">${adopt.adoptKind}</h5>
	                            ${adopt.adoptAddr}	
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">후원하기</a></div>
	                    </div>
	                </div>
	            </div>
	            </c:forEach> --%>
	            
	            <c:forEach items="${list}" var="list">
	            <div class="col mb-5">
	                <div class="card h-100">
	                <c:choose>
	                  <c:when test="${list.adoptState eq 'WAIT'}">
		                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양대기</div>
	                  </c:when>
	                  <c:otherwise>
	                  	<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양완료</div>
	                  </c:otherwise>
	                </c:choose>
	                    <a href="/adopt/detail/${list.boardCategory}/${list.boardSeq}/${login.userSeq}">
	                    	<img class="card-img-top adopt_img" alt="" src="${list.adoptImg}">
	                    </a>
	                    <div class="card-body p-4">
	                        <div class="text-center">
	                            <h5 class="fw-bolder">${list.adoptKind}</h5>
	                            ${list.adoptAddr}
	                        </div>
	                    </div>
	                    <!-- Product actions-->
	                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">후원하기</a></div>
	                    </div>
	                </div>
	            </div>
	            </c:forEach>

	        </div>
	        
	    </div>
	    
	    <div class="pageInfo_wrap" >
        	<div class="pageInfo_area">
        		<ul id="pageInfo" class="pageInfo">
        		
	                
	        		<!-- 각 번호 페이지 버튼 -->
	                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
	                </c:forEach>

        		</ul>
 
        	</div>
    	</div>
	</section>	
	
	<jsp:include page="../fix/footer.jsp"></jsp:include>
	
	<form id="moveForm" method="get">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
	</form>
	
	<script>
	
	let MoveForm = $("#moveForm");
	
	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='boardSeq' value='"+$(this).attr("href")+ "'>");
		moveForm.attr("action", "/adopt/list");
		moveForm.submit();
		
	}
	
	
	
	$(".pageInfo a").on("click", function(e){
		 
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/adopt/list");
        moveForm.submit();
        
    });
	
	</script>


</div>
</body>
</html>