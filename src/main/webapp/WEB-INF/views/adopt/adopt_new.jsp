<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 공동 링크 모음 -->
<jsp:include page="../fix/link.jsp"></jsp:include>

<title>입양글 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<!-- 디자인 전부 임시 -->
<div class="wrap container">

    <jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>
    
    <section>
      <h2>입양글 작성</h2>
 
      <article class="mypage_content">
        <form id="adoptForm" action="/adopt/new" method="post">
        
          <!-- 유저 시퀀스 -->	
	      <input type="hidden" name="userSeq" value="${login.userSeq}">
	      <!-- 입양 상태 -->
	      <input type="hidden" name="adoptState" value="WAIT">
	      <!-- 카테고리 구분 -->
          <input type="hidden" name="boardCategory" value="ADOPT">
      <br><br>      
      <div>
		  <label for="formFileLg" class="form-label">이미지 첨부</label>
		  <input class="form-control form-control-lg" id="formFileLg" type="file" name="adoptImg" value="${adoptDetail.adoptImg}">
	  </div>
	  
	  <div class="mb-3">
	      <label for="disabledSelect" class="form-label">종류</label>
	      <input type="hidden" id="adoptKind" value="${adoptDetail.adoptKind}">
	      <select id="disabledSelect" class="form-select" name="adoptKind">
	        	<option value='' selected>-- 선택 --</option>
				<option value='DOG'>강아지</option>
				<option value='CAT'>고양이</option>
				<option value='ETC'>기타</option>
	      </select>
      </div>
      
       <div class="mb-3">
	      <label for="disabledSelect" class="form-label">성별</label>
	      <input type="hidden" id="adoptSex" value="${adoptDetail.adoptSex}">
	      <select id="disabledSelect" class="form-select" name="adoptSex">
        		<option value="" selected>-- 선택 --</option>
			    <option value="F">암컷</option>
			    <option value="M">수컷</option>
	      </select>
      </div>
      
      <div class="mb-3">
	      <label for="disabledTextInput" class="form-label">제목</label>
	      <input type="text" id="disabledTextInput" class="form-control" placeholder="제목" name="boardTitle" value="${adoptDetail.boardTitle}">
   	  </div> 
          
      <div class="mb-3">
            <label class="form-label">구조일</label>
            <div class="col-sm-2 col-form-label">
              <input type="date" id="rescueDate" name="adoptRescueDate" class="form-control"
              		value="<fmt:formatDate value="${adoptDetail.adoptRescueDate}" pattern="yyyy-MM-dd"/>">
            </div>
   	  </div>
   	  
   	  <div class="mb-3 row">
            <label class="form-label">나이</label>
            <div class="col-sm-2 col-form-label">
            <input class="form-control"
             	   name="adoptAge"
				   type="number"
				   min="1"
				   max="100"
				   value="${adoptDetail.adoptAge}">
            </div>
       </div>
          
       <div class="mb-3 row">
            <label class="form-label">몸무게</label>
            <div class="col-sm-2 col-form-label">
            <input class="form-control"
             	   name="adoptWeight"
				   type="number"
				   min="1"
				   max="100"
				   value="${adoptDetail.adoptWeight}">
            </div>
       </div>   
          
       <div class="mb-3">
	      <label for="disabledTextInput" class="form-label">구조위치</label>
	      <input type="text" id="disabledTextInput" class="form-control" placeholder="구조위치" name="adoptAddr" value="${adoptDetail.adoptAddr}">
   	  </div>     
          
      <div class="mb-3">
	      <label for="disabledSelect" class="form-label">중성화 여부</label>
	      <input type="hidden" id="adoptNeutor" value="${adoptDetail.adoptNeutor}">
	      <select id="disabledSelect" class="form-select" name="adoptNeutor">
       		  <option value="" selected>-- 선택 --</option>
		      <option value="O">O</option>
			  <option value="X">X</option>
			  <option value="IDK">알수없음</option>
	      </select>
      </div>    
          
      <div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">특이사항</label>
		  <textarea class="form-control" name="boardContent" rows="7">${adoptDetail.boardContent}</textarea>
	  </div>
	  <br>
	  <div class="btn-group">
	        <input class="btn btn-dark" style="width:1000px; height:80px;" type="submit" value="등록하기">
	        <button type="button" class="btn btn-secondary" style="width:300px; height:80px;"><a style="color:white;" href="/adopt/list">목록으로</a></button>
     </div>
     <br><br>   
          
        </form>
        </article>
    </section>

    <%-- <jsp:include page="../fix/footer.jsp"></jsp:include> --%>
   	
</div>

<script type="text/javascript">
	// 오늘 날짜 가져오기
	// 구조일: 오늘 이후로 선택이 안 되도록 설정
	let now_utc = Date.now()
	let timeOff = new Date().getTimezoneOffset()*60000;
	let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("rescueDate").setAttribute("max", today);
	document.getElementById("rescueDate").value = today;
	
	
	// 입양글 폼 null checking
	function nullchk(tag) {
		let cnt = 0;
		tag.each(function () {
			value = $(this).val();
			//alert(value);
			if(value == ""){
				cnt = cnt+ 1;
			}
		});			
		return cnt;
	};
	
	$("#adoptSbm").click(function () {
		let value = "";
		let tags = [];
		tags[0] = $("#adoptForm").find('input');
		tags[1] = $("#adoptForm").find('select');
		tags[2] = $("#adoptForm").find('textarea');
	
		let nullCnt = 0;
		tags.forEach(function(tag) {
			nullCnt += nullchk(tag);
		});
		//alert("총숫자: "+nullCnt);
		if(nullCnt > 0){
			alert("작성하지 않은 항목이 있습니다.");
		}else{
			$("#adoptForm").submit();
		}
	});

</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>