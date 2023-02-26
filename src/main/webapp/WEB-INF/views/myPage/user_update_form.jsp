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

<!-- header&footer css -->
<link rel="stylesheet" href="/resources/css/fix.css">
<!-- mypage css -->
<link rel="stylesheet" href="/resources/css/mypage.css">
<title>내정보수정</title>
</head>

<body>
<div class="wrap">
    <jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

	<div class="main">
	  <div class="">
	    <div class="sideNavGap row">
		  <!-- 마이페이지 목록 -->
		  <jsp:include page="../fix/aside.jsp"></jsp:include>
	
	      <section class="sidebarContent col-lg-9 col-md-9 col-sm-12 col-xs-12">
	        <div>
	          <h1 class="pageH1">계정관리</h1>
	          <div class="pageSubtitle">내정보수정</div>
	
	          <article class="pageBody">
	            <form class="user_update_content" action="/mypage/info/update" method="post">
	              <!-- 시퀀스 모음 -->
	          	  <input type="hidden" id="userSeq" name="userSeq" value="${login.userSeq}">
	          	  <input type="hidden" id="loginType" name="loginType" value="${login.loginType}">
	          	  <input type="hidden" id="userRole" name="userRole" value="${login.userRole}">
	
	              <!-- 파일 업로드
	              <div class="formGroup">
	                <label class="control-label">프로필 이미지 <small>(선택)</small></label>
	                <div class="fileUpload">
	
	                  <div id="profile_area">
	                    <h5 class="upload">업로드</h5>
	                    <div id="profileImage">
	                      <img alt="fnfhdps12@gmail.com" src="../img/sample1.png">
	                    </div>
	                  </div>
	                  <input type="file" name="file" accept="image/.jpg, .jpeg, .png, .gif">
	                </div>
	              </div> -->
	
	              <div class="mb-4 formGroup profile_info">
	                <ul class="myinfo_area">
	                  <li>
	                      <div class="myphoto">
		                    <!-- 프로필 사진 없으면 기본 사진 보임 -->
				          	<c:choose>
					          	<c:when test="${!empty login.userImg}">
					            	<img id="profile" src="${login.userImg}">
					          	</c:when>
					          	<c:otherwise>
					          		<img id="profile" src="/resources/image/profile/profile.png">
					          	</c:otherwise>
				            </c:choose>
	                      </div>
	                  </li>
	                  <li>
	                      <div class="myaccount">
	                          <div class="myname">
	                              <div class="name_text">${login.userName}</div>
	                          </div>
	                          <div class="myname">
	                              <div class="name_text">${login.userId}</div>
	                          </div>
	                      </div>
	                  </li>
	              </ul>
	              </div>
	
	              <div class="mb-0 formGroup">
	                <label class="required">휴대폰번호</label>
	                <div class="formRow">
	                  <div class="flex-grow-1">
	                      <input class="form-control"
	                    		id="phone"
                      			name="userPhone"
                      			maxlength="13"
                      			value="${login.userPhone}"
                      			oninput="autoHyphen(this)"
                      			required="required">
	                  </div>
	                  <div class="col-auto">
	                        <button type="button"
	                        		id="phoneChk"
	                        		class="doubleChk btn btnAuthentication">
	                        		인증번호 발송
	                        </button>
	                  </div>
	                </div>
	              </div>
	              <div class="formGroup">
	                <div class="formRow">
	                  <div class="flex-grow-1">
	                      <input class="form-control"
	                      		type="text"
	                      		id="phone2"
	                      		name="userPhone2"
	                      		readonly="readonly"
	                      		required>
	                  </div>
	                  <div class="col-auto">
	                        <button type="button"
			                        class="btn btnAuthentication"
			                        id="phoneChk2"
			                        class="doubleChk">
			                        	인증하기
							</button>
	                  </div>
						<span class="point successPhoneChk"></span>
						<input type="hidden" id="phoneDoubleChk"/>
	                </div>
	              </div>

 	           	  <div class="mb-1 formGroup">
	                <label class="required">이메일</label>
	                <div class="formRow">
	                  <div class="flex-grow-1">
	                      <input id="user_phone" class="form-control" value="${login.userEmail}" name="userEmail">
	                  </div>
	                  <div class="col-auto">
	                        <button type="button" class="btn btnAuthentication">이메일 인증</button>
	                  </div>
	                </div>
	              </div>
	              <div class="formGroup">
	                <div class="formRow">
	                  <div class="flex-grow-1">
	                      <input class="form-control">
	                  </div>
	                  <div class="col-auto">
	                        <button type="button" class="btn btnAuthentication">인증하기</button>
	                  </div>
	                </div>
	              </div>

	              <div class="mb-0 formGroup">
	                <label class="required">주소</label>
	                <div class="formRow">
	                  <div class="flex-grow-1">
	                      <input class="form-control"
	                      		type="text"
                		  	    id="addr1"
							    name="userAddr1"             		
                		  		value="${login.userAddr1}"
                		  		readonly="readonly"
	                      		placeholder="우편번호">
	                  </div>
	                  <div class="col-auto">
	                        <button type="button"
	                        		class="btn btnAuthentication"
	                        		onclick="excution_addr()">
	                        		도로명 주소
	                        </button>
	                  </div>
	                </div>
	              </div>
	              <div class="mb-3 formGroup">
	                <input class="form-control"
	                		type="text"
	                		id="addr2"
							name="userAddr2"                		
	                		value="${login.userAddr2}"
	                		readonly="readonly"
	                		placeholder="기본주소">
	              </div>
	              <div class="formGroup">
	                <input class="form-control"
	                	    type="text"
                		    id="addr3"
						    name="userAddr3"                		
                		    value="${login.userAddr3}"
                		    readonly="readonly"
                		    placeholder="상세주소">
	              </div>
	              
	              <div class="mt-4 mb-2 formRow">
	                <button type="submit" class="col-12 btn btn-secondary" type="button">저장</button>
	              </div>
	            </form>
	          </article>
	
	          <div class="pageSubtitle">비밀번호 변경</div>
	          <article class="pageBody">
	            <form id="form_pw" class="user_update_content">
	              
	              <div class="mt-3 mb-2">
	                <label class="required" for="user_name">현재 비밀번호</label>
	                <input id="current_pw" class="form-control" type="password">
				    <span id="pwSuccess">비밀번호가 일치합니다.</span>
	    		    <span id="pwDanger">비밀번호가 일치하지 않습니다.</span>
	              </div>
	              <div class="mb-2">
	                <label class="required" for="user_name">새 비밀번호</label>
	                <input id="change_pw" class="form-control" type="password" disabled="disabled">
	              </div>
	              <div class="mb-3">
	                <label class="required" for="user_name">새 비밀번호 확인</label>
	                <input id="check_pw" class="form-control" type="password" disabled="disabled">
	              </div>
	              <div class="mt-4 mb-2 formRow">
	                <button id="btn_pw" class="col-12 btn btn-secondary" type="button">변경</button>
	              </div>
	              
	            </form>
	          </article>
	          
	          <div id="modalBtn" class="iconColor m-3"><a href="#">회원탈퇴&nbsp;<i class="bi bi-chevron-right"></i></a></div>
	        </div>
	      </section>
	
	    </div>
	  </div>
	</div>
	
	<jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
