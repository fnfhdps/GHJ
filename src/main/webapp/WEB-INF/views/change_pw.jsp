<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>비밀번호 변경</title>
</head>
<body>
	<section>
		<h1>비밀번호 변경</h1>
		<!-- 유저 비밀번호 -->
		<input type="hidden" id="userPw" value="${login.userPw}">
	    <form id="form_pw" action="/change_pw" method="post">
			<input type="hidden" id="userSeq" name="userSeq" value="${login.userSeq}">
		    <div>
			   현재 비밀번호<input id="current_pw" type="text"><br>
			  <span id="pwSuccess">비밀번호가 일치합니다.</span>
    		  <span id="pwDanger">비밀번호가 일치하지 않습니다.</span>
		    </div>
		    <div>
			   새 비밀번호<input id="change_pw" type="password" name="userPw" disabled="disabled">
		    </div>
		    <div>
			   새 비밀번호 확인<input id="check_pw" type="password" disabled="disabled">
		    </div>
		    
		    <button id="btn_pw" type="button">변경하기</button>
	    </form>
	</section>
	
	<script type="text/javascript">
	$("#check_msg").css("display", "none");
		
	// 현재 비밀번호 확인
	$('#pwSuccess').css('display', 'none');
	$('#pwDanger').css('display', 'none');
	$('#current_pw').focusout(function() {
		let pw1 = $("#userPw").val();
		let pw2 = $(this).val();
		
		//alert("pw1 : "+ pw1 + "pw2 : "+ pw2);
		if((pw1 != '')&&(pw2 == '')){
			null;
		}else if((pw1 != '') || (pw2 != '')){
			if(pw1 == pw2){
				$('#pwSuccess').css('display', 'inline-block');
				$('#pwDanger').css('display', 'none');
				$("#change_pw").removeAttr("disabled");
				$("#check_pw").removeAttr("disabled");
			}else {
                $("#pwSuccess").css('display', 'none');
                $("#pwDanger").css('display', 'inline-block');
            }
		}
	});
	
	// 새 비밀번호 확인
		// submit시 비밀번호 한번더 확인
	$("#btn_pw").click(function() {
		const currentPw = $("#current_pw").val();
		const changePw = $('#change_pw').val();
		const pwCheck = $('#check_pw').val();
		
		if(changePw != pwCheck){
			alert("비밀번호를 확인해주세요");
		}else if(currentPw == changePw){
			alert("이전과 동일한 비밀번호 입니다.")	
		}else{
			$("#form_pw").submit();
			return;
		}
	});
		
	
	</script>
</body>
</html>