<div class="text-center"><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 부트스트랩5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

  <!-- 구글 폰트 적용 -->
  <link href="https://fonts.googleapis.com">
  <link href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">

  <!-- jQuery -->
  <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
  <!-- ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <link rel="stylesheet" href="./css/fix.css">

  <title>header</title>
</head>
<body>
	<!-- 유저 시퀀스 -->
    <input id="login_check" type="hidden" value="${login.userSeq}">

  <header class="header">
      <nav id="navSize" class="container navbar navbar-expand-sm navbar-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="/index">
            <div>
              <img id="navImg" src="./img/nav_logo.png" alt="">
              	구해줘!펫즈
            </div>
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-sm-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="/map">소개</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/map">공지사항</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/adopt/list">유기동물 입양</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/sponsor/list">후원</a>
              </li>
            </ul>

            <div class="d-flex">
              <div class="non_member">
                <a class="me-2" href="/login">로그인</a>
                <span> | </span>
                <a class="m-2" href="/join">회원가입</a>
              </div>
            </div>
 			<div class="member">
		       	  <span class="font_bold">${login.userName}(${login.userId})님</span>
		          <a href="/mypage/update">마이페이지</a>
		          <span> | </span>
		          <a href="/logout">로그아웃</a>
     		</div>
      </div>
    </div>
  
    <nav class="navbar navbar-expand-md py-3">
      <div class="container-fluid">

        <!-- 버튼 테두리 없애기 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
    </nav>
  </header>
  <!-- 상단에 회원,비회원  구분 -->
<script type="text/javascript">
$(function() {
	const loginCkeck1 = $("#login_check").val();

	// 회원이면 class="member"만 보이기
	if(loginCkeck1 == 0){
		$(".non_member").css("display", "block");
		$(".member").css("display", "none");
	}else{
		$(".non_member").css("display", "none");
		$(".member").css("display", "block");
	}
});
</script>
</body>
</html>