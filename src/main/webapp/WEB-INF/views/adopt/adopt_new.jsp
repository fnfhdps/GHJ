<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 입양 폼 css -->
<link rel="stylesheet" href="/resources/css/adopt_form.css">
<title>입양글 작성</title>
</head>
<body>
<!-- 디자인 전부 임시 -->
<div class="wrap">

    <jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>
    
    <section class="container-xxl py-5">
      <h2 class="adopt_title">입양글 작성</h2>
 
      <article class="adopt_content d-flex justify-content-center">
        <form class="px-5" id="adoptForm" action="/adopt/new" method="post" enctype="multipart/form-data">
          <!-- 유저 시퀀스 -->	
	      <input type="hidden" name="userSeq" value="${login.userSeq}">
	      <br><br>      
	      	      
	      <div class="mb-3">
		      <label for="disabledTextInput" class="form-label">제목</label>
		      <input type="text"
		      		id="disabledTextInput"
		      		class="form-control"
		      		placeholder="제목"
		      		name="boardTitle"
		      		value="임시 제목">
	   	  </div> 

		  <div class="mb-3">
		      <label for="disabledSelect" class="form-label">구분</label>
		      <input type="hidden" id="adoptKind">
		      <select id="disabledSelect" class="form-select" name="adoptKind">
		        	<option value='' selected>-- 선택 --</option>
					<option value='DOG'>강아지</option>
					<option value='CAT'>고양이</option>
					<option value='ETC'>기타</option>
		      </select>
	      </div>
	      
	       <div class="mb-3">
		      <label for="disabledSelect" class="form-label">성별</label>
		      <input type="hidden" id="adoptSex">
		      <select id="disabledSelect" class="form-select" name="adoptSex">
	        		<option value="" selected>-- 선택 --</option>
				    <option value="F">암컷</option>
				    <option value="M">수컷</option>
		      </select>
	      </div>
	          
	      <div class="mb-3">
	            <label class="form-label">구조일</label>
	            <div class="col-xl-4 col-lg-3 col-form-label">
	              <input type="date" id="rescueDate" name="adoptRescueDate" class="form-control">
	            </div>
	   	  </div>
	   	  
	   	  <div class="mb-3 row">
	            <label class="form-label">나이</label>
	            <div class="col-lg-3 col-form-label">
	            <input class="form-control"
	             	   name="adoptAge"
					   type="number"
					   min="1"
					   max="100"
					   value="1">
	            </div>
	       </div>
	          
	       <div class="mb-3 row">
	            <label class="form-label">몸무게</label>
	            <div class="col-lg-3 col-form-label">
	            <input class="form-control"
	             	   name="adoptWeight"
					   type="number"
					   min="1"
					   max="100"
					   value="1">
	            </div>
	       </div>   
	          
	       <div class="mb-3">
		      	<label class="form-label">구조위치</label>
		      	<div class="d-flex">
				    <select class="form-control" name="adoptAddr" id="adoptAddr"></select>
				    <select class="form-control" name="addressDo" id="addressDo2"></select>
				    <select class="form-control" name="addressSiGunGu" id="addressSiGunGu2"></select>
		      	</div>
	   	  </div>     
	          
	      <div class="mb-3">
		      <label class="form-label">중성화 여부</label>
		      <input type="hidden" id="adoptNeutor">
		      <select id="disabledSelect" class="form-select" name="adoptNeutor">
	       		  <option value="" selected>-- 선택 --</option>
			      <option value="O">O</option>
				  <option value="X">X</option>
				  <option value="IDK">알수없음</option>
		      </select>
	      </div>    
	          
	      <div class="mb-3">
		  	<label class="form-label">특이사항</label>
			<textarea class="form-control" name="boardContent" rows="7">임시 특이사항</textarea>
		  </div>
		  
	      <div class="mb-3">
			  <label for="formFileLg" class="btn btn-light ">이미지 첨부</label>
			  <input id="formFileLg" type="file" name="adoptFiles" multiple accept="image/*" hidden=""> 
		  </div>
		  
		  <br>
		  <div class="row">
			<input class="btn btn-dark col-8"
					id="adoptSbm"
					type="submit"
					value="등록하기"
					style="height:80px;">
			<input class="btn btn-secondary col-4"
					type="button"
					value="목록으로"
					style="height:80px;
					color:white;"
					onclick="location.href='/adopt/list'">
	      </div>
	     
	      <br><br>   
        </form>
      </article>
    </section>

    <jsp:include page="../fix/footer.jsp"></jsp:include>
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
			return;
		}else{
			$("#adoptForm").submit();
		}
	});
</script>
<!-- 구조 위치 js -->
<script src="/resources/js/adopt_addr.js"></script>
</body>
</html>