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
<style>
  .sign_li_content{
    padding-left: 50px;
    padding-bottom: 30px;
  }
  .sign_li_content img{
    width: 120px;
    height: 120px;
    /* border-radius:50px 40px / 50px 70px; */
    /* border: solid #faaf4c; */
  }

  .sign_li_content ul{
    list-style: none;
    font-weight: bold;
    font-size: 12px;
    padding-top: 10px;
    
  }
  
  .sign_li_content li{
    margin-left: -25px;
    padding: 5px;
  }

  .sign_content{
    /* background-color: aquamarine; */
    display: flex;
    /* justify-content: space-evenly; */
    flex-wrap: wrap;
    position: relative;
    left: 90px;
    top: 10px
  }

  .content_size{
    width: 800px;
  }

  .icon{
    text-align: right;
  }

  .icon svg{
    width: 20px;
    height: 16px;
  }

</style>

<title>나의관심동물</title>
</head>

<body>
  <div class="wrap">
  
  	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>
	
    <h2>마이페이지</h2>
    <div id="mypage">
      <jsp:include page="../fix/aside.jsp"></jsp:include>

      <section class="mypage_content">
        <article class="content_size">
          <div class="sign_content">
          
          <c:choose>
			<c:when test="${!empty myHeart}">
				<c:forEach items="${myHeart}" var="heart">
		            <div class="sign_li_content">
		              <div>
		                <a href="#">
	                	  <input type="hidden" name="userHeartSeq" value="${heart.userHeartSeq}">
	                 	  <img src="${heart.adoptImg}" alt="내 관심동물">
	                 	  <i class="bi bi-heart-fill"></i>
		                </a>
		              </div>
		            </div>
	            </c:forEach>
            </c:when>
  			<c:otherwise>
	   		  	관심동물이 없습니다.
	   		</c:otherwise>        
          </c:choose>
          </div>
        </article>

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