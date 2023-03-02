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

<!-- cs css -->
<link rel="stylesheet" href="/resources/css/cs.css">
<title>공지사항</title>
</head>

<body>
<div class="wrap">
    <jsp:include page="../fix/header.jsp"></jsp:include>

	<div class="main">
	  <section class="section hero">
	    <div class="hero-inner">
<!-- 	      <form role="search" class="search search-full" data-search="" data-instant="true" autocomplete="off" action="#" method="get">
	        <input name="utf8" type="hidden" value="✓" autocomplete="off">
	        <input type="search" name="query" id="query" placeholder="검색" autocomplete="off" aria-label="검색">
	      </form> -->
	    </div>
	  </section>

	  <div class="container">
	    <section class="section knowledge-base">
	      <section class="categories blocks">
	        <ul class="blocks-list">
	              <li class="blocks-item">
	                <a href="/cs/faq" class="blocks-item-link">
	                  <h3 class="blocks-item-title">FAQ</h3>
	                  <!-- <p class="blocks-item-description">회원을 위한 맞춤 상담</p> -->
	                </a>
	              </li>
	
	              <li class="blocks-item">
	                <a href="/cs/notice" class="blocks-item-link">
	                  <h3 class="blocks-item-title">Notice</h3>
	                  <!-- <p class="blocks-item-description">교육 프로그램 관련 문의(운영/결제/환불 등)</p> -->
	                </a>
	              </li>
	        </ul>
	      </section>
	  
	      <!-- 세션으로 값 가져오기  -->
	        <section class="articles">
	          <h2 class="articles-header" style="margin-block-end: 0.9em;">Notice 공지사항</h2>
	          <ul class="article-list promoted-articles">
	          	<c:choose>
	       		  <c:when test="${!empty boardList}">
				    <c:forEach items="${boardList}" var="board">
		              <li class="promoted-articles-item">
		                  <a href="/cs/notice/${board.boardSeq}"><c:out value="${board.boardTitle}"></c:out></a>
		              </li>
				    </c:forEach>
		          </c:when>
			   	  <c:otherwise>
		   		  	작성된 게시글이 없습니다.
		   		  </c:otherwise>        
	     	    </c:choose>
	          </ul>
	        </section>
	    </section>
	  
	    <section class="section home-section activity">
	    </section>
	  </div>
	</div>

	<jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
</body>
</html>