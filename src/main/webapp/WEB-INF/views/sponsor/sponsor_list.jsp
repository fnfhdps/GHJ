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
		<jsp:include page="../fix/header.jsp"></jsp:include>
        
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   
                    <c:forEach items="${sponsorItemList}" var="sponsor">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${sponsor.sponsorItemImg}" alt="${sponsor.sponsorItemName}" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${sponsor.sponsorItemName}</h5>
                                    <!-- Product price-->
                                    ${sponsor.sponsorItemPrice}원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/sponsor/get/${sponsor.sponsorItemSeq}">후원하기</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach> 
                    
                </div>
            </div>
        </section>
			
		<jsp:include page="../fix/footer.jsp"></jsp:include>
</body>
</html>