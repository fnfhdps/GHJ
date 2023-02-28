<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/index.css">
<title>index</title>
</head>

<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/fix/header.jsp"></jsp:include>

	<section class="container-xxl">

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
	
	  <main>
<!--         <section id="home-main-section-top" class="background-pale-peach">
          <div id="home-main-top">
            <div class="home-main-desc">
              <h1 class="home-main-title">우리 근처의<br>유기동물</h1>
              <p class="text-m">
                유기동물 입양에서 후원까지, 함께해요.<br>가깝고 따뜻한 당신의 가족을 만들어요.
              </p>
            </div>
            <div class="home-main-image-top main_img">
                <img src="resources/image/logo/logo2.png" width="540px" height="680px">
            </div>
          </div>
        </section> -->
        
        <section class="home-main-section">
          <div class="home-main-content">
            <div>
              <h1 class="home-main-title">우리 근처의<br>유기동물</h1>
              <p class="text-m">유기동물 입양에서 후원까지, 함께해요.<br>가깝고 따뜻한 당신의 가족을 만들어요.</p>
            </div>
            <div class="home-main-image home-main-image-01">
                <img srcset="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-1-cc678e9a217b96f5cb459f7f0684f5ba67706f9889801618b8cf879fbc2c0ea7.webp " class="home-main-image-01" alt="우리동네 중고 직거래 사진" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-1-39ac203e8922f615aa3843337871cb654b81269e872494128bf08236157c5f6a.png">
            </div>
          </div>
        </section>
        
        <section class="home-main-section sction-top">
          <div class="home-main-content">
            <div class="home-main-image home-main-image-01">
                <img srcset="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-1-cc678e9a217b96f5cb459f7f0684f5ba67706f9889801618b8cf879fbc2c0ea7.webp " class="home-main-image-01" alt="우리동네 중고 직거래 사진" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-1-39ac203e8922f615aa3843337871cb654b81269e872494128bf08236157c5f6a.png">
            </div>
            <div>
              <h1 class="home-main-title">동네 검색 후<br>동네 유기동물 입양</h1>
              <p class="text-m">
                동네 주민들과 가깝고 따뜻한 마음을
                
                지금 나누어 보세요.
              </p>
              <div class="home-buttons d-flex">
                <a id="text-l" class="home-button text-bold btn btn-warning" href="/hot_articles">입양하러 가기</a>
                <a id="text-l" class="home-button text-bold btn btn-warning ml-3" href="/trust">후원하러 가기</a>
              </div>
            </div>
          </div>
        </section>
       
        <section class="home-main-section">
          <div class="home-hot-content">
            <h1 class="home-main-title text-center home-hot-title">최근 올라온 입양글</h1>
            <div class="cards-wrap">

				<c:choose>
				  <c:when test="${!empty indexAdopt}">
					<c:forEach items="${indexAdopt}" var="adopt" varStatus = "status">
					  <!-- 최근 입양글 4개만 출력 -->            
		              <c:if test="${status.index < 4}">
			              <article class="card-top ">
			                <div class="card-link " data-event-label="539014062">
			                    <div class="card-photo">
			                        <a href="/adopt/detail/${adopt.boardCategory}/${adopt.boardSeq}/${login.userSeq}"><img alt="동물사진" src="/resources/image/adopt/${adopt.adoptImg}"></a>
			                    </div>
			                    <div class="card-desc">
			                        <h2 class="card-title">${adopt.boardTitle}</h2>
			                        <div class="card-price ">${adopt.adoptKind}</div>
			                        <div class="card-region-name">${adopt.adoptAddr}</div>
			                    </div>
			                </div>
			              </article>
		              </c:if>
				    </c:forEach>
		          </c:when>
		   		  <c:otherwise>입양 희망자가 없습니다.</c:otherwise>        
      		</c:choose>
            
            </div>
            <div class="text-center my-5">
              <a class="text-bold text-black text-m" id="hot-articles-more" href="/adopt/list">입양글 더 보기</a>
            </div>
          </div>
        </section>
      </main>
	</section>
	
	<jsp:include page="/WEB-INF/views/fix/footer.jsp"></jsp:include>
</div>

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
</body>
</html>