/**
 * 일반, 카카오 로그인 js
 */

//카카오 로그인용 script
$(function(){
	$("#btn-kakao-login").click(function(event){
		
		// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
		Kakao.init('5b3c8820856bcfa4a8250cffa00c6d65');
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
		Kakao.Auth.login({
			success:function(auth){
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response){
						// 사용자 정보를 가져와서 폼에 추가.
						const account = response.kakao_account;

						const userData_kakao = {
							"userId" : "K" + response.id,
							"userEmail" : account.email,
							"userName" : account.profile.nickname,
						};
						$.ajax({
							url : "/login/kakao",
							type : "post",
							data : JSON.stringify(userData_kakao),
							dataType : "json",
							contentType : "application/json",
							success : function(result) {
								if (result == 0) {
									alert("아이디와 비밀번호를 다시 확인해주세요");
								} else if (result == 9) {
									alert("통신 오류");
								} else {
									window.location.href = "/index";
								}
							},
							error : function(errorThrown) {
								alert(errorThrown.statusText);
							}
						});
					}, // kakao.Api.request의 success
					fail: function(error){
						alert("카카오 로그인 처리 중 오류가 발생했습니다.");
					}
				}); // kakao.Api.request
			}, // kakao.Auth.login의 success.
			fail:function(error){
				alert("카카오 로그인 처리 중 오류가 발생했습니다.");
			}
		}); // Kakao.Auth.login 끝
	}); // 클릭이벤트
});// 카카오로그인 끝.


//일반 로그인용 script
	$(function() {
		/* 저장된 아이디 불러오기 */
		const rememberId = localStorage.getItem("saveId");

		if (rememberId != 'N') {
			$('#userId').val(rememberId);
		}
	});
	
	function login() {
		const userId = $('#userId').val();
		const userPw = $('#userPw').val();
		const rememberId = $('#rememberId:checked').val();
		
		/* 아이디 저장  유무 판별 */
		if (rememberId == 'on') {
			localStorage.setItem("saveId", userId);
		} else {
			localStorage.setItem("saveId", 'N');
		}

		/* 로그인 용 */
		const userData = {
			"userId" : userId,
			"userPw" : userPw
		};

		$.ajax({
			url : "/login",
			type : "post",
			data : JSON.stringify(userData),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {
				if (result == -1) {
					alert("아이디와 비밀번호를 다시 확인해주세요");
					return;
				} else if(result == 1) {
					window.location.href = "/index";
				} else if(result == 2){
					window.location.href = "/admin/member";					
				} else{
					alert("통신오류");
				}
			},
			error : function(errorThrown) {
				alert(errorThrown.statusText);
			}
		});
	}
