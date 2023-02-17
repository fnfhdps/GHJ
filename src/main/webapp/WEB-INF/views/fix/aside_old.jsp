<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<body>
	<aside>
		<div class="sidenav">
		  <a href="/mypage/update">회원정보 수정</a>
		  <a href="/mypage/mywriting/${login.userSeq}">내 입양 글</a>
		  <a href="/mypage/mysign/${login.userSeq}">입양 신청 목록</a>
		  <a href="/mypage/hope/${login.userSeq}">입양 희망자 목록</a>
		  <a href="/mypage/heart/${login.userSeq}">나의 관심동물</a>
		  <a href="/sponsor/mysponsor/${login.userSeq}">후원 내역</a>
		  <a href="/mypage/qna/${login.userSeq}">1:1 문의사항</a>
		  <a href="/mypage/delete">회원탈퇴</a>
		</div>
	</aside>
</body>
</html>