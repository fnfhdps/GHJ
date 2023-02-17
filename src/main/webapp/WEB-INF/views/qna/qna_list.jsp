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
  .qna_content{
    /* background-color: bisque; */
    position: relative;
    /* height: 100%; */
  }
  #qna_list_btn{
    position: absolute;
    bottom: -50px;
    right: 150px;
  }

  #qna_list_btn a{
    text-decoration: none;
    color: white;
  }
</style>

<title>1:1문의사항</title>
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
        <div class="qna_content">
          
          <!-- 선택한 클래스에 -->
          <ul>
          	<li class="on">
          		<a href="/mypage/qna/wait/${login.userSeq}">답변대기</a>
          	</li>
          	<li>
	          	<a href="/mypage/qna/list">답변완료</a>
          	</li>
          </ul>
          
          <table class="table">
            <thead class="table-secondary">
              <tr>
                <th scope="col">번호</th>
                <th scope="col" class="tbl_title">제목</th>
                <th scope="col" class="tbl_sign">상태</th>
				<th scope="col" class="tbl_sign">문의일자</th>
              </tr>
            </thead>
            
            <tbody>
	            <c:choose>
            	  <c:when test="${!empty qnaList}">
					<c:forEach items="${qnaList}" var="qna">
		              <tr>
		              	<td>${qna.num}</td>
		                <td><a href="/mypage/qna/get/${qna.boardSeq}">${qna.boardTitle}</a></td>
		                <!-- 이건 c태그 if로 해서 해당 게시글시퀀스에 답변이 있냐 없냐에 따라 답변대기, 답변완료 -->
		                <td>답변대기</td>
						<td><fmt:formatDate value="${qna.boardDate}" pattern="yyyy-MM-dd"/></td>
		              </tr>
					</c:forEach>   
	              </c:when>
   				  <c:otherwise>
   				  	<td colspan="4">1:1 문의 내역이 없습니다.</td>
	   			  </c:otherwise>        
          		</c:choose>           	
            </tbody>
          </table>

 
          <div id="qna_list_btn">
            <button type="button" class="btn btn-secondary"><a href="/mypage/qna/new">글쓰기</a></button>
          </div>
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
      </section>
    </div>
    
	<jsp:include page="../fix/footer.jsp"></jsp:include>

</div>

</body>
</html>