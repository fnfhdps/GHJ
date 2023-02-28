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
		width: 50%;
	}
	
	#blame i{
		color : red;
	}
	
	i{
		width: 50px;
		height: 50px;
	}
	
	.dotted {
	    height: 1px;
	    background: url(https://iei.or.kr/resources/images/common/point_bar.png);
	}
	
	._7l1omc0 {
    display: flex;
	}

	.adopt_detail_content{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	.detail_top {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	.image_center, .userInfo_center {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	.action_center {
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
<!-- 입양 상세 css -->
<link rel="stylesheet" href="/resources/css/adopt_detail.css">
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
            
           	 <div class="detail_top">
           	 <br>
	            <h3>${adoptDetail.boardTitle}</h3>
	            	게시일 <fmt:formatDate value="${adoptDetail.boardDate}" pattern="yyyy.MM.dd" />
	            <br><p> 조회수 : ${adoptDetail.boardCnt} </p>
	            
	            <br>
	            <div class="btn-group">
	            	<input type="hidden" id="state" value="${adoptDetail.adoptState}">
	                <input type="button" class="btn btn-outline-dark" id="stateupdate" onclick="stateUpdate();"> 
	                <input type="button" class="btn btn-outline-dark" id="update" value="수정" onclick="adoptUpdate();">
	                <input type="button" class="btn btn-outline-dark" id="delete" value="삭제" onclick="adoptDelete();">
	            </div>
           	</div>
           	<br>
            <hr>		
	            <div class="image_center">
	                <img id="adopt_img" src="/resources/image/adopt/${adoptDetail.adoptImg}">
	            </div>
            <hr>
            
            <div class="userInfo_center">                
                <h2>${adoptDetail.userName}</h2>
                <h3>(${adoptDetail.userId})</h3>
            </div>
                <hr>
            <div>
            <br><br>
                <table class="adopt_detail_content">
                    <tbody>
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
                    </tbody>
                </table>
            </div>
            <br><br>
            
            <div class="action_center">
	            <input class="btn btn-secondary" type="submit" id="hopeCheck" value="신청하기" onclick="checkSubmit(); return false;">
	            &nbsp;&nbsp;&nbsp;&nbsp;
	            
	            <p>관심<small></small></p>
	            <input type="hidden" id="heartCnt">
	            <a id="heart" onclick="checkHeart()"><i id="heartIcon"></i></a>
	            &nbsp;&nbsp;&nbsp;&nbsp;
	            
	            <input type="hidden" id="blameCnt" value="${blame}">
	            <a id="blame" onclick="checkBlame()"><i class="bi bi-exclamation-triangle-fill"></i></a>
            </div>
            <hr>
        </form>
        </article>
        
        <article>
        <div class="shadow-lg p-3 mb-5 bg-body rounded">
            <div>
                <div class="input-group mb-3">
	                <input id="insert_content" type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
	                <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="replyInsert();">입력</button>
                </div>
                <hr>
            </div>
        <c:forEach items="${replyList}" var="reply">
            <c:set var="loginUser" value="${login.userSeq}" />
            <c:set var="replyUser" value="${reply.userSeq}" />
            
            <div>
				<!-- 프로필 이미지  -->
                <svg width="5%" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M16 32C24.8366 32 32 24.8366 32 16C32 7.16344 24.8366 0 16 0C7.16344 0 0 7.16344 0 16C0 24.8366 7.16344 32 16 32Z" fill="url(#pattern0)"></path>
                    <path d="M31.5 16C31.5 24.5604 24.5604 31.5 16 31.5C7.43959 31.5 0.5 24.5604 0.5 16C0.5 7.43959 7.43959 0.5 16 0.5C24.5604 0.5 31.5 7.43959 31.5 16Z" stroke="black" stroke-opacity="0.05" stroke-linecap="round" stroke-linejoin="round"></path>
                    <defs>
                    <pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
                        <use xlink:href="#image0_1605_2111" transform="scale(0.00390625)"></use>
                    </pattern>
                    <image id="image0_1605_2111" width="256" height="256" xlink:href="data:image/png;base64,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"></image>
                    </defs>
                </svg>
                <div>
                    <img alt="" src="${reply.userImg}"> 
                    <span>${reply.userName}(${reply.userId})</span>
                <c:if test="${replyUser eq loginUser}">
                    <a class="update_btn" onclick="updateBtn(${reply.replySeq});">수정</a>
                    <a class="delete_btn" onclick="replyDelete(${reply.replySeq});">삭제</a>
                </c:if>
                    <fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd"/>
                </div>
                <div>
                    <input type="hidden" id="replySeq" value="${reply.replySeq}">
                    <!-- 댓글 -->
                    <p id="show_content_${reply.replySeq}">${reply.replyContent}</p>
                    <div class="dotted" style="margin-top: 5px; margin-bottom: 5px;"></div>
                    <!-- 수정 누르면 이걸로 바뀜-->
                    <div class="input-group mb-3">
                        <input type="text" class="update_content form-control" placeholder="댓글을 입력해주세요" id="content_${reply.replySeq}" value="${reply.replyContent}" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button type="button" class="update_content btn btn-outline-secondary" id="button-addon2" onclick="replyUpdate(${reply.replySeq},'#content_${reply.replySeq}');">입력</button>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
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