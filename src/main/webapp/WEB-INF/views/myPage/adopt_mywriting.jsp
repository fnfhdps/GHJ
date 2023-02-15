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
<title>내 입양 글</title>
</head>

<body>
  <div class="wrap">
  
  	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

    <h2>마이페이지</h2>
    <div id="mypage" class="d-flex justify-content-start">
      <jsp:include page="../fix/aside.jsp"></jsp:include>
      <section class=" mypage_content">
        <table class="table">
          <thead class="table-secondary">
            <tr>
              <th scope="col" class="tbl_num">번호</th>
              <th scope="col">제목</th>
              <th scope="col">상태</th>
              <th scope="col">등록일</th>
            </tr>
          </thead>
          <tbody>
          	<c:choose>
       		  <c:when test="${!empty myAdopt}">
			    <c:forEach items="${myAdopt}" var="myAdopt">
			      <tr>
			        <th scope="row">${myAdopt.rownum}</th>
			        <td><a href="/adopt/detail/ADOPT/${myAdopt.boardSeq}/${login.userSeq}">${myAdopt.boardTitle}</a></td>
			        <td>${myAdopt.adoptState}</td>
			        <td><fmt:formatDate value="${myAdopt.boardDate}" pattern="yyyy-MM-dd"/></td>
			      </tr>
			    </c:forEach>
	          </c:when>
		   	  <c:otherwise>
	   		  	<td colspan="4">작성된 게시글이 없습니다.</td>
	   		  </c:otherwise>        
     			</c:choose>
          </tbody>    
        </table>

        
        <div aria-label="Page navigation example" class="paging">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
        </div>
      </section>
    </div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>
    
</div>

</body>
</html>