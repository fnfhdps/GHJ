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
	
	          <article class="pageBody">
	              <!-- 파일 업로드 -->
	              <div class="formGroup">
	                  <table class="table table-bordered">
	                    <thead>
	                      <tr>
	                        <th class="good">문의 유형</th>
	                        <th class="date">등록일</th>
	                        <th class="amount">제목</th>
	                        <th class="status">처리상태</th>
	                      </tr>
	                    </thead>
	                    <tbody>
				          	<c:choose>
				       		  <c:when test="${!empty qnaList}">
							    <c:forEach items="${qnaList}" var="qna">
			                      <tr>
			                        <td class="text-center">${qna.boardSubCategory}</td>
			                        <td class="text-center"><fmt:formatDate value="${qna.boardDate}" pattern="yyyy-MM-dd"/></td>
			                        <td class="text-center"><a href="/mypage/qna/get/${qna.boardSeq}">${qna.boardTitle}</a></td>
			                        <td class="text-center">답변대기</td>
			                      </tr>
							    </c:forEach>
					          </c:when>
						   	  <c:otherwise>
					   		  	<td class="text-center" colspan="4">1:1 문의 내역이 없습니다.</td>
					   		  </c:otherwise>        
				     	    </c:choose>
	                    </tbody>
	                  </table>
	                  
	                  <div class="mt-2 mb-2 formRow">
	                    <a class="col-auto btn btn-secondary ps-3 pe-3" type="button" href="/mypage/qna/new">글쓰기</a>
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