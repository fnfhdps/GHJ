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

<title>공지사항</title>
</head>

<body>
<div class="wrap">
    <jsp:include page="../fix/header.jsp"></jsp:include>

	<div class="main">
		<div>공지사항 제목 : ${board.boardTitle}</div>
		<div>날짜 : <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></div>
		<div>조회수 : ${board.boardCnt}</div>
		<div>공지사항 내용 : ${board.boardContent}</div>
	</div>

	<jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
</body>
</html>