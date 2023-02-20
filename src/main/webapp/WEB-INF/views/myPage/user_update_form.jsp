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

<!-- mypage css -->
<link rel="stylesheet" href="/resources/css/mypage.css">
<title>내정보수정</title>
</head>

<body>
<div id="wrap">
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
	            <form class="user_update_content" action="">
	              <!-- 시퀀스 모음 -->
	          	  <input type="hidden" name="userSeq" value="${login.userSeq}">
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
	
	              <div class="mb-4 formGroup">
	                <label class="required" for="user_name">이메일</label>
	                <input class="form-control"
	                		type="text"
	                		name="userEmail"
		                	value="${login.userEmail}"
		                	disabled>
	              </div>
	
	              <div class="mb-0 formGroup">
	                <label class="required">휴대폰번호</label>
	                <div class="formRow">
	                  <div class="flex-grow-1">
	                      <input class="form-control"
                      			name="userPhone"
                      			value="${login.userPhone}">
	                  </div>
	                  <div class="col-auto">
	                        <button type="button" class="btn btnAuthentication">인증번호 발송</button>
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
	
	              <!-- <div class="mb-1 formGroup">
	                <label class="required">이메일</label>
	                <div class="formRow">
	                  <div class="flex-grow-1">
	                      <input id="user_phone" class="form-control" value="" name="user[phone]">
	                  </div>
	                  <div class="col-auto">
	                        <button type="button" class="btn btnAuthentication">
	                          이메일 인증
	                        </button>
	                  </div>
	                </div>
	              </div> -->
	              
	              <div class="mt-4 mb-2 formRow">
	                <button type="submit" class="col-12 btn btn-secondary" type="button">저장</button>
	              </div>
	            </form>
	          </article>
	
	          <div class="pageSubtitle">비밀번호 변경</div>
	          <article class="pageBody">
	            <form class="user_update_content" action="">
	
	              <div class="mt-3 mb-2">
	                <label class="required" for="user_name">현재 비밀번호</label>
	                <input class="form-control" type="password">
	              </div>
	              <div class="mb-2">
	                <label class="required" for="user_name">새 비밀번호</label>
	                <input class="form-control" type="password">
	              </div>
	              <div class="mb-3">
	                <label class="required" for="user_name">새 비밀번호 확인</label>
	                <input class="form-control" type="password">
	              </div>
	              <div class="mt-4 mb-2 formRow">
	                <button class="col-12 btn btn-secondary" type="button">저장</button>
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
     	    <input type="hidden" id="userId" name="userId" value="${login.userId}">
	      	<input type="hidden" id="userPw" name="userPw" value="${login.userPw}">
	      	
        	<!-- 비밀번호 입력<input type="password" name="userPw"> -->
    		<button id="withdrawBtn" data-dismiss="modal" class="btn btn-md btn-outline-danger" onclick="withdraw(); return false;">계정 삭제하기</button>
     	</form>
      
      </div>
    </div>
  </div>
</div>

<script>
  $('#modalBtn').click(function(e){
    e.preventDefault();
    $('#withdrawModal').modal("show");
  });

/*   $("input[type='checkbox']").click(function() {
    if($(this).is(':checked')){
      $("#withdrawBtn").prop("disabled", false);
      // $(this).removeAttr("checked");
    }else{
      $("#withdrawBtn").prop("disabled", ture);
    }
  }); */
  
  // 회원탈퇴
  function withdraw() {
	  if(!($('input[type="checkbox"]').is(':checked'))){
		  alert("탈퇴 안내를 확인하고 동의해 주세요.");
		  return;
	  }else{
		  $("#deleteForm").submit();
	  }
	}
</script>

<script type="text/javascript">	
	// 카카오 로그인시 비밀번호 숨김
	const loginType = $("#loginType").val();
	if(loginType == "KAKAO"){
		$('.pwBox').css('display', 'none');
	};
	
	// 비밀번호 확인
	$('#pwDanger').css('display', 'none');
	$("#pwSuccess").css('display', 'none');
	
	$('input[type="password"]').focusout(function() {
		let pw1 = $('#userPw').val();
		let pw2 = $('#pwCheck').val();
		
		if((pw1 != '')&&(pw2 == '')){
			null;
		}else if((pw1 != '') || (pw2 != '')){
			if(pw1 == pw2){
				$('#pwSuccess').css('display', 'inline-block').css("color","green");
				$('#pwDanger').css('display', 'none');
			}else {
                $("#pwSuccess").css('display', 'none');
                $("#pwDanger").css('display', 'inline-block').css("color","red");
            }
		}
	});
	
	// submit시 비밀번호 한번더 확인
	$("#btn_update").click(function() {
		const userPw = $('#userPw').val();
		const pwCheck = $('#pwCheck').val();
		
		if(userPw != pwCheck){
			alert("비밀번호를 확인해주세요");
		}else{
			$(this).submit();
		}
	});
</script>

<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function excution_addr(){
     
      new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;

                  } else {
                    addr += " ";
                  }

                $("#addr1").val(data.zonecode);
                $("#addr2").val(addr);
                $("#addr3").val(""); //이거 왜 안됨...
                $("#addr3").attr("readonly", false).focus();
            }
        }).open();
    }
    
function drop() {
	//const loginType = $("#loginType").val();

	if(window.confirm("탈퇴하시면 기존의 저장된 활동 내역이 모두 사라집니다")){
		if(loginType == "KAKAO"){
			dropKakao();
		}else{
			dropBasic();
		}
	}
}

//회원 탈퇴 (기본)
function dropBasic() {
	const id = $("#userId").val();
	let data = {"userId" : id};
  	$.ajax({
  		url : "/mypage/delete",
  		type: "post",
		data: JSON.stringify(data),
		dataType: "json",
		contentType: "application/json",
		success : function(result) {
			alert("성공:"+result);
			if (result == -1) {
				alert("통신 오류");
			} else {
				alert("탈퇴되었습니다.");
				window.location.href = "/index";
			}
		},
		error : function(errorThrown) {
			alert(errorThrown.statusText);
		}
	  	});
}

// 회원 탈퇴 (카카오)
function dropKakao() {
  	Kakao.API.request({
         url: '/v1/user/unlink',
         success: function (response) {
         	$.ajax({
         		url : "/mypage/delete",
		type : "post",
		data : {"userId" : "K"+response.id},
		dataType : "json",
		contentType : "application/json",
		success : function(result) {
			if (result == -1) {
				alert("통신 오류");
			} else {
				alert("탈퇴되었습니다.");
				window.location.href = "/index";
			}
		},
		error : function(errorThrown) {
			alert(errorThrown.statusText);
		}
         	})
         },
         fail: function (error) {
             alert("카카오 로그인 상태가 아닙니다.");
         }
     });
}
</script>

</body>
</html>