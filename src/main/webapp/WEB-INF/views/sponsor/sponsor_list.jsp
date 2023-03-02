<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>후원 상품 목록</title>
</head>
<body>
<div class="wrap">
  <jsp:include page="../fix/header.jsp"></jsp:include>
	      
	<section class="">
	    <div class="container-xxl px-4 px-lg-5">
		    <div class="row py-5">
	    	  <img class="col-12" src="/resources/image/sponsor/sponsor_content.png">	
		    </div>
		    <div class="row py-5 mb-5">
			  <img id="id_map_img" class="col-12" alt="후원" src="/resources/image/sponsor/sponsor_info.png">
		    </div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 pb-5 mb-5">
			    <c:forEach items="${sponsorItemList}" var="sponsor">
			    <div class="col mb-5">
			        <div class="card h-100">
						<a href="/sponsor/get/${sponsor.sponsorItemSeq}">
				            <img class="card-img-top"
				            	style="height: 250px"
				            	src="/resources/image/sponsor/${sponsor.sponsorItemImg}"
				            	alt="${sponsor.sponsorItemName}" />
						</a>
			            <div class="card-body">
			                <div class="">
			                    <div class="fw-normal pb-1">${sponsor.sponsorItemName}</div>
			                    <small>${sponsor.sponsorItemPrice} 원</small>
			                </div>
			            </div>
			            <!-- Product actions-->
<%-- 			            <div class="card-footer pt-2 border-top-0 bg-transparent">
			                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/sponsor/get/${sponsor.sponsorItemSeq}">후원하기</a></div>
			            </div> --%>
			        </div>
			    </div>
			    </c:forEach> 
			</div>
<!-- 			<div class="d-flex justify-content-center mt-3 mb-5">
	            <nav aria-label="Page navigation example">
	              <ul class="pagination">
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
	            </nav>
			</div> -->
	    </div>
	</section>
		
  <jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
</body>
</html>