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
<style>
  .sign_li_content{
    padding-left: 50px;
    padding-bottom: 30px;
  }
  .sign_li_content img{
    width: 120px;
    height: 120px;
    border-radius:50px 40px / 50px 70px;
    border: solid #faaf4c;
    /* border-radius: 80px / 40px; */
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

</style>

<title>내 입양 신청 목록</title>
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
        <article class="content_size">
          <div class="sign_content">
          
	      <c:choose>
			<c:when test="${!empty mysign}">
	          <c:forEach items="${mysign}" var="mysign">
	            <div class="sign_li_content">
	              <div>
	                <a href="/adopt/detail/ADOPT/${mysign.boardSeq}/${login.userSeq}">
	                	<b>이미지 주소 : ${mysign.adoptImg}</b>
	                  <!-- <img src="${mysign.adoptImg}" alt="동물사진"> -->
	                </a>
	              </div>
	              <div>
	                <ul>
	                  <li>제목 : ${mysign.boardTitle}</li>
	                  <li>진행 상태 : ${mysign.adoptState}</li>
	                  <li>종류 : ${mysign.adoptKind}</li>
	                  <li>보호자 : ${mysign.userName}(${mysign.userId})</li>
	                  <li>신청일 : 
	                  	<fmt:formatDate value="${mysign.adoptReqDate}" pattern="yyyy-MM-dd"/>
	                  </li>                  
	                </ul>
	              </div>
	            </div>            
	   		  </c:forEach>
			</c:when>
  			<c:otherwise>
	   		  	신청 내역이 없습니다.
	   		</c:otherwise>        
          </c:choose>
          </div>
  
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
        </article>
      </section>
    </div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>

</div>

</body>
</html>