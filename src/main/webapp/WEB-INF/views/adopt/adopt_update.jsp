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
      <h2 class="adopt_title">입양글 수정</h2>
      <article class="adopt_content d-flex justify-content-center">
        <form class="px-5" id="adoptForm" action="/adopt/update" method="post" enctype="multipart/form-data">
          
          <!-- board 시퀀스 -->
          <input type="hidden" name="boardSeq" value="${adoptDetail.boardSeq}" readonly="readonly">          
          <input type="hidden" name="userSeq" value="${adoptDetail.userSeq}" readonly="readonly">
     	  <br><br>
     	  
	      <div class="mb-3">
		      <label for="disabledTextInput" class="form-label">제목</label>
		      <input type="text"
		      		id="disabledTextInput"
		      		class="form-control"
		      		name="boardTitle"
		      		value="${adoptDetail.boardTitle}">
	   	  </div> 
			    
	      <div class="mb-3">
		      <label for="disabledSelect" class="form-label">구분</label>
		      <input type="hidden" id="adoptKind" value="${adoptDetail.adoptKind}">
		      <select id="kind_select" class="form-select" name="adoptKind">
		        	<option value='' selected>-- 선택 --</option>
					<option value='DOG'>강아지</option>
					<option value='CAT'>고양이</option>
					<option value='ETC'>기타</option>
		      </select>
	      </div>
			    
	      <div class="mb-3">
		      <label for="disabledSelect" class="form-label">성별</label>
		      <input type="hidden" id="adoptSex" value="${adoptDetail.adoptSex}">
		      <select id="sex_select" class="form-select" name="adoptSex">
	        		<option value="" selected>-- 선택 --</option>
				    <option value="F">암컷</option>
				    <option value="M">수컷</option>
		      </select>
	      </div>
	      
	   	  <div class="mb-3">
	            <label class="form-label">구조일</label>
	            <div class="col-xl-4 col-lg-3 col-form-label">
	              <input type="date" id="rescueDate" name="adoptRescueDate" class="form-control"
	              		value="<fmt:formatDate value="${adoptDetail.adoptRescueDate}" pattern="yyyy-MM-dd"/>">
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
					   value="${adoptDetail.adoptAge}">
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
					   value="${adoptDetail.adoptWeight}">
	            </div>
	       </div>
	       
     	  <div class="mb-3">
		      <label for="disabledTextInput" class="form-label">구조위치</label>
		      <input type="text" id="disabledTextInput" class="form-control" name="adoptAddr" value="${adoptDetail.adoptAddr}">
	   	  </div> 
	   	  
	   	  <div class="mb-3">
		      <label for="disabledSelect" class="form-label">중성화 여부</label>
		      <input type="hidden" id="adoptNeutor" value="${adoptDetail.adoptNeutor}">
		      <select id="neutor_select" class="form-select" name="adoptNeutor">
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

		  <div class="mb-2">
			<img alt="" src="/resources/image/adopt/${adoptDetail.adoptImg}" style="height: 150px;">
		  </div>
	      <div class="mb-3">
			  <label for="formFileLg" class="btn btn-light">이미지 첨부</label>
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

	// adoptKind 값 가져와서 select 하기
	var kind = $("#adoptKind").val();
	if(kind == "DOG"){
		$('#kind_select').val('DOG').prop("selected",true);
	}else if(kind == "CAT"){
		$('#kind_select').val('CAT').prop("selected",true);
	}else{
		$('#kind_select').val('ETC').prop("selected",true);
	}
	
	// adoptSex 값 가져와서 select 하기
	var sex = $("#adoptSex").val();
	if(sex == "F"){
		$('#sex_select').val('F').prop("selected",true);
	}else if(sex == "M"){
		$('#sex_select').val('M').prop("selected",true);
	}
	
	// adoptKind 값 가져와서 select 하기
	var neutor = $("#adoptNeutor").val();
	if(neutor == "O"){
		$('#neutor_select').val('O').prop("selected",true);
	}else if(neutor == "X"){
		$('#neutor_select').val('X').prop("selected",true);
	}else{
		$('#neutor_select').val('IDK').prop("selected",true);
	}
	
	// 오늘 날짜 가져오기
	// 구조일: 오늘 이후로 선택이 안 되도록 설정
	let now_utc = Date.now()
	let timeOff = new Date().getTimezoneOffset()*60000;
	let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("rescueDate").setAttribute("max", today);
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>