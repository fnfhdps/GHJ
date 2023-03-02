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
      
       <article class="adopt_content d-flex justify-content-center pb-5 pt-3 mb-2">
    	 <div class="adoptForm">

			<div class="accordion" id="accordionExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        여기 뭐라고 쓰냐
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <strong>필독 안내!</strong>
			        	입소전 보호시설과 시스템을 눈으로 꼭 확인해주시는 것이 가장 중요하며, 보호기간 동안에는 면회 등 정보열람이 가능한 것은 물론, 철저한 입양 심사와 입양 후 사후관리 및 정보열람을 제공함으로써 안심하고 맡길 수 있습니다. 또한, 자택 방문 안전 진단 홈케어 서비스를 통해 타 보호소 대비 차별화된 시스템으로 아이의 입양 후 소식, 상태, 정보 등을 확인해드리고 있습니다.
			      	<div class="guide">
			      		주의사항을 숙지했습니다.<input type="checkbox" >
			      	</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			        Accordion Item #2
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <strong>안내 어쩌고</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
			      	<div class="guide">
			      		주의사항을 숙지했습니다.<input type="checkbox" >
			      	</div>
			      </div>
			    </div>
			  </div>
		   	</div>

         </div>
       </article>
      
      <article class="adopt_content d-flex justify-content-center">
        <form class="px-5 adoptForm" action="/adopt/update" method="post" enctype="multipart/form-data">
          
          <!-- board 시퀀스 -->
          <input type="hidden" name="boardSeq" value="${adoptDetail.boardSeq}">          
          <input type="hidden" name="userSeq" value="${adoptDetail.userSeq}">
     	  <br><br>
     	  
	      <div class="mb-4">
		      <label for="disabledTextInput" class="form-label">제목</label>
		      <input type="text"
		      		id="disabledTextInput"
		      		class="form-control"
		      		name="boardTitle"
		      		required="required"
		      		value="${adoptDetail.boardTitle}">
	   	  </div> 
			    
	      <div class="mb-4">
		      <label for="disabledSelect" class="form-label">구분</label>
		      <input type="hidden" id="adoptKind" value="${adoptDetail.adoptKind}">
		      <select id="kind_select" class="form-select" name="adoptKind" required="required">
		        	<option value='' selected>-- 선택 --</option>
					<option value='DOG'>강아지</option>
					<option value='CAT'>고양이</option>
					<option value='ETC'>기타</option>
		      </select>
	      </div>
	      
 	      <div class="mb-4">
 		      <label for="disabledSelect" class="form-label">성별</label>
 		      <input type="hidden" id="adoptSex" value="${adoptDetail.adoptSex}">
 		      <div>
				  <div class="form-check form-check-inline">
				    <input class="form-check-input sex_radio" type="radio" name="adoptSex" id="inlineRadio2" value="M">
				    <label class="form-check-label" for="inlineRadio2">수컷</label>
				  </div>
				  <div class="form-check form-check-inline">
				    <input class="form-check-input sex_radio" type="radio" name="adoptSex" id="inlineRadio1" value="F">
				    <label class="form-check-label" for="inlineRadio1">암컷</label>
			  	  </div>
 		      </div>
 	      </div>
	      
 	      <div class="mb-4">
 		      <label for="disabledSelect" class="form-label">중성화</label>
 		      <input type="hidden" id="adoptNeutor" value="${adoptDetail.adoptNeutor}">
 		      <div>
				  <div class="form-check form-check-inline">
				    <input class="form-check-input neutor_radio" type="radio" name="adoptNeutor" id="inlineRadio1" value="O">
				    <label class="form-check-label" for="inlineRadio1">O</label>
			  	  </div>
				  <div class="form-check form-check-inline">
				    <input class="form-check-input neutor_radio" type="radio" name="adoptNeutor" id="inlineRadio2" value="X">
				    <label class="form-check-label" for="inlineRadio2">X</label>
				  </div>
				  <div class="form-check form-check-inline">
				    <input class="form-check-input neutor_radio" type="radio" name="adoptNeutor" id="inlineRadio3" value="IDK">
				    <label class="form-check-label" for="inlineRadio3">?</label>
			  	  </div>
 		      </div>
 	      </div>
	      
	   	  <div class="mb-4">
	            <label class="form-label">구조일</label>
	            <div class="col-xl-4 col-lg-3 col-form-label">
	              <input type="date" id="rescueDate" name="adoptRescueDate" class="form-control" required="required"
	              		value="<fmt:formatDate value="${adoptDetail.adoptRescueDate}" pattern="yyyy-MM-dd"/>">
	            </div>
	   	  </div>
	   	  
	   	   <div class="mb-4 row">
	            <label class="form-label">나이<small>(추정)</small></label>
	            <div class="col-lg-3 col-form-label">
	            <input class="form-control"
	             	   name="adoptAge"
					   type="number"
					   min="1"
					   max="100"
					   value="${adoptDetail.adoptAge}">
	            </div>
	       </div>
	       
	       <div class="mb-4 row">
	            <label class="form-label">몸무게<small>(추정)</small></label>
	            <div class="col-lg-3 col-form-label">
	            <input class="form-control"
	             	   name="adoptWeight"
					   type="number"
					   min="1"
					   max="100"
					   value="${adoptDetail.adoptWeight}">
	            </div>
	       </div>
	       
	       <div class="mb-4">
		      	<label class="form-label">구조위치</label>
		      	<div class="d-flex">
				    <select class="form-control me-3" name="adoptAddr11" id="adoptAddr"></select>
				    <select class="form-control me-3" name="addressDo" id="addressDo2"></select>
				    <select class="form-control" name="addressSiGunGu" id="addressSiGunGu2"></select>
		      	</div>
	   	  </div>  	       

     	  <div class="mb-4">
		      <label for="disabledTextInput" class="form-label">구조위치</label>
		      <input type="text" id="disabledTextInput" class="form-control" name="adoptAddr" value="${adoptDetail.adoptAddr}" required="required">
	   	  </div> 

	      <div class="mb-4">
			  <label for="exampleFormControlTextarea1" class="form-label">특이사항</label>
			  <textarea class="form-control" name="boardContent" rows="7">${adoptDetail.boardContent}</textarea>
		  </div>

		  <div class="mb-3">
			<img id="img_read" alt="" src="/resources/image/adopt/${adoptDetail.adoptImg}" style="width: 200px; height: 200px;">
		  </div>
	      <div class="mb-4">
			  <label for="formFileLg" class="btn btn-light">이미지 첨부</label>
			  <input id="formFileLg" type="file" name="adoptFiles" multiple accept="image/*" onchange="readURL(this);" hidden="">
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
	const kind = $("#adoptKind").val();
	if(kind == "DOG"){
		$('#kind_select').val('DOG').prop("selected",true);
	}else if(kind == "CAT"){
		$('#kind_select').val('CAT').prop("selected",true);
	}else{
		$('#kind_select').val('ETC').prop("selected",true);
	}
	
	// adoptSex 값 가져와서 select 하기
	const sex = $("#adoptSex").val();
	if(sex == "F"){
		$('.sex_radio').val('F').prop("checked",true);
	}else if(sex == "M"){
		$('.sex_radio').val('M').prop("checked",true);
	}
	
	// adoptKind 값 가져와서 select 하기
	const neutor = $("#adoptNeutor").val();
	if(neutor == "O"){
		$('.neutor_radio').val('O').prop("checked",true);
	}else if(neutor == "X"){
		$('.neutor_radio').val('X').prop("checked",true);
	}else{
		$('.neutor_radio').val('IDK').prop("checked",true);
	}
	
	// 오늘 날짜 가져오기
	// 구조일: 오늘 이후로 선택이 안 되도록 설정
	let now_utc = Date.now()
	let timeOff = new Date().getTimezoneOffset()*60000;
	let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("rescueDate").setAttribute("max", today);
</script>
<!-- 이미지 미리보기 js -->
<script src="/resources/js/readURL.js"></script>
</body>
</html>