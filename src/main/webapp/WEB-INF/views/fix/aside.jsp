<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<body>
  <aside class="sidebarNav col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="list-group sidebar">
      <a class="list-group-item current" href="/mypage/info/${login.userSeq}">내정보</a>
      <a class="list-group-item " href="/mypage/mywriting/${login.userSeq}">내입양글</a>
      <a class="list-group-item " href="/mypage/mysign/${login.userSeq}">신청목록</a>
      <a class="list-group-item " href="/mypage/hope/${login.userSeq}">희망자목록</a>
      <a class="list-group-item " href="/mypage/heart/${login.userSeq}">관심동물</a>
      <a class="list-group-item " href="/sponsor/mysponsor/${login.userSeq}">후원내역</a>
	  <a class="list-group-item " href="/mypage/qna/${login.userSeq}">1:1문의</a>
    </div>
  </aside>
</body>
</html>