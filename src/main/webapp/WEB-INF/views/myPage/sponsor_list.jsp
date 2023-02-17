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
	          <h1 class="pageH1">주문내역</h1>
	
	          <article class="pageBody">
	              <!-- 파일 업로드 -->
	              <div class="formGroup">
	                  <table class="table table-bordered">
	                    <thead>
	                      <tr>
	                        <th class="good">상품</th>
	                        <th class="date">기간</th>
	                        <th class="amount">갯수</th>
	                        <th class="price">금액</th>
	                        <!-- <th class="method">방법</th> -->
	                        <th class="status">상태</th>
	                    </tr>
	                    </thead>
	                    <tbody>
							<c:choose>
							  <c:when test="${!empty sponsorMyPage}">    
								<c:forEach items="${sponsorMyPage}" var="sponsor">
								  <tr>
							  		<!-- <th scope="row">${sponsor.rownum}</th> -->
									<td class="text-center">${sponsor.sponsorItemName}</td>
									<td class="text-center"><fmt:formatDate value="${sponsor.sponsorDate}" pattern="yyyy-MM-dd"/></td>
									<td class="text-center">${sponsor.sponsorAmount}</td>
									<td class="text-center">${sponsor.sponsorTotalPrice}</td>
									<td class="text-center">${sponsor.sponsorShippingAddr}</td>
								  </tr>          
								</c:forEach>
							  </c:when>
							  <c:otherwise>
							    <tr>
								  <td colspan="5" class="text-center">후원 내역이 없습니다.</td>
								</tr>
							  </c:otherwise>
							</c:choose>
	                    </tbody>
	                  </table>
	              </div>
	          </article>
	        </div>
	      </section>
	
	    </div>
	  </div>
	</div>
	
    <jsp:include page="../fix/footer.jsp"></jsp:include>

</body>
</html>