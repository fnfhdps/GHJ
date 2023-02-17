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
<title>회원정보수정</title>
</head>

<style>
  form{
    margin-top: 20px;
    margin-left: 70px;
  }
  label{
    font-weight: bold;
    font-size: 17px;
  }

  #btn_update{
    margin: 0 15%;
  }
  
  #pwSuccess, #pwDanger{
  	display: none;
  }
  
  form input::file-selector-button {
    display: none;
    overflow: hidden;
  }
  
  #profile{
  	width: 170px;
  	height: 150px;
  	border-radius: 50%;
  }
  
  /* ajax로 인증번호 받기 클릭시 보이도록 */
  #phone_hidden{
    display: none;
  }
</style>

<body>

  <div class="wrap">

    <jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

    <section>
      <h2>마이페이지</h2>
      <div id="mypage" class="d-flex justify-content-start">
		<jsp:include page="../fix/aside.jsp"></jsp:include>
	  
        <article class="mypage_content">
          <form action="/mypage/update" method="post" enctype="multipart/form-data">
          	
          	<input type="hidden" name="userSeq" value="${login.userSeq}">
          	<input type="hidden" id="loginType" name="loginType" value="${login.loginType}">
          	<input type="hidden" id="userRole" name="userRole" value="${login.userRole}">
          	<input type="hidden" id="userId" value="${login.userId}">
          	
          	
          	<div class="mb-3 row">
          	
          	<c:choose>
	          	<c:when test="${!empty login.userImg}">
	            	<img id="profile" src="${login.userImg}">
	          	</c:when>
	          	<c:otherwise>
	          		<img id="profile" src="/resources/image/profile/profile.png">
	          	</c:otherwise>
          	</c:choose>
          	<!--
          	<input type="file" id="file" name="userImg" accept=".jpg, .png">
	          	-->
          	</div>
          
            <div class="mb-3 row">
              <label class="col-sm-2 col-form-label">이름</label>
              <div class="col-md-5">
                <input class="form-control-plaintext"
                		id="staticEmail"
                		type="text"
                		value="${login.userName}"
                		name="userName"
                		readonly>
              </div>
            </div>
            
            <div class="mb-3 row">
              <label class="col-sm-2 col-form-label">아이디</label>
              <div class="col-md-5">
                <input class="form-control-plaintext"
                		id="staticEmail"
                		type="text"
                 		value="${login.userId}"
                 		name="userId"
                 		readonly>
              </div>
            </div>
            
            <div class="pwBox mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
              <div class="col-md-3">
                <input type="password"
                		class="form-control"
                		id="userPw"
                		value="${login.userPw}"
                		name="userPw"
                		readonly="readonly">
              </div>
              <div class="col-md-3">
                <button type="button" class="btn btn-secondary" onclick="location.href='/change_pw'">비밀번호 변경</button>
              </div>
            </div>
            
             <div class="pwBox mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호 확인</label>
              <div class="col-md-3">
                <input type="password" class="form-control" id="pwCheck" required="required">
                 <span id="pwSuccess">비밀번호가 일치합니다.</span>
    			 <span id="pwDanger">비밀번호가 일치하지 않습니다.</span>
              </div>
            </div>
            
            <div class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">전화번호</label>
              <div class="col-sm-3">
                <input type="text"
                		class="form-control"
                		id="inputPassword"
                		name="userPhone"
                		value="${login.userPhone}"
                		readonly="readonly">
              </div>
              <div class="col-md-3">
                <button type="button" class="btn btn-secondary">인증번호 받기</button>
              </div>
            </div>
            
            <div id="phone_hidden" class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label"></label>
              <div class="col-sm-3">
                <input type="password" class="form-control" id="inputPassword">
              </div>
              <div class="col-md-3">
                <button type="button" class="btn btn-secondary">인증번호 확인</button>
              </div>
            </div>
            
            <div class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">우편번호</label>
              <div class="col-sm-3">
                <input type="text"
                		class="form-control"
                		id="addr1"
						name="userAddr1"             		
                		value="${login.userAddr1}"
                		readonly="readonly">
              </div>
              <div class="col-md-3">
                <button type="button" class="btn btn-secondary" onclick="excution_addr()">도로명 주소</button>
              </div>
            </div>
            
			<div class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">주소</label>
              <div class="col-sm-3">
                <input type="text"
                		class="form-control"
                		id="addr2"
						name="userAddr2"                		
                		value="${login.userAddr2}"
                		readonly="readonly">
              </div>
            </div>
            
			<div class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">상세주소</label>
              <div class="col-sm-3">
                <input type="text"
                		class="form-control"
                		id="addr3"
						name="userAddr3"                		
                		value="${login.userAddr3}"
                		readonly="readonly">
              </div>
            </div>
            
            <div class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">메일</label>
              <div class="col-sm-3">
                <input type="text"
                		class="form-control"
                		id="inputPassword"
                		name="userEmail"
                		value="${login.userEmail}">
              </div>
              <div class="col-md-3">
                <button type="button" class="btn btn-secondary">이메일 변경</button>
              </div>
            </div>
            <br>
            
             <div class="col-md-3">
                <a onclick="drop();">회원탈퇴</a>
              </div>
              <br><br><br>
            <button type="submit" class="btn btn-secondary" id="btn_update">수정</button>
          </form>
        </article>
	  </div>
    </section>

    <jsp:include page="../fix/footer.jsp"></jsp:include>
   
</div>

<script type="text/javascript">
	
	// 카카오 로그인시 비밀번호 숨김
	const loginType = $("#loginType").val();
	if(loginType == "KAKAO"){
		$('.pwBox').css('display', 'none');
	};
	
	
	// 비밀번호 확인
	$('input[type="password"]').focusout(function() {
		let pw1 = $('#userPw').val();
		let pw2 = $('#pwCheck').val();
		
		if((pw1 != '')&&(pw2 == '')){
			null;
		}else if((pw1 != '') || (pw2 != '')){
			if(pw1 == pw2){
				$('#pwSuccess').css('display', 'inline-block');
				$('#pwDanger').css('display', 'none');
			}else {
                $("#pwSuccess").css('display', 'none');
                $("#pwDanger").css('display', 'inline-block');
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