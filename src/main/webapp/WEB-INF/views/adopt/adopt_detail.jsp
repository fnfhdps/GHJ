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
	
	<section class="xg0zir1 undefined">
	  <div class="swiper swiper-initialized swiper-horizontal swiper-pointer-events _14tcepa0 swiper-backface-hidden">
	    <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal swiper-pagination-lock">
	      <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
	    </div>
	    <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
	      <div class="swiper-slide swiper-slide-active" style="width: 768px;">
	        <div class="_14tcepa4">
	          <span style="box-sizing:border-box;display:block;overflow:hidden;width:initial;height:initial;background:none;opacity:1;border:0;margin:0;padding:0;position:absolute;top:0;left:0;bottom:0;right:0">
	            <img alt="" src="/resources/image/adopt/${adoptDetail.adoptImg}" class="_19qbbiq0 _19qbbiq1" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover">
	          </span>
	        </div>
	      </div>
	    </div>
	  </div>
	
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
	            <input type="hidden" id="heartCnt">
	            <a id="heart" onclick="checkHeart()"><i id="heartIcon"></i></a>
	          </div>
			  <div class="ms-4">
	            <input type="hidden" id="blameCnt" value="${blame}">
	            <a id="blame" onclick="checkBlame()"><i class="bi bi-exclamation-triangle-fill"></i></a>
			  </div>
	      </div>

	  </section>
	    
	    <div class="vpgu1n0"></div>
	
	    <section class="dajteg0">
	      <h1 class="dajteg1">제목
	        <span class="dajteg2">입양대기</span>
	      </h1>
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
	          <div class="c1kbeo1 c1kbeo2 fw-bold">중성화&nbsp;&nbsp;- </div>
	          <div class="c1kbeo1 c1kbeo2">${adoptDetail.adoptNeutor}</div>
	        </div>
	
	      </div>
	    </section>
	
	    <section class="_1ff3f300">
	      <h2 class="_1ff3f301">특이사항 및 상세 설명</h2>
	      <p class="_1rxa1o40">${adoptDetail.boardContent}</p>
	
	      <div class="d-flex justify-content-between pt-5">
	        <p id="article-counts" class="reply_text">관심 34 ∙ 신청 45 ∙ 조회 ${adoptDetail.boardCnt} </p>
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
	        		class="btn btn-warning"
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
	              <button class="btn btn-outline-secondary"
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
		          	<c:when test="${!empty login.userImg}">
		            	<img id="profile" src="/resources/image/profile/${login.userImg}" alt="" style="width: 100%; height: 100%;">
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
	                    		class="update_content btn btn-outline-secondary mb-4"
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
	    
	    <article>
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