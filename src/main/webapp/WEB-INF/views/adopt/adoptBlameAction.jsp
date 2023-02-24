<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 공동 링크 모음 -->
<jsp:include page="../fix/link.jsp"></jsp:include>

<title>신고글 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<!-- 디자인 전부 임시 -->
<div class="wrap container">

    <section>
      <h2>신고글 작성</h2>
 
      <article class="blame_content">
        <form action="/adopt/insert/blaContent" method="post">
        
          <!-- 신고자 유저 시퀀스 -->	
	      <input type="hidden" name="req_userSeq" value="${blaSeq.req_userSeq}">
          <!-- 피신고자 유저 시퀀스 -->	
	      <input type="hidden" name="res_userSeq" value="${blaSeq.res_userSeq}">
	      <!-- 보드 시퀀스 -->
	       <input type="hidden" name="boardSeq" value="${blaSeq.boardSeq}">
              
              
          <div class="mb-3">
		      <label class="form-label">제목</label>
		      <input type="text" class="form-control" placeholder="신고글의 제목을 입력하세요" name="blaTitle">
   	  	  </div>
   	  	  
   	  	  
   	  	  <div class="mb-3">
			  <label class="form-label">신고내용</label>
			  <textarea class="form-control" name="blaContent" rows="7" placeholder="신고글의 내용을 입력하세요"></textarea>
	 	  </div> 
           
          <div class="btn-group">        
         	 <input class="btn btn-dark" style="width:1000px; height:80px; align-content:center;" type="submit" value="신고하기">
          	 <button type="button" class="btn btn-secondary" style="width:300px; height:80px;"><a style="color:white;" href="/adopt/list">목록으로</a></button>
          </div>
        
        </form>
        </article>
    </section>
   	
</div>
<script type="text/javascript">
// 오늘 날짜 가져오기
var now_utc = Date.now()
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>