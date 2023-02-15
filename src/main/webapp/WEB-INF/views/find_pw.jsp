<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<title>비밀번호 찾기</title>
</head>

<body>
	<div class="container">
		<section class="login-form">
			<div>
				<img class="logo" src="../resources/img/logo.jpg">
				<h1>비밀번호 찾기</h1>
			</div>
	
			<form>
				<div class="int-area">
					<input type="text" name="userId" id="userId" autocomplete="off"
						required> <label for="userId">아이디</label>
				</div>
				<div class="int-area">
					<input type="email" name="userEmail" id="userEmail" autocomplete="off"
						required> <label for="userEmail">이메일</label>
				</div>
				<div id="finded-id" style="display:none">
					<!-- 결과 나오는 부분 -->
				</div>
				<div class="btn-area">
					<button id="submit" class="facebook" onclick="findPw(); return false;">비밀번호찾기</button>
				</div>
			</form>
				
				<div class="btn-area">
					<button id="btn" class="default" onclick="location.href='/login'">로그인하러가기</button>
				</div>
			
	</section>
	</div>
	
	<!------------------- 일반 로그인용 script  ---------------->
	<script type="text/javascript">
		function findPw() {
			var userId = $('#userId').val();
			var userEmail = $('#userEmail').val();

			var userData = {
				"userId" : userId,
				"userEmail" : userEmail
			};
// user1, kkk@naver.com
			$.ajax({
				url : "/login/findPw",
				type : "post",
				data : JSON.stringify(userData),
				dataType : "json",
				contentType : "application/json",
				success : function(result) {
					if (result == 0) {
						$('#finded-id').css("display", "block")
										.append("<h3>가입 정보가 없습니다.</h3>");
					} else if (result == 9) {
						alert("통신오류");
					} else {
						$('#finded-id').empty().css("display", "block")
										.append("<h3>비밀번호: " + result.userPw +"</h3>");
						$('#submit').attr("disabled", "disabled");
					}
				},
				error : function(errorThrown) {
					alert(errorThrown.statusText);
				}
			});
		}
	</script>

</body>
</html>