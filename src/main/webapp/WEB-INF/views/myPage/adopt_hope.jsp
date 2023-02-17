<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>입양 희망자 목록</title>
</head>

<body>
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
	          <h1 class="pageH1">희망자목록</h1>
	
	          <article class="pageBody">
	            <ul class="listAccountProviders">

	            <c:choose>
				  <c:when test="${!empty hopeList}">
					<c:forEach items="${hopeList}" var="hope">
		              <li class="list-item">
		                <div class="media">
		                  <img src="/resources/image/dog.jpg">
		                  <span class="">${hope.userName}(${hope.userId})</span>
		                  <small>5일 전</small>
		                </div>
		                <h6>${hope.boardTitle}</h6>
		                <a class="btn btn-md btn-outline-primary" rel="nofollow" data-method="post" href="#">대화하기</a>
		              </li>
			        </c:forEach>
	          	  </c:when>
	   			  <c:otherwise>
	   				입양 희망자가 없습니다.
	   			  </c:otherwise>        
      			</c:choose>
	          </ul>
	
	          </article>
	        </div>
	      </section>
	
	    </div>
	  </div>
	</div>
    
	<jsp:include page="../fix/footer.jsp"></jsp:include>
	
</body>
</html>