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
html {
        font-size: 62.5%;
        height: 100%;
    }
    /* 1 section start */
    #home-main-section-top {
    padding-top: 24px;
    background-color: #FBF7F2;
    }
    #home-main-section-top #home-main-top {
        width: 1024px;
        height: 760px;
        margin: 0 auto;
        position: relative;
        background-color: #FBF7F2;
    }
    #home-main-section-top .home-main-title {
        font-size: 4.8rem;
        line-height: 1.3;
        padding-top: 27rem;
        margin-bottom: 3.2rem;
        letter-spacing: -0.4px;
    }
    .text-m {
        font-size: 1.6rem !important;
        line-height: 1.5;
        letter-spacing: -0.3px;
    }
    #home-main-section-top .home-main-image-top {
        position: absolute;
        right: -84px;
        bottom: 0;
        width: 804px;
        height: 685px;
        background-color: #FBF7F2;
        background-repeat: no-repeat;
        background-size: 804px 685px;
    }
    #home-main-section-top .home-main-image-top {
        position: absolute;
        right: -84px;
        bottom: 0;
        width: 804px;
        height: 685px;
        background-color: #FBF7F2;
        background-repeat: no-repeat;
        background-size: 804px 685px;
    }
    /* 1 section end */

    /* 2 section start */

    .home-main-section {
        padding: 6rem 0;
    }
    .home-main-section .home-main-content {
        width: 1024px;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .home-main-section .home-main-image-01 {
        background-size: 532px 684px;
        width: 532px;
        height: 684px;
    }
    .home-main-section .home-main-image {
        display: inline-block;
    }
    .home-main-section .home-main-image-01 {
        background-size: 532px 684px;
        width: 532px;
        height: 684px;
    }
    .home-main-section .home-main-title {
        font-size: 4rem;
        line-height: 1.35;
        margin-bottom: 2.4rem;
    }
    .text-m {
        font-size: 1.6rem !important;
        line-height: 1.5;
        letter-spacing: -0.3px;
    }
    .home-main-section .home-buttons {
        margin-top: 3.2rem;
    }

    .home-main-section .home-buttons .home-button {
    background-color: #F1F3F5;
    color: #212529;
    border: none;
    border-radius: 6px;
    text-decoration: none;
    padding: 1.45rem 2.6rem;
    display: inline-block;
    }
    .text-l {
        font-size: 1.8rem !important;
        line-height: 1.47;
        letter-spacing: -0.3px;
    }
    .text-bold {
        font-weight: bold;
    }

    .ml-3 {
        margin-left: 1.6rem;
    }
    .text-l {
        font-size: 1.8rem !important;
        line-height: 1.47;
        letter-spacing: -0.3px;
    }
    .text-bold {
        font-weight: bold;
    }
    /* 2section end */

    /* 3section start */
    .home-main-section {
    padding: 6rem 0;
    }
    .background-gray {
        background-color: #F8F9FA;
    }
    .home-main-section .home-hot-content {
        width: 1024px;
        margin: 6rem auto 12rem auto;
    }
    .home-main-section .home-hot-title {
        margin-bottom: 8rem;
    }
    .home-main-section .home-main-title {
        font-size: 4rem;
        line-height: 1.35;
        margin-bottom: 2.4rem;
    }
    .text-center {
        text-align: center;
    }
    .cards-wrap {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        width: 100%;
        margin: 0 auto;
    }
    .cards-wrap .card-top, .cards-wrap .card {
        width: calc(25% - 44px);
        margin-right: 44px;
        margin-bottom: 56px;
    }
    .cards-wrap .card-link {
        text-decoration: none;
        color: #212529;
    }
    .cards-wrap .card-top .card-photo, .cards-wrap .card .card-photo {
        width: 100%;
        padding-top: 100%;
        position: relative;
        overflow: hidden;
        border-radius: 12px;
        background-color: #F8F9FA;
        box-shadow: inset 0px 0px 0px 1px rgb(0 0 0 / 15%);
        box-sizing: border-box;
    }
    .cards-wrap .card-top .card-photo img, .cards-wrap .card .card-photo img {
        position: absolute;
        top: 0;
        bottom: 0;
        width: 100%;
        box-sizing: border-box;
        border-radius: 12px;
        border: 1px solid transparent;
    }
    .cards-wrap .card-top .card-desc, .cards-wrap .card .card-desc {
        margin-top: 12px;
    }
    .cards-wrap .card-top .card-desc .card-title, .cards-wrap .card .card-desc .card-title {
        font-size: 16px;
        letter-spacing: -0.02px;
        color: #212529;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        margin-bottom: 4px;
        line-height: 1.5;
        font-weight: normal;
    }
    .cards-wrap .card-top .card-desc .card-price, .cards-wrap .card .card-desc .card-price {
        font-size: 15px;
        font-weight: 700;
        line-height: 1.5;
        margin-bottom: 4px;
    }
    .cards-wrap .card-top .card-desc .card-region-name, .cards-wrap .card .card-desc .card-region-name {
        font-size: 13px;
        color: #212529;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        margin-bottom: 4px;
        line-height: 1.5;
    }

    .cards-wrap .card-top .card-desc .card-counts, .cards-wrap .card .card-desc .card-counts {
        color: #868e96;
        font-size: 13px;
    }
    /* 3section end */
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
	
		<main>
        <section id="home-main-section-top" class="background-pale-peach">
          <div id="home-main-top">
            <div class="home-main-desc">
              <h1 class="home-main-title">우리 근처의<br>유기동물</h1>
              <p class="text-m">
                유기동물 입양에서 후원까지, 함께해요.<br>가깝고 따뜻한 당신의 가족을 만들어요.
              </p>
            </div>
            <div class="home-main-image-top">
                <img srcset="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-top-d6869a79bc4cb58ea59aa5a408decfdf4a4ba60ac639837081da12861083cdbb.webp " class="home-main-image-top" alt="중고거래, 동네생활 질문글과 동네가게" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-top-68ba12f0da7b5af9a574ed92ca8b3a9c0068db176b566dd374ee50359693358b.png">
            </div>
          </div>
        </section>
        <section class="home-main-section">
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
              <div class="home-buttons">
                <a class="home-button text-l text-bold" href="/hot_articles">입양하러 가기</a>
                <a class="home-button text-l text-bold ml-3" href="/trust">후원하러 가기</a>
              </div>
            </div>
          </div>
        </section>
        
       
        <section class="home-main-section background-gray">
          <div class="home-hot-content">
            <h1 class="home-main-title text-center home-hot-title">
               최근 올라온 입양글
            </h1>
            <div class="cards-wrap">
              <article class="card-top ">
                <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                    <div class="card-photo ">
                        <img alt="인절미 입양하세요" src="/img/dog.jpg">
                    </div>
                    <div class="card-desc">
                        <h2 class="card-title">인절미 입양하세요</h2>
                        <div class="card-price ">
                        강아지
                        </div>
                        <div class="card-region-name">
                        서울 강동구 둔촌제2동
                        </div>
                        <div class="card-counts">
                            <span>
                            관심 5
                            </span>
                        ∙
                        <span>
                            채팅 41
                            </span>
                        </div>
                    </div>
                </a>
            </article>
            <article class="card-top ">
                <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                    <div class="card-photo ">
                        <img alt="인절미 입양하세요" src="/img/dog.jpg">
                    </div>
                    <div class="card-desc">
                        <h2 class="card-title">인절미 입양하세요</h2>
                        <div class="card-price ">
                        강아지
                        </div>
                        <div class="card-region-name">
                        서울 강동구 둔촌제2동
                        </div>
                        <div class="card-counts">
                            <span>
                            관심 5
                            </span>
                        ∙
                        <span>
                            채팅 41
                            </span>
                        </div>
                    </div>
                </a>
                </article>
                <article class="card-top ">
                    <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                        <div class="card-photo ">
                            <img alt="인절미 입양하세요" src="/img/dog.jpg">
                        </div>
                        <div class="card-desc">
                            <h2 class="card-title">인절미 입양하세요</h2>
                            <div class="card-price ">
                            강아지
                            </div>
                            <div class="card-region-name">
                            서울 강동구 둔촌제2동
                            </div>
                            <div class="card-counts">
                                <span>
                                관심 5
                                </span>
                            ∙
                            <span>
                                채팅 41
                                </span>
                            </div>
                        </div>
                    </a>
                </article>
                <article class="card-top ">
                    <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                        <div class="card-photo ">
                            <img alt="인절미 입양하세요" src="/img/dog.jpg">
                        </div>
                        <div class="card-desc">
                            <h2 class="card-title">인절미 입양하세요</h2>
                            <div class="card-price ">
                            강아지
                            </div>
                            <div class="card-region-name">
                            서울 강동구 둔촌제2동
                            </div>
                            <div class="card-counts">
                                <span>
                                관심 5
                                </span>
                            ∙
                            <span>
                                채팅 41
                                </span>
                            </div>
                        </div>
                    </a>
                </article>
                <article class="card-top ">
                    <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                        <div class="card-photo ">
                            <img alt="인절미 입양하세요" src="/img/dog.jpg">
                        </div>
                        <div class="card-desc">
                            <h2 class="card-title">인절미 입양하세요</h2>
                            <div class="card-price ">
                            강아지
                            </div>
                            <div class="card-region-name">
                            서울 강동구 둔촌제2동
                            </div>
                            <div class="card-counts">
                                <span>
                                관심 5
                                </span>
                            ∙
                            <span>
                                채팅 41
                                </span>
                            </div>
                        </div>
                    </a>
                </article>
                <article class="card-top ">
                    <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                        <div class="card-photo ">
                            <img alt="인절미 입양하세요" src="/img/dog.jpg">
                        </div>
                        <div class="card-desc">
                            <h2 class="card-title">인절미 입양하세요</h2>
                            <div class="card-price ">
                            강아지
                            </div>
                            <div class="card-region-name">
                            서울 강동구 둔촌제2동
                            </div>
                            <div class="card-counts">
                                <span>
                                관심 5
                                </span>
                            ∙
                            <span>
                                채팅 41
                                </span>
                            </div>
                        </div>
                    </a>
                </article>
                <article class="card-top ">
                    <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                        <div class="card-photo ">
                            <img alt="인절미 입양하세요" src="/img/dog.jpg">
                        </div>
                        <div class="card-desc">
                            <h2 class="card-title">인절미 입양하세요</h2>
                            <div class="card-price ">
                            강아지
                            </div>
                            <div class="card-region-name">
                            서울 강동구 둔촌제2동
                            </div>
                            <div class="card-counts">
                                <span>
                                관심 5
                                </span>
                            ∙
                            <span>
                                채팅 41
                                </span>
                            </div>
                        </div>
                    </a>
                </article>
                <article class="card-top ">
                    <a class="card-link " data-event-label="539014062" href="/articles/539014062">
                        <div class="card-photo ">
                            <img alt="인절미 입양하세요" src="/img/dog.jpg">
                        </div>
                        <div class="card-desc">
                            <h2 class="card-title">인절미 입양하세요</h2>
                            <div class="card-price ">
                            강아지
                            </div>
                            <div class="card-region-name">
                            서울 강동구 둔촌제2동
                            </div>
                            <div class="card-counts">
                                <span>
                                관심 5
                                </span>
                            ∙
                            <span>
                                채팅 41
                                </span>
                            </div>
                        </div>
                    </a>
                </article>
      
            </div>
            <div class="text-center">
              <a class="text-bold text-black text-m" id="hot-articles-more" data-url="/hot_articles"> 입양글 더 보기</a>
            </div>
          </div>
        </section>
      </main>
		
		
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