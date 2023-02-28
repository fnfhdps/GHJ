<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap icons-->
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
			<h1>회원가입</h1>
		</div>

		<form method="post" action="join" id="join-form">
			
			<div class="int-area">
				<!-- 영문 대소문자, 숫자 16~20자 -->
				<input class="join-input-area form-control"
						type="text"
						name="userId"
						id="userId"
						pattern="^([a-zA-Z0-9]){6,20}$"
						title="영문 대소문자, 숫자 중 6~20자"
						placeholder="아이디 "
						required>
			</div>
			<div class="int-area">			
				<span id="idCheckMsg"></span>
			</div>
			
			<div class="input-group mb-3">
				<!-- 영문 대소문자, 숫자, 특수문자 꼭 포함 8~16자 -->
				<input class="form-control"
						type="password"
						name="userPw"
						id="userPw"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"
						title="영문 대소문자, 숫자, 특수문자 모두 포함 8~16자"
						placeholder="패스워드 "
						autocomplete="new-password"
						required>
				<button type="button" id="pwView">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
					  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
					  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
					</svg>
				</button>
			</div>
			<div class="int-area">
				<span id="pwCheckMsg" class="int-area"></span>
			</div>
 			
			<div class="int-area">
				<input class="form-control"
						type="password"
						id="pwCheck"
						placeholder="패스워드 확인"
						required>
				<span id="pwCheckMsg2"></span>
				<label for="pwCheck"></label>
			</div>
			
			<div class="int-area">
				<input class="form-control"
						type="text"
						name="userName"
						id="userName"
						placeholder="이름 "
						required>
				<span id="nameCheckMsg"></span>
				<label for="userName"></label>
			</div>
			
			<div class="input-group">
				<input class="form-control"
						type="text"
						id="phone"
						name="userPhone"
						oninput="autoHyphen(this)"
						maxlength="13"
						placeholder="휴대폰 번호 "
						required="required">
				<span id="phoneCheckMsg"></span>
				<label for="userPhone"></label>
				<button type="button"
						id="phoneChk"
						class="doubleChk btn btn-outline-secondary">
						인증번호 발송
				</button>
				<br>
			</div>
			
			<div class="input-group">
				<input class="form-control"
						type="text"
						id="phone2"
						name="userPhone2"
						placeholder="인증번호 입력 "
						disabled
						required/>
				<button type="button"
						class="btn btn-outline-secondary"
						id="phoneChk2"
						class="doubleChk">
						인증하기
				</button>
			</div>
			<div class="int-area">
				<span class="point successPhoneChk"></span>
				<input type="hidden" id="phoneDoubleChk"/>
			</div>
			
			<div class="input-group">
				<input class="form-control"
						type="text"
						id="userEmail"
						name="userEmail"
						placeholder="이메일(선택) "
						required/>
				<button type="button"
						class="btn btn-outline-secondary"
						id="emailChk"
						class="doubleChk">
						인증번호 발송
				</button>
			</div>
			
			<div class="input-group">
				<input class="form-control"
						type="text"
						id="userEmail2"
						name="userEmail2"
						placeholder="이메일 인증번호"
						required/>
				<button type="button"
						class="btn btn-outline-secondary"
						id="emailChk2"
						class="emailDoubleChk">
						인증하기
				</button>
			</div>
			<div class="int-area">
				<span class="point successEmailChk"></span>
				<input type="hidden" id="emailDoubleChk"/>
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
				<button class="default" type="submit" onclick="checkSummit(); return false;">회원가입</button>
			</div>
			
			<div class="btn-area">
				<a href="/login">로그인으로 돌아가기</a>
			</div>
		</form>
	</section>
<!-- 회원가입 js -->
<script src="/resources/js/join.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
