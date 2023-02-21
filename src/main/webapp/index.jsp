<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

h1 {
	font-size: 35px bold;
	padding: 1.5rem 0;
	border-bottom: 1px solid black;
}

h2 {
	font-size: 22px bold;
}

p {
	font-size: 17px;
}

.carousel-inner>.carousel-item>img {
	top: 0;
	left: 0;
	max-height: 550px;
	margin: auto;
}

#adopt_list {
	float: none;
	margin: 100 auto;
	padding-top: 1.5rem;
}

#adopt_list>article {
	float: none;
	margin: 0 auto;
	margin-bottom: 50px;
}
#adopt_list>article>img {
	height: 250px;
}
/*     #adopt_list > article {
    	float: left;
    	margin-left: 10px;
    	margin-bottom: 10px;
    }
    #adopt_list > article > img {
    	display: block;
    	width: 400px;
    } */
</style>
<title>main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fix/header.jsp"></jsp:include>

	<section class="container">

		<!-- 광고칸 -->
		<div id="advertisement">
			<div id="carouselExampleDark" class="carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="resources/image/adver/adver_01.png" class="d-block w-100"
							alt="광고_01">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="resources/image/adver/adver_02.png" class="d-block w-100"
							alt="광고_02">
					</div>
				</div>
	
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	
		<!-- 최근 입양글 -->
		<h1>강아지를 구해줘!</h1>
		<%-- <section id="latest_adopt">
			<div id="adopt_list" class="row row-cols-2 row-cols-lg-3 g-2 g-lg-4">
				<img class="img-thumbnail" alt="dog01"
					 src="/resources/image/adopt/dog.jpg">
				<c:forEach items="${adoptList1}" var="adopt">
		            <article class="col-md-4">
						<c:if test="${adopt.adoptState eq 'WAIT'}">
							<span class="badge bg-dark">입양대기</span>
						</c:if>
						<c:if test="${adopt.adoptState eq 'SUCCESS'}">
							<span class="badge bg-dark">입양완료</span>
						</c:if>
							<span>${adopt.adoptKind}</span>
					</article>
				</c:forEach>   
			</div>
		</section> --%>
		<div class="container px-4 px-lg-5 mt-5">
	        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	            <div class="col mb-5">
	                <div class="card h-100">
	                    <a class="loginCheck" href="#">
	                    	<img class="card-img-top" alt="" src="/resources/image/adopt/dog.jpg">
	                    </a>
	                </div>
	            </div>
	        </div>
	    </div>
		<br>
		<!-- 광고 -->
		<div>
			<img alt="광고_03" class="d-block w-100" src="resources/image/adver/adver_03.png">
		</div>
		
		
	</section>
	
	
	
	<%-- <jsp:include page="/WEB-INF/views/fix/footer.jsp"></jsp:include> --%>

<script type="text/javascript">
/* 	alert("시잗");
	$.ajax({
		url: "/index",
		type: "get",
		success: function(result){
			if(result == 0) {
				alert("ok");
			} else {
				alert(result);
				alert("통신 오류");
			}
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		}
	}); */
	
	// test
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>