<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap icons-->
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/style.css">
<title>회원가입</title>
</head>

<body>
<!-- 
	1. 아이디 중복체크하고 넘어가도록 O
	 2. 비밀번호 확인 일치해야 넘어가도록
	 3. 전화번호에 숫자만 입력되기, 정규식으로 하이픈(-) 자동 넣어지도록
	 4. 아이디, 비밀번호, 휴대폰번호, 이메일 정규식 패턴 적용
 -->
	<section class="login-form">
		<div>
			<img class="logo" src="resources/img/logo.jpg">
			<h1>회원가입</h1>
		</div>

		<form method="post" action="join" id="join-form">
			
			<div class="int-area">
				<!-- 영문 대소문자, 숫자 16~20자 -->
				<input class="join-input-area"
						type="text"
						name="userId"
						id="userId"
						pattern="^([a-zA-Z0-9]){6,20}$"
						title="영문 대소문자, 숫자 중 6~20자"
						required>
				<span id="idCheckMsg"></span>
				<label>아이디</label>
			</div>
			
			<div class="int-area">
				<!-- 영문 대소문자, 숫자, 특수문자 꼭 포함 8~16자 -->
				<input type="password"
						name="userPw"
						id="userPw"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"
						title="영문 대소문자, 숫자, 특수문자 모두 포함 8~16자"
						autocomplete="off"
						required>
				<i id="pwView" class="bi bi-eye-fill"></i>
				<span id="pwCheckMsg"></span>
				<label>패스워드</label>
			</div>

			<div class="int-area">
				<input type="password" id="pwCheck" autocomplete="off" required>
				<span id="pwCheckMsg2"></span>
				<label for="pwCheck">패스워드 확인</label>
			</div>
			
			<div class="int-area">
				<input type="text" name="userName"id="userName" autocomplete="off" required>
				<span id="nameCheckMsg"></span>
				<label for="userName">이름</label>
			</div>
			
			<div class="int-area">
			
				<input type="text" id="phone"
						name="userPhone"
						oninput="autoHyphen(this)"
						maxlength="13"
						required="required">
				<span id="phoneCheckMsg"></span>
				<label for="userPhone">휴대전화</label>
				<button type="button" id="phoneChk" class="doubleChk btn btn-primary">휴대폰 인증번호</button><br>
			</div>
			
			<div class="int-area">
				<input type="text" id="phone2" name="userPhone2" title="인증번호 입력" disabled required/>
				<button type="button" class="btn btn-primary" id="phoneChk2" class="doubleChk">본인인증</button>
				<span class="point successPhoneChk"></span>
				<input type="hidden" id="phoneDoubleChk"/>
			</div>

			<div class="int-area">
				<input type="text" name="userEmail" id="userEmail" autocomplete="off">
				<label>이메일(선택)</label>
			</div>
			
			<div class="int-area">
				<input type="text" name="userEmailChk">
				<label>이메일 인증번호</label>
			</div>
			
			<div class="col-xs-4 col-sm-6">
				<input class="btn btn-primary"
						type="button"
						value="인증번호 보내기"
						onclick="">
			</div>
			
			<div class="caption">
				<div>
					<input id="member"class="remember" type="checkbox">
					<label for="member">회원 약관에 동의합니다.</label>
				</div>
				<div>
					<input id="individual" class="remember" type="checkbox">
					<label for="individual">개인정보 약관에 동의합니다.</label>
				</div>
			</div>
			
			<div class="btn-area">
				<button class="facebook" type="submit" onclick="checkSummit(); return false;">회원가입</button>
			</div>
			
			<div class="btn-area">
				<button class="default" type="button" onclick="location.href='/login'">로그인으로 돌아가기</button>
			</div>
		</form>
	</section>
<!-- 회원가입 js -->
<script src="/resources/js/join.js"></script>
</body>
</html>
