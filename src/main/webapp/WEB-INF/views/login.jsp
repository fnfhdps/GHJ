<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="../resources/css/style.css">
<title>로그인</title>


</head>

<body>
	<div class="container">
		<section class="login-form">
			<div>
				<img class="logo" src="/resources/image/logo/logo_black.png">
				<h1>로그인</h1>
			</div>
	
			<form>
				<div class="int-area">
					<input type="text" name="userId" id="userId" placeholder="아이디 " required>
				</div>
				<div class="int-area">
					<input type="password" name="userPw" id="userPw" placeholder="패스워드 " required>
				</div>
	
				<div class="btn-area">
					<button id="btn" class="default" onclick="login(); return false;">로그인</button>
				</div>

				<div class="btn-area">
	                <button id="btn-kakao-login" type="button" class="kakao">카카오 로그인</button>
	            </div>
	
				<div class="caption">
					<input class="remember" type="checkbox" id="rememberId"> ID기억하기
				</div>
			</form>
			
			<div class="caption">
				<div>
					<a href="/login/findPw">비밀번호 찾기</a> | <a href="/join">회원가입</a>
				</div>
			</div>
		</section>
	</div>

<!-- 로그인 js -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/resources/js/login.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>