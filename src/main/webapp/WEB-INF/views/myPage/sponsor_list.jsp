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
<title>후원내역</title>
</head>

<body>
  <div class="wrap">
  
  	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

    <h2>마이페이지</h2>
    <div id="mypage" class="d-flex justify-content-start">
	  <jsp:include page="../fix/aside.jsp"></jsp:include>

      <section class="mypage_content">
		<table class="table">
		  <thead class="table-secondary">
		    <tr>
		      <th scope="col" class="tbl_num">번호</th>
		      <th scope="col" class="tbl_sign">상품명</th>
		      <th scope="col" class="tbl_sign">수량</th>
		      <th scope="col" class="tbl_sign">금액</th>
		      <th scope="col" class="tbl_sign">배송지</th>
		      <th scope="col" class="tbl_sign">구매일</th>
		    </tr>
		  </thead>
		  
		  <tbody>
			<c:choose>
			  <c:when test="${!empty sponsorMyPage}">    
				<c:forEach items="${sponsorMyPage}" var="sponsor">
				  <tr>
			  		<th scope="row">${sponsor.rownum}</th>
					<td>${sponsor.sponsorItemName}</td>
					<td>${sponsor.sponsorAmount}</td>
					<td>${sponsor.sponsorTotalPrice}</td>
					<td>${sponsor.sponsorShippingAddr}</td>
					<td><fmt:formatDate value="${sponsor.sponsorDate}" pattern="yyyy-MM-dd"/></td>
				  </tr>          
				</c:forEach>
			  </c:when>
			  <c:otherwise>
			    <tr>
				  <td colspan="6">후원 내역이 없습니다.</td>
				</tr>
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