<!-- 회원탈퇴 확인 Modal-->
<div class="modal fade" id="withdrawModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">회원탈퇴 안내</h3>
        <button type="button" class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="bi bi-x-lg"></i></span>
        </button>
      </div>
      <div class="modal-body">

          <div class="modalBody">
            <ul>
              <li>고객님의 이름, 이메일, 프로필 사진, 주소등을 포함한 모든 개인정보를 삭제합니다.</li>
              <li>사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</li>
              <li>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</li>
              <li>탈퇴 후 게시판형 서비스에 등록한 게시물은 모두 삭제됩니다.</li>
            </ul>
          </div>
      </div>
      <div class="modal-footer">
        <div class="px-3">
          <label>
            <input type="checkbox" name="destroy_confirm" id="ck-destroy-account" value="1">
            	계정을 삭제하면 되돌릴 수 없으며, 삭제한 데이터를 복구할 수 없음을 이해했습니다.
          </label>
        </div>

        <form id="deleteForm" action="/mypage/delete" method="post">
        	<!-- 유저 아이디, 비번 -->
     	    <input type="hidden" id="userId" name="userId" value="${login.userId}">
	      	<input type="hidden" id="userPw" name="userPw" value="${login.userPw}">
	      	
        	<!-- 비밀번호 입력<input type="password" name="userPw"> -->
    		<button id="withdrawBtn" data-dismiss="modal" class="btn btn-md btn-outline-danger" onclick="withdraw(); return false;">계정 삭제하기</button>
     	</form>
      
      </div>
    </div>
  </div>
</div>

<!-- 카카오 api -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 js -->
<script src="/resources/js/addr.js"></script>
<!-- 회원 정보 수정 js -->
<script src="/resources/js/user_update_form.js"></script>
<!-- 회원 탈퇴 js -->
<script src="/resources/js/withdraw.js"></script>
</body>
</html>