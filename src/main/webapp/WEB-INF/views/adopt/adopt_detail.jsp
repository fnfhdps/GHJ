<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 입양 상세 css -->
<link rel="stylesheet" href="/resources/css/adopt_detail.css">
<title>입양 목록 상세 조회</title>
</head>

<body>
<div class="wrap">

	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

	<!-- 캐러셀 적용 이미지  -->
	<section class="xg0zir1 undefined">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="/resources/image/adopt/${adoptDetail.adoptImg}" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="/resources/image/adopt/${adoptDetail.adoptImg2}" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="/resources/image/adopt/${adoptDetail.adoptImg3}" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</section>
	
	<section class="xg0zir1 undefined">
	  <section class="_5w2z0c0">

	      <div class="_7l1omc1">
         	<c:choose>
          	<c:when test="${!empty login.userImg}">
            	<img id="profile" src="/resources/image/profile/${login.userImg}" alt="" style="width: 100%; height: 100%;">
          	</c:when>
          	<c:otherwise>
          		<img id="profile" src="/resources/image/profile/profile.png" alt="" style="width: 100%; height: 100%;">
          	</c:otherwise>
           </c:choose>
	      </div>
	      
	      <div class="_7l1omc3">
	        <div class="_7l1omc4">${adoptDetail.userId}</div>
	        <!-- <div class="_7l1omc2">등촌동(여기 뭐씀)</div> -->
	      </div>
	      
	      
	      <div class="d-flex justify-content-end ms-5 h_b_icon">
		      <div class="">
		       	  <input type="hidden" id="state" value="${adoptDetail.adoptState}">
		          <input type="button" class="btn btn-outline-dark" id="stateupdate" onclick="stateUpdate();"> 
		      </div>
	          <div class="">
	            <input type="hidden" id="heartCnt">
	            <a id="heart" onclick="checkHeart();"><i id="heartIcon"></i></a>
	          </div>
			  <div class="ms-4">
	            <a id="blame" onclick="checkBlame();"><i class="bi bi-exclamation-triangle-fill"></i></a>
			  </div>
	      </div>
	  </section>
	    
	    <div class="vpgu1n0"></div>
	    <section class="dajteg0">
	      <h1 class="dajteg1">${adoptDetail.boardTitle}</h1>
	    </section>
	    
	    <section class="_1ff3f300">
	      <h2 class="_1ff3f301">정보</h2>
	      <div class="nvr536r">
	
	        <div class="c1kbeo0">
	          <i class="bi bi-calendar-date"></i>
	          <div class="c1kbeo1 c1kbeo2 fw-bold">구조일&nbsp;&nbsp;- </div>
	          <div class="c1kbeo1 c1kbeo2">
	          	<fmt:formatDate value="${adoptDetail.adoptRescueDate}" pattern="yyyy-MM-dd"/>
	          </div>
	        </div>
	        <div class="c1kbeo0">
	          <i class="bi bi-geo-alt"></i>
	          <div class="c1kbeo1 c1kbeo2 fw-bold">구조지역&nbsp;&nbsp;- </div>
	          <div class="c1kbeo1 c1kbeo2">${adoptDetail.adoptAddr}</div>
	        </div>
	        <div class="c1kbeo0">
	          <i class="bi bi-funnel"></i>
	          <div class="c1kbeo1 c1kbeo2 fw-bold">구분&nbsp;&nbsp;- </div>
	          <div class="c1kbeo1 c1kbeo2">${adoptDetail.adoptKind}</div>
	        </div>
	        <div class="c1kbeo0">
	          <i class="bi bi-gender-ambiguous"></i>
	          <div class="c1kbeo1 c1kbeo2 fw-bold">성별&nbsp;&nbsp;- </div>
	          <div class="c1kbeo1 c1kbeo2">${adoptDetail.adoptSex}</div>
	        </div>
	        <div class="c1kbeo0">
	          <i class="bi bi-sort-numeric-up-alt"></i>
	          <div class="c1kbeo1 c1kbeo2 fw-bold">
	            	나이<small>(추정)</small>&nbsp;&nbsp;-
	          </div>
	          <div class="c1kbeo1 c1kbeo2">${adoptDetail.adoptAge}살</div>
	        </div>
	        <div class="c1kbeo0">
	          <i class="bi bi-speedometer2"></i>
	          <div class="c1kbeo1 c1kbeo2 fw-bold">
	            	몸무게<small>(추정)</small>&nbsp;&nbsp;-
	          </div>
	          <div class="c1kbeo1 c1kbeo2">${adoptDetail.adoptWeight}Kg</div>
	        </div>
	        <div class="c1kbeo0">
	          <i class="bi bi-clipboard-check"></i>
	          <div class="c1kbeo1 c1kbeo2 fw-bold">
	          		중성화<small>(추정)</small>&nbsp;&nbsp;-
	          </div>
	          <div class="c1kbeo1 c1kbeo2">${adoptDetail.adoptNeutor}</div>
	        </div>
	
	      </div>
	    </section>
	
	    <section class="_1ff3f300 mb-2">
	      <h2 class="_1ff3f301">특이사항 및 상세 설명</h2>
	      <p class="_1rxa1o40">${adoptDetail.boardContent}</p>
	
	      <div class="d-flex justify-content-between pt-5">
	        <p id="article-counts" class="reply_text">관심 3 ∙ 신청 2 ∙ 조회 ${adoptDetail.boardCnt} </p>
	        <div class="text-center dropdown" id="up_del">
	          <i class="bi bi-three-dots-vertical"
	              id="dropdownMenuButton1"
	              data-bs-toggle="dropdown"
	              aria-expanded="false">
	          </i>
	          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	            <li><a class="dropdown-item" id="update" onclick="adoptUpdate();">수정</a></li>
	            <li><a class="dropdown-item" id="delete" onclick="adoptDelete();">삭제</a></li>
	          </ul>
	        </div>
	      </div>
	    </section>
	
	    <article class="pb-5">
	      <div class="d-grid gap-2 col-12 mx-auto">
	        <button type="button"
	        		class="btn btn-outline-dark"
	        		id="hopeCheck"
	        		value="신청하기"
	        		onclick="checkSubmit(); return false;">
	        		신청하기
	        </button>
	      </div>		
	    </article>
	
	    <article>
	      <div class="shadow p-3 mb-5 bg-body rounded">
	        <!-- 댓글 입력 -->
	        <div>
	            <div class="input-group mb-3">
	              <input id="insert_content" type="text" class="form-control" placeholder="댓글을 입력해주세요.">
	              <button class="btn btn-outline-dark"
	              			type="button"
	              			id="button-addon2"
	              			onclick="replyInsert();">
	              			입력
	              </button>
	            </div>
	            <hr>
	        </div>
	        
	    <!-- 댓글 목록, 수정, 삭제 -->
	    <c:forEach items="${replyList}" var="reply">
	        <c:set var="loginUser" value="${login.userSeq}" />
	        <c:set var="replyUser" value="${reply.userSeq}" />
	        
	        <div>
	          <div class="d-flex px-2 reply_title">
	            <!-- 프로필 이미지  -->
	            <div class="_7l1omc1 reply_item">
		         	<c:choose>
		          	<c:when test="${!empty reply.userImg}">
		            	<img id="profile" src="/resources/image/profile/${reply.userImg}" alt="" style="width: 100%; height: 100%;">
		          	</c:when>
		          	<c:otherwise>
		          		<img id="profile" src="/resources/image/profile/profile.png" alt="" style="width: 100%; height: 100%;">
		          	</c:otherwise>
		           </c:choose>
	            </div>
	            <div class="pt-1 ps-3 reply_item">
	                <span class="reply_text">${reply.userId}</span>
	            <c:if test="${replyUser eq loginUser}">
	                <a class="update_btn reply_text" onclick="updateBtn(${reply.replySeq});">수정</a>
	                <a class="delete_btn reply_text" onclick="replyDelete(${reply.replySeq});">삭제</a>
	            </c:if>
	            </div>
	            <div class="reply_item">
	                <fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd"/>
	            </div>
	          </div>
	            <div>
	                <input type="hidden" id="replySeq" value="${reply.replySeq}">
	                <!-- 댓글 -->
	                <p class="pt-3 px-2" id="show_content_${reply.replySeq}">${reply.replyContent}</p>
	                <div class="mb-3"></div>
	                <!-- 수정 누르면 이걸로 바뀜-->
	                <div class="input-group">
	                    <input type="text"
	                    		class="update_content form-control mb-4"
	                    		id="content_${reply.replySeq}"
	                    		value="${reply.replyContent}">
	                    <button type="button"
	                    		class="update_content btn btn-outline-dark mb-4"
	                    		id="button-addon2"
	                    		onclick="replyUpdate(${reply.replySeq},'#content_${reply.replySeq}');">
	                    		입력
	                    </button>
	                </div>
	                
	            </div>
	        </div>
	
	    </c:forEach>
	    </div>
	    </article>
	    
	    <article class="pb-5">
	        <div id="detail_mv">
	            <div>
	                <i class="bi bi-chevron-up"></i>
	                <span>다음글&nbsp;&nbsp;<a id="after"></a></span>
	            </div>
	            <div>
	                <i class="bi bi-chevron-down"></i>
	                <span>이전글&nbsp;&nbsp;<a id="before"></a></span>
	            </div>
	        </div>
	    </article>
	</section>
    <jsp:include page="../fix/footer.jsp"></jsp:include>
