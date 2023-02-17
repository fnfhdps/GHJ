<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  .qna_content{
    /* background-color: aqua; */
    height: 100%;
  }
  .qna_content form{
    /* background-color: bisque; */
    position: relative;
    height: 400px;
  }
  #qna_write{
    position: relative;
    top: 20px;
    left: 100px;
    width: 600px;
  }

  #qna_write input{
    height: 50px;
  }

  #qna_write textarea{
    resize: none;
  }

  #qna_write_btn{
    position: absolute;
    left: 585px;
    bottom: 0;

  }
</style>
  
<title>1:1문의사항/글쓰기</title>
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
          <form id="qna_form" action="/mypage/qna/new" method="post">
          	<div id="qna_write">
          		<!-- 시퀀스 -->
            	<input type="hidden" name="boardCategory" value="QNA">
            	<input type="hidden" name="userSeq" value="${login.userSeq}">
				<select class="form-control" id="board_title" name="boardTitle">
				    <option value="" selected>선택</option>
				    <option value="adopt">입양문의</option>
				    <option value="sponsor">후원문의</option>
				    <option value="return">반품/환불문의</option>
				    <option value="report">신고문의</option>
				    <option value="etc">기타문의</option>
				</select>
	          	<br>
	            <textarea class="form-control" cols="30" rows="10" id="board_content" name="boardContent" placeholder="내용을 입력해주세요">${qnaDetail.boardContent}</textarea>
            </div>
            <div id="qna_write_btn">
              <button id="qna_submit" type="button" class="btn btn-secondary">등록</button>
              <button type="reset" class="btn btn-secondary">취소</button>
            </div>
          </form>
        </div>
      </section>
    </div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
<script type="text/javascript">

	// 공백 체크
	$("#qna_submit").click(function() {
		if($("#board_title").val() == ''){
			alert("제목을 선택해주세요");
		}else if($("#board_content").val() == 0){
			alert("내용을 입력해주세요.");
		}else {
			$("#qna_form").submit();
		}
	});
</script>
</body>
</html>