<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>내관심동물</title>
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
	
	      <section class="heart_container sidebarContent col-lg-9 col-md-9 col-sm-12 col-xs-12">
	        <div>
	          <h1 class="pageH1">관심동물</h1>
	
	          <article class="pageBody">
	            <div class="heart_content css-1ltj86z e15wafbq0">
	              <div class="css-1w92ebd e1lm7yo61">
	                <div class="virtualized-list heart_row row" style="padding-top: 0px; padding-bottom: 0px; transform: translateY(0px);">
	
			            <c:choose>
						  <c:when test="${!empty myHeart}">
							<c:forEach items="${myHeart}" var="heart">
			                  <div class="col-6 col-lg-4">
			                    <div class="css-prip86 e1lm7yo60">
			                      <div class="css-beq49r e1vfbmcc3">
			                       	<input type="hidden" id="boardSeq" value="${heart.boardSeq}">
			                      	<img class="css-1b4920d e1vfbmcc2" src="/resources/image/adopt/${heart.adoptImg}" alt="관심동물">
	  		                          <a class="css-1q3ntsa e1vfbmcc1" id="heart" onclick="checkHeart(${heart.boardSeq})">
				                        <i class="bi bi-heart-fill"></i>
	 		                          </a>
			                      </div>
			                    </div>
			                  </div>
				            </c:forEach>
			              </c:when>
			  			  <c:otherwise>
				   		  	<p>관심동물이 없습니다.</p>
				   		  </c:otherwise>        
			            </c:choose>
	            
	                </div>
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

<input type="hidden" id="userSeq" value="${login.userSeq}">

<script type="text/javascript">
// 좋아요 중복 체크
function checkHeart(boardSeq) {
	const userSeq = $('#userSeq').val();
	const data = {
			"userSeq" : userSeq,
			"boardSeq" : boardSeq
			};
    //alert("userSeq: "+userSeq+"boardSeq: "+boardSeq);
    $.ajax({
        url : "/adopt/delete/heart",
        type :'post',
        data : JSON.stringify(data),
        dataType : "json",
        contentType : "application/json",
        async : true,
        success : function(result){
            if(result == 0){
            	alert("성공");                		
                window.location.href = "/mypage/heart/"+userSeq;
            } else {
            	alert("실패");
            	return;
            }
        },
        error : function(errorThrown){
         alert(errorThrown.statusText);
      }
     });
    //ajaxPost(url, data, msg1, msg2);
};
</script>
</body>
</html>