</div>

<!-- 신고하기 Modal-->
<div class="modal fade" id="withdrawModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">신고하기</h3>
        <button type="button" class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="bi bi-x-lg"></i></span>
        </button>
      </div>
      <div class="modal-body">
          <div class="modalBody">

	        <form>
	          <div class="mb-4">
			      <label class="form-label">신고사유</label>
			      <select class="form-select" id="blaTitle" required="required">
			        	<option value='' selected>-- 선택 --</option>
						<option value='1'>음란물입니다.</option>
						<option value='2'>불법정보를 포함하고 있습니다.</option>
						<option value='3'>청소년에게 유해한 내용입니다.</option>
						<option value='4'>욕설/생명경시/혐오/차별적 표현입니다.</option>
						<option value='5'>개인정보 노출 개시물입니다,</option>
						<option value='6'>불쾌한 표현이 있습니다.</option>
			      </select>
	   	  	  </div>
	   	  	  <div class="mb-3">
				  <label class="form-label">신고내용</label>
				  <textarea class="form-control" id="blaContent" rows="7" placeholder="신고글의 내용을 입력하세요"></textarea>
		 	  </div> 
	        </form>

          </div>
      </div>
      <div class="modal-footer">
        <div class="px-3">
			<input class="btn btn-dark" type="button" value="신고하기" onclick="insertBlame();">
        </div>
        
      </div>
    </div>
  </div>
</div>

<!-- 시퀀스들 -->
<input type="hidden" id="userSeq" name="userSeq" value="${login.userSeq}">
<input type="hidden" id="boardSeq" name="boardSeq" value="${adoptDetail.boardSeq}">
<input type="hidden" id="detailUserSeq" value="${adoptDetail.userSeq}">
<input type="hidden" id="boardCategory" value="${adoptDetail.boardCategory}">

<!-- 입양 상세 페이지 js -->
<script src="/resources/js/adopt_detail.js"></script>
<!-- 입양 댓글  js -->
<script src="/resources/js/adopt_reply.js"></script>
</body>
</html>