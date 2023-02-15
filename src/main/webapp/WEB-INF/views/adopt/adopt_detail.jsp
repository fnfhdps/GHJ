<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#adopt_img{
		width: 100px;
		height: 100px;
	}
	
	#blame i{
		color : red;
	}
	
	i{
		width: 50px;
		height: 50px;
	}
</style>

<title>입양 목록 상세 조회</title>
</head>

<body>
<div class="wrap">

	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>
	
	<section class="container">
	<article>
	  <form method="post" id="adopt_form" action="/adopt/hope">
		
		<!-- 시퀀스들 -->
		<input type="hidden" id="userSeq" name="userSeq" value="${login.userSeq}">
		<input type="hidden" id="boardSeq" name="boardSeq" value="${adoptDetail.boardSeq}">
		<input type="hidden" id="detailUserSeq" value="${adoptDetail.userSeq}">
		<input type="hidden" id="boardCategory" value="${adoptDetail.boardCategory}">
		
		<h1>입양 상세 페이지</h1>
		<h3>제목 : ${adoptDetail.boardTitle}</h3>
		
		<div>
			<input type="button" id="stateupdate" value="상태변경" onclick="stateUpdate();"> 
			<input type="button" id="update" value="수정" onclick="adoptUpdate();">
			<input type="button" id="delete" value="삭제" onclick="adoptDelete();">
		</div>
		<hr>		
		<div>
			<img id="adopt_img" alt="" src="${adoptDetail.adoptImg}">
		</div>
		<div>
			<table>
				<tbody>
	                <tr>
	                    <th>보호자</th>
	                    <td>${adoptDetail.userName}(${adoptDetail.userId})</td>
	                </tr>
					<tr>
	                    <th>구조위치</th>
	                    <td>${adoptDetail.adoptAddr}</td>
	                </tr>
	
	                <tr>
	                    <th>구조일</th>
	                    <td>
	                    <fmt:formatDate value="${adoptDetail.adoptRescueDate}" pattern="yyyy-MM-dd"/>
	                    </td>
	                </tr>
	                <tr>
	                    <th>종류</th>
	                    <td>${adoptDetail.adoptKind}</td>
	                </tr>
	                <tr>
	                    <th>성별</th>
	                    <td>${adoptDetail.adoptSex}</td>
	                </tr>
	                <tr>
	                    <th>나이(추정)</th>
	                    <td>${adoptDetail.adoptAge}살</td>
	                </tr>
	                <tr>
	                    <th>몸무게(추정)</th>
	                    <td>${adoptDetail.adoptWeight}kg</td>
	                </tr>
	                <tr>
	                    <th>중성화유무</th>
	                    <td>${adoptDetail.adoptNeutor}</td>
	                </tr>
	                <tr>
	                    <th>특이사항</th>
	                    <td>${adoptDetail.boardContent}</td>
	                </tr>
	                <tr>
	                 	<th>현재상황</th>
	                 	<td id="state">${adoptDetail.adoptState}</td>
	                </tr>
	                
	            </tbody>
			</table>
		</div>
		<br><br>
		
		<div>
		  <input type="submit" id="hopeCheck" value="신청하기" onclick="checkSubmit(); return false;">
		  
		  <input type="hidden" id="heartCnt" value="${heart}">
	      <a id="heart" onclick="checkHeart()"><i id="heartIcon"></i></a>
	      
	      <input type="hidden" id="blameCnt" value="${blame}">
	      <a id="blame" onclick="checkBlame()"><i class="bi bi-exclamation-triangle-fill"></i></a>
		</div>
		<hr>
	  </form>
	</article>
	
	<article>
		<div>
			<input id="insert_content" type="text" placeholder="내용을 입력해주세요">
			<input type="button" value="입력" onclick="replyInsert();">
			<hr>
		</div>
	  <c:forEach items="${replyList}" var="reply">
		<c:set var="loginUser" value="${login.userSeq}" />
		<c:set var="replyUser" value="${reply.userSeq}" />
		<div>
			<div>
				<img alt="" src="${reply.userImg}"> 
				<span>${reply.userName}(${reply.userId})</span>
	  		<c:if test="${replyUser eq loginUser}">
				<a class="update_btn">수정</a>
				<a class="delete_btn" onclick="replyDelete(${reply.replySeq});">삭제</a>
	 		</c:if>
				<fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd"/>
			</div>
			<div>
				<input type="hidden" id="replySeq" value="${reply.replySeq}">
				<!-- 댓글 -->
				<p id="show_content">${reply.replyContent}</p>
				<!-- 수정 누르면 이걸로 바뀜-->
				<input type="text" class="update_content" id="content_${reply.replySeq}" value="${reply.replyContent}">
				<button type="button" class="update_content" onclick="replyUpdate(${reply.replySeq},'#content_${reply.replySeq}');">입력</button>
				<hr>
			</div>
		</div>
	  </c:forEach>
	</article>
	
	<article>
		<br><br>
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
<!-- 입양 상세 페이지 js -->
<script src="/resources/js/adopt_detail.js"></script>
<!-- 입양 댓글  js -->
<script src="/resources/js/adopt_reply.js"></script>
</body>
</html>