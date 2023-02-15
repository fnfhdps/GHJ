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
        <form action="/adopt/new" method="post">
        
          <!-- 유저 시퀀스 -->	
	      <input type="hidden" name="userSeq" value="${login.userSeq}">
	      <!-- 입양 상태 -->
	      <input type="hidden" name="adoptState" value="WAIT">
	      <!-- 카테고리 구분 -->
          <input type="hidden" name="boardCategory" value="ADOPT">
              
              
          <div>
          	 <label class="col-sm-2 col-form-label">이미지</label>
           	 <div class="col-md-5">
              <input type="text" name="adoptImg">
         	 </div> 
         </div>   
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">종류</label>
            <div class="col-md-5">
            <select name="adoptKind">
			  <option value='' selected>-- 선택 --</option>
			  <option value='DOG'>강아지</option>
			  <option value='CAT'>고양이</option>
			  <option value='ETC'>기타</option>
			</select>
            </div>
          </div>
          
           <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">성별</label>
            <div class="col-md-5">
             <select name="adoptSex">
			  <option value="" selected>-- 선택 --</option>
			  <option value="F">암컷</option>
			  <option value="M">수컷</option>
			</select>
            </div>
          </div>
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">제목</label>
            <div class="col-md-5">
              <input type="text" name="boardTitle">
            </div>
          </div>
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">구조일</label>
            <div class="col-md-5">
              <input type="date" id="rescueDate" name="adoptRescueDate">
            </div>
          </div>
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">나이</label>
            <div class="col-md-5">
             <input name="adoptAge"
					type="number"
					min="1"
					max="100"
					value="1">
            </div>
          </div>
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">몸무게</label>
            <div class="col-md-5">
            <input name="adoptWeight"
					type="number"
					min="1"
					max="100"
					value="1">
            </div>
          </div>
          
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">구조위치</label>
            <div class="col-md-5">
              <input type="text" name="adoptAddr">
            </div>
          </div>
          
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">중성화</label>
            <div class="col-md-5">
             <select name="adoptNeutor">
			  <option value="" selected>-- 선택 --</option>
			  <option value="O">O</option>
			  <option value="X">X</option>
			  <option value='UNKNOWN'>알수없음</option>
			</select>
            </div>
          </div>
          
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">특이사항</label>
            <div class="col-md-5">
              <textarea name="boardContent"></textarea>
            </div>
          </div>
          
          <input type="submit" value="등록하기">
        </form>
          <button type="button" class="btn btn-secondary"><a href="/adopt/list">목록으로</a></button>
        </article>
    </section>

    <jsp:include page="../fix/footer.jsp"></jsp:include>
   	
</div>

<script type="text/javascript">
	// 오늘 날짜 가져오기
	// 구조일: 오늘 이후로 선택이 안 되도록 설정
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("rescueDate").setAttribute("max", today);
</script>
</body>
</html>