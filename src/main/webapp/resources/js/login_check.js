/**
 * 해당 코드를 적용한 페이지는 비회원일 경우 index.jsp로 이동
 */
const loginCkeck2 = $("#login_check").val();

if (loginCkeck2 == 0) {
	alert("로그인 후 열람 가능");
	window.location.href = "/index";
}