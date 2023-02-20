<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  #drop_img{
    position: relative;
    top: 16px;
    left: 100px;
    width: 600px;
    z-index: -1;
  }

  #drop_img+div{
    position: relative;
    bottom: 35px;
    left: 360px;
    z-index: 1;
  }
</style>

<title>회원탈퇴(사용x)</title>
</head>

<body>
  <div class="wrap">
  
  	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

    <h2>마이페이지</h2>
    <div id="mypage" class="d-flex justify-content-start">
	  <jsp:include page="../fix/aside.jsp"></jsp:include>

      <section class="mypage_content" >
     	 <form id="deleteForm" action="/mypage/delete" method="post">
	      	<input type="hidden" id="userId" name="userId" value="${login.userId}">
	      	<input type="hidden" id="loginType" value=" ${login.loginType}">
	      
	        <div>
	          <img id="drop_img" src="/resources/image/drop.png" alt="회원탈퇴">
	          <!-- 예, 아니오 한번 물어보기 -->
	          <div>
		         	비밀번호 입력<input type="password" name="userPw">
	            <button type="button" class="btn btn-secondary" onclick="withdraw();">회원탈퇴</button>
	          </div>
	        </div>
     	 </form>
      </section>
    </div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>
  
</div>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">

function withdraw() {
	const loginType = $("#loginType").val();
	if(window.confirm("탈퇴하시면 기존의 저장된 활동 내역이 모두 사라집니다")){
		if(loginType == "KAKAO"){
			$("#deleteForm").submit();			
		}
		else{
			dropKakao();
		}
	}
}	

function drop() {
	if(window.confirm("탈퇴하시면 기존의 저장된 활동 내역이 모두 사라집니다")){
		if(loginType == "KAKAO"){
			dropKakao();
		}else{
			dropBasic();
		}
	}
}

// 회원 탈퇴 (기본)
function dropBasic() {
	const id = $("#userId").val();
	
  	$.ajax({
  		url : "/mypage/delete",
		type : "get",
		data : {"userId" : id},
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
	  	});
}

// 회원 탈퇴 (카카오)
function dropKakao() {
  	Kakao.API.request({
         url: '/v1/user/unlink',
         success: function (response) {
         	$.ajax({
         		url : "/mypage/delete",
		type : "get",
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


// 임시: 로그아웃, 이거 굳이 필요한가?
function logoutKakao(){
      if (!Kakao.Auth.getAccessToken()) {
      	alert("카카오 로그인 상태가 아닙니다.");
          return;
      }
      
      Kakao.Auth.logout(function () {
             alert("logout");
             // session삭제 추가. JSP로 할건지 Controller에 하는게 나은지 물어보기
         });
  	}
</script>	

</body>
</html>