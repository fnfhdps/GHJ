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
<title>내정보</title>
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
	          <h1 class="pageH1">계정관리</h1>
	          <div class="pageSubtitle">내정보</div>
	
	          <!-- 새디자인 -->
	          <article class="pageBody">
	            <div class="css-itjaqv e1ejty663">
	
	              <div class="css-hdhsoq e18gdfbl4">
	                <div class="css-1uebeg0 e18gdfbl3">
		                <!-- 프로필 사진 없으면 기본 사진 보임 -->
			          	<c:choose>
				          	<c:when test="${!empty login.userImg}">
				            	<img id="css-1cqverl e18gdfbl2" src="${login.userImg}">
				          	</c:when>
				          	<c:otherwise>
				          		<img id="css-1cqverl e18gdfbl2" src="/resources/image/profile/profile.png">
				          	</c:otherwise>
			          	</c:choose>
	                </div>
	                
	                <div class="css-oycm3d e18gdfbl1">
	                  <div class="css-n5l119 etfm1it0"><c:out value="${login.userName}"/></div>
	                  <div class="css-oycm3d e1iro1t99">
	                    <div class="css-1uy49c8 e1iro1t98">
	                      <span class="css-7haicw e1iro1t97"><c:out value="${login.userId}"/></span>
	                    </div>
	
	                    <div class="css-0 e1iro1t94">
	                      <a class="_3Z6oR _1zLQC _1XHs9 css-h9lcdg e1iro1t93" href="/mypage/info/update">설정</a>
	                    </div>
	                  </div>
	                </div>
	              </div>
	
	              <div class="css-1049nre epl9oik0">
	                <div class="css-134c4us ekeuxnk0">
	                  <a class="css-1p9dybm e1q26atk3">
	                    <div class="css-zpotx6 e1q26atk2">
	                      <!-- <i class="bi bi-pencil-square"></i> -->
	                      <i class="bi bi-vector-pen"></i>
	                    </div>
	                    <div class="css-10ewlqi e1q26atk1">내게시글</div>
	                    <div class="css-2rwq1u e1q26atk0">3</div>
	                  </a>
	                  <a class="css-1p9dybm e1q26atk3">
	                    <div class="css-zpotx6 e1q26atk2">
	                      <i class="bi bi-heart"></i>
	                    </div>
	                    <div class="css-10ewlqi e1q26atk1">좋아요</div>
	                    <div class="css-2rwq1u e1q26atk0">4</div>
	                  </a>
	                  <a class="css-1p9dybm e1q26atk3">
	                    <div class="css-zpotx6 e1q26atk2">
	                      <i class="bi bi-truck"></i>
	                    </div>
	                    <div class="css-10ewlqi e1q26atk1">후원</div>
	                    <div class="css-2rwq1u e1q26atk0">0</div>
	                  </a>
	                </div>
	              </div>
	            
	            </div>
	          </article>
	
	          <article class="pageBody">
	              <div class="formGroup info">
	                    <i class="bi bi-envelope"></i>
	                    <p>${login.userEmail}</p>
	              </div>
	              <div class="formGroup info">
	                <i class="bi bi-phone"></i>
	                    <p>${login.userPhone}</p>
	              </div>
	              <div class="formGroup info">
	                <i class="bi bi-truck"></i>
	                <p>(${login.userAddr1})&nbsp;&nbsp;${login.userAddr2}&nbsp;&nbsp;${login.userAddr3}&nbsp;&nbsp;</p>
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