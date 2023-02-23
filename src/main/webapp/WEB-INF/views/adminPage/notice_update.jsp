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

<!-- qna form css -->
<link rel="stylesheet" href="/resources/css/cs_form.css">
<title>관리자: 공지사항등록</title>
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

        <section class="member_container notice_container">
        
        
          <div class="css-mieii2 e1yarwt10">
            <form action="/admin/notice/update" method="post">
              <!-- 시퀀스 모음 -->
              <input type="hidden" name="boardCategory" value="NOTICE">
			  <!-- 테스트 시퀀스!!! 나중에 login.userSeq로 바꾸기 -->
              <input type="hidden" name="userSeq" value="11">
              <input type="hidden" name="boardSeq" value="${notice.boardSeq}">
            
		      <div class="css-lkffw3 e1yarwt9">
		        <div id="" width="343" class="css-1v6bcwv e1yarwt7">
		          <div class="_3Bt8k">
		            <select class="_3ASDR _1qwAY _3K8Q8 css-1dwz3w6 e3x1g180" id="board_subCategory" name="boardSubCategory">
		              <option value="" selected>-- 문의 유형 --</option>
		              <option value="서비스">서비스</option>
		              <option value="업데이트">업데이트</option>
		              <option value="이벤트">이벤트</option>
		            </select>
		            <svg width="1em" height="1em" viewBox="0 0 10 10" fill="currentColor" class="IgBXR">
		              <path d="M0 3l5 5 5-5z"></path>
		            </svg>
		          </div>
		        </div>
		      </div>
              <div class="css-lkffw3 e1yarwt9">
                <div width="343" class="css-1v6bcwv e1yarwt7">
                  <input class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" value="${notice.boardTitle}" name="boardTitle" placeholder="제목">
                </div>
              </div>
              <div class="css-lkffw3 e1yarwt9 css-1v6bcwv">
                <textarea class="_3ASDR _1qwAY css-1xrt6sk e1rxfajn1" name="boardContent" maxlength="500" style="overflow: hidden; overflow-wrap: break-word; height: 300px;">
                	${notice.boardContent}
                </textarea>
              </div>
              <!-- <div class="css-lkffw3 e1yarwt9">
                <label class="css-6lgku7 e12vmj862">
                  <span class="css-h26ndt e12vmj861">
                    <span>nav_logo2.png</span>
                  </span>
                  <span class="css-94jutt e12vmj860">첨부파일</span>
                  <input type="file" name="file" hidden="">
                </label>
              </div> -->
              <div class="css-1bkpu5b e1yarwt5 css-1v6bcwv">
                <button class="_1eWD8 _3SroY _27do9 css-1pz165y e1yarwt0" type="submit">제출하기</button>
              </div>
            </form>
          </div>
        </section>

      </main>
    </div>
  </div>
	<input id="boardSubCategory" type="hidden" value="${notice.boardSubCategory}">
	
<script type="text/javascript">
	const boardSubCategory = $("#boardSubCategory").val();
	if(boardSubCategory == "서비스"){
		$('#board_subCategory').val('서비스').prop("selected",true);
	}else if(boardSubCategory == "업데이트"){
		$('#board_subCategory').val('업데이트').prop("selected",true);
	}else{
		$('#board_subCategory').val('이벤트').prop("selected",true);
	}
	
	// 공백 체크 아직 수정 안했음!!!
	$("#qna_submit").click(function() {
		if($("#board_subCategory").val() == ''){
			alert("유형을 선택해주세요.");
		}else if($("#board_title").val() == ''){
			alert("제목을 입력해주세요.");
		}else if($("#board_content").val() == 0){
			alert("내용을 입력해주세요.");
		}else {
			$("#qna_form").submit();
		}
	});
</script>
</body>
</html>