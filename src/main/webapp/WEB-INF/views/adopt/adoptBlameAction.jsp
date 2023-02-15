<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 공동 링크 모음 -->
<jsp:include page="../fix/link.jsp"></jsp:include>

<title>신고글 작성</title>
</head>
<body>
<!-- 디자인 전부 임시 -->
<div class="wrap container">

    <section>
      <h2>신고글 작성</h2>
 
      <article class="blame_content">
        <form action="/adopt/insert/blaContent" method="post">
        
          <!-- 신고자 유저 시퀀스 -->	
	      <input type="text" name="req_userSeq" value="${blaSeq.req_userSeq}">
          <!-- 피신고자 유저 시퀀스 -->	
	      <input type="text" name="res_userSeq" value="${blaSeq.res_userSeq}">
	      <!-- 보드 시퀀스 -->
	       <input type="text" name="boardSeq" value="${blaSeq.boardSeq}">
              
              
          <div>
          	 <label class="col-sm-2 col-form-label">제목</label>
           	 <div class="col-md-5">
              <input type="text" name="blaTitle">
         	 </div> 
         </div>   
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">신고내용</label>
            <div class="col-md-5">
              <textarea name="blaContent"></textarea>
            </div>
          </div>
          
          <input type="submit" value="신고하기">
        </form>
        </article>
    </section>
   	
</div>
<script type="text/javascript">
// 오늘 날짜 가져오기
var now_utc = Date.now()
</script>
</body>
</html>