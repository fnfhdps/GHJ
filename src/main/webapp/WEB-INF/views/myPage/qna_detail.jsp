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
<!-- mypage css -->
<link rel="stylesheet" href="/resources/css/mypage.css">
<title>내입양글</title>
</head>

<body>
<div class="wrap">

  	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

	<div class="main">
	  <div class="">
	    <div class="sideNavGap row">
		  <!-- 마이페이지 목록 -->
		  <jsp:include page="../fix/aside.jsp"></jsp:include>
	
	      <section class="sidebarContent col-lg-9 col-md-9 col-sm-12 col-xs-12">
	        <div>
	          <h1 class="pageH1">1:1문의</h1>
		        <article class="qna_content">
		          <div id="qna_write">
		            <div>
		              <p id="qna_title">${qnaDetail.boardTitle}
		              <span><fmt:formatDate value="${qnaDetail.boardDate}" pattern="yyyy-MM-dd"/></span></p>
		            </div>
		            <div class="ask_answer">
		              <div id="ask">
		                <p><br>
		                	${qnaDetail.boardContent}
		                <br></p>
		              </div>
		              
		            <c:if test="${!empty reply}">
		              <div id="answer">
		                <p><br>
						  <c:out value="${reply.replyContent}" />
		                <br></p>
		              </div>
		            </c:if>
		            </div>
		          </div>
		
		          <div class="qna_list_mv">
		            <div id="qna_mv">
		              <div>
		                <i class="bi bi-chevron-up"></i>
		                <span>다음글&nbsp;&nbsp;<a id="after">다음</a></span>
		              </div>
		              <div>
		               	<i class="bi bi-chevron-down"></i>
		                <span>이전글&nbsp;&nbsp;<a id="before">이전</a></span>
		              </div>
		            </div>
		
		            <div id="qna_info_btn">
		              <button class="btn btn-secondary" onclick="history.back();">목록</button>
		              <c:if test="${empty reply}">
		              	<button class="btn btn-secondary" onclick="qnaDelete();">삭제</button>
		              </c:if>
		            </div>
		          </div>
		        </article>
	        </div>
	      </section>
	
	    </div>
	  </div>
	</div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
</body>
</html>