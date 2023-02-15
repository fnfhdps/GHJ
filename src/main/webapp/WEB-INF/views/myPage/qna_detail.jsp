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
    /* background-color: aqua; */
    position: relative;
    height: 100%;
  }

  #qna_write{
    position: relative;
    top: 20px;
    left: 100px;
    width: 600px;
    /* background-color: bisque; */
  }

  #qna_title{
    font-weight: bold;
    font-size: 17px;
  }

  #qna_title span{
    position: absolute;
    font-weight: 100;
    right: 10px;
  }

  .ask_answer{
    position: relative;
    height: 510px;
    /* background-color: aqua; */
  }

  #ask, #answer{
    border-bottom: solid rgba(128, 128, 128, 0.432);
    position: absolute;
    height: 50%;
    width: 600px;
    /* background-color: bisque; */
  }
  #ask{
    border-top: solid rgba(128, 128, 128, 0.432);
  }
  
  #answer{
    top: 50%;
  }
  
  .qna_list_mv{
    display: flex;
    position: absolute;
    bottom: 340px;
    left: 100px;
    /* background-color: darkkhaki; */
    padding-top: -20px;
  }
  
  #qna_mv{
    /* background-color: antiquewhite; */
    width: 500px;
    color: gray;
  }
  #qna_mv div{
    margin-bottom: 10px;
  }

  #qna_mv div span {
    padding: 20px;
  }

  #qna_info_btn{
    margin-left: 40px;
  }
</style>
  
<title>1:1문의사항/답변확인</title>
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
        <article class="qna_content">
          <div id="qna_write">
            <div>
              <p id="qna_title">${qnaDetail.boardTitle}
              <span><fmt:formatDate value="${qnaDetail.boardDate}" pattern="yyyy-MM-dd"/></span></p>
            </div>
            <div class="ask_answer">
              <div id="ask">
                <p><br>
                	${qnaDetail.boardContent}
                <br></p>
              </div>
              
            <c:if test="${!empty reply}">
              <div id="answer">
                <p><br>
				  <c:out value="${reply.replyContent}" />
                <br></p>
              </div>
            </c:if>
            </div>
          </div>

          <div class="qna_list_mv">
            <div id="qna_mv">
              <div>
                <i class="bi bi-chevron-up"></i>
                <span>다음글&nbsp;&nbsp;<a id="after">다음</a></span>
              </div>
              <div>
               	<i class="bi bi-chevron-down"></i>
                <span>이전글&nbsp;&nbsp;<a id="before">이전</a></span>
              </div>
            </div>

            <div id="qna_info_btn">
              <button class="btn btn-secondary" onclick="history.back();">목록</button>
              <c:if test="${empty reply}">
              	<button class="btn btn-secondary" onclick="qnaDelete();">삭제</button>
              </c:if>
            </div>
          </div>
        </article>
      </section>
      
      <input type="hidden" id="boardSeq" value="${qnaDetail.boardSeq}">
      <input type="hidden" id="boardCategory" value="${qnaDetail.boardCategory}">
      <input type="hidden" id="userSeq" value="${login.userSeq}">
    </div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
	const boardSeq = $("#boardSeq").val();
	const boardCategory = $("#boardCategory").val();
	const userSeq = $("#userSeq").val();
	
	let data = null;
	
	function qnaDelete() {
		data = {"boardSeq":boardSeq};
		
		if(window.confirm("삭제 하시겠습니까?")){
			$.ajax({
				url: "/mypage/qna/delete",
				type: "post",
				data: JSON.stringify(data),
				dataType: "json",
				contentType: "application/json",
				async: true,
				success: function(result){
					if(result == 0) {
						alert("삭제 완료");
						window.location.href = "/mypage/qna/"+userSeq;
					} else {
						alert("통신 오류");
						return;
					}
				},
				error : function(errorThrown){
					alert(errorThrown.statusText);
				}
			});
		}
	}
	
// --------------------------------------
	data = {
			boardSeq : boardSeq,
			boardCategory : boardCategory,
			userSeq : userSeq
	};
//	alert("boardSeq:"+boardSeq+"boardCategory:"+boardCategory+"userSeq: "+userSeq);
	
	// 이전글
	$.ajax({
		url: "/before",
		type: "get",
		data: data,
		dataType: "text",
		async: true,
		success: function(result){
			if(result.findSeq == 0) {
				$("#before").text("글이 없습니다").css("color", "gray");
			} else if(result == -1) {
				alert("통신 오류");
				return;
			} else {
				let beforeSeq = result.findSeq;
				let beforeTitle = result.findTitle;
				$("#before").attr("href", "/mypage/qna/get/"+beforeSeq);
				$("#before").text(beforeTitle);
				};
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		},
		dataType: "json"
	});
	
	// 다음글 조회
	$.ajax({
		url: "/after",
		type: "get",
		data: data,
		dataType: "text",
		async: true,
		success: function(result){
			if(result.findSeq == 0) {
				$("#after").text("글이 없습니다").css("color", "gray");
			} else if(result == -1) {
				alert("통신 오류");
				return;
			} else {
				let afterSeq = result.findSeq;
				let afterTitle = result.findTitle;
				$("#after").attr("href", "/mypage/qna/get/"+afterSeq);
				$("#after").text(afterTitle);
			}
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		},
		dataType: "json"
	});
	
	
</script>

</body>
</html>