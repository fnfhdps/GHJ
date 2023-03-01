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

<title>관리자: 공지사항관리</title>
</head>

<!-- 관리자 role인지 확인하기 -->
<body>
  <!-- 관리자페이지 헤더 -->
  <jsp:include page="../fix/admin_header.jsp"></jsp:include>
  
  <div class="container-fluid">
    <div class="row">
    <!-- 관리자페이지 목록 -->
    <jsp:include page="../fix/admin_nav.jsp"></jsp:include>
  
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-5 mt-4">
        <div class="chartjs-size-monitor">
          <div class="chartjs-size-monitor-expand">
            <div class=""></div>
          </div>
          <div class="chartjs-size-monitor-shrink">
            <div class=""></div>
          </div>
        </div>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">공지사항관리</h1>
        </div>

       <%--  <section class="member_container">
          <article class="member_content member_size pageBody">
            <div class="mb-4">
              <input class="form-control" type="text" placeholder="Search" type="text" name="" id="">
            </div>
  
            <div class="d-flex comment_title tbl_caption">
              <div class="mt-2">
                <span>공지수</span>
                <span>${totalCnt}</span>
              </div>
              
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
            </div> --%>
            
            <!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
    	<section class="container-xxl py-5">
    		<article class="member_content member_size pageBody">
    		
    		 <div class="d-flex comment_title tbl_caption">
	              <div class="mt-2">
	                <span>공지수</span>
	                <span>${totalCnt}</span>
	              </div>
              </div>
              <br>
    		
    		
	  			<div class="search_area input-group">
		       		<input type="text" class="form-control" name="keyword" placeholder="검색할 제목을 입력해주세요" value="${pageMaker.cri.keyword }">
		            <button type="button" class="btn btn-outline-secondary">검색</button>
		       	</div>
		   		<br>
	   	
	   	 <div class="pageInfo_wrap" >
	        	<div class="pageInfo_area">
	        		<ul id="pageInfo" class="pageInfo pagination">
		                <!-- 이전페이지 버튼 -->
		                <c:if test="${pageMaker.prev}">
		                    <li class="pageInfo_btn previous page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
		                </c:if>
		        		<!-- 각 번호 페이지 버튼 -->
		                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                    <li class="pageInfo_btn page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
		                </c:forEach>
		                <!-- 다음페이지 버튼 -->
		                <c:if test="${pageMaker.next}">
		                    <li class="pageInfo_btn next page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
		                </c:if>    
	        		</ul>
	        	</div>
	    	</div>
	    	
<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
  
            <div class="table_content">
              <table class="table">
                <thead>
                  <tr>
                    <th class="">번호</th>                    
                    <th class="">구분</th>
                    <th class="">제목</th>
                    <th class="">작성일</th>
                    <th class="">조회수</th>
                    <th class=""></th>
                    
                  </tr>
                </thead>
                
                <tbody>
	          	<c:choose>
	       		  <c:when test="${!empty boardList}">
				    <c:forEach items="${boardList}" var="board">
	                  <tr>
	                    <td class="text-center">${board.num}</td>
	                    <td class="text-center">${board.boardSubCategory}</td>
	                    <td class="text-center">${board.boardTitle}</td>
	                    <td class="text-center"><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
	                    <td class="text-center">${board.boardCnt}</td>
	                    <td class="text-center dropdown">
	                      <i class="bi bi-three-dots-vertical"
	                          id="dropdownMenuButton1"
	                          data-bs-toggle="dropdown"
	                          aria-expanded="false">
	                      </i>
	                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	                        <li><a class="dropdown-item" href="#">이동</a></li>
	                        <li><a class="dropdown-item" href="/admin/notice/update/${board.boardSeq}">수정</a></li>
	                        <li><a class="dropdown-item" onclick="noticeDelete(${board.boardSeq});">삭제</a></li>
	                      </ul>
	                    </td>
	                  </tr>
				    </c:forEach>
		          </c:when>       
	     	    </c:choose>
                </tbody>
                
              </table>
            </div>

            <div class="notice_btn d-flex justify-content-end">
              <a href="/admin/notice/insert" type="button" class="btn btnAuthentication">글쓰기</a>
            </div>
            </article>
        </section>
      </main>
    </div>
  </div>
  
    <form id="moveForm" method="get">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
  
<script type="text/javascript">

	let moveForm = $("#moveForm");
	
	$(".pageInfo a").on("click", function(e){
	       e.preventDefault();
	       moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	       moveForm.attr("action", "/admin/notice");
	       moveForm.submit();
	});
	
	$(".search_area button").on("click", function(e){
	  e.preventDefault();
	  let val = $("input[name='keyword']").val();
	  moveForm.find("input[name='keyword']").val(val);
	  moveForm.find("input[name='pageNum']").val(1);
	  moveForm.submit();
	});

function noticeDelete(seq) {;
	const data = { "boardSeq" : seq};
	alert(seq);
	if(window.confirm("글을 삭제 하시겠습니까?")){
		$.ajax({
		    url : "/admin/notice/delete",
		    type :'post',
		    data : JSON.stringify(data),
		    dataType : "json",
		    contentType : "application/json",
		    async : true,
		    success : function(result){
		        if(result == 0){
		            window.location.href = "/admin/notice";
		        } else {
		        	alert("실패");
		        	return;
		        }
		    },
		    error : function(errorThrown){
		     alert(errorThrown.statusText);
		  }
		 });
	}
}
</script>
</body>
</html>