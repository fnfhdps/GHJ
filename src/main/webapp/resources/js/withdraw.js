/**
 * 회원 탈퇴 js
 */
	//회원 탈퇴 모달 js
  $('#modalBtn').click(function(e){
    e.preventDefault();
    $('#withdrawModal').modal("show");
  });
  
const loginType = $("#loginType").val();
// 회원탈퇴
function withdraw() {
	if(!($('input[type="checkbox"]').is(':checked'))){
		alert("탈퇴 안내를 확인하고 동의해 주세요.");
		return;
	}else{
//		withdrawAjax();
		id_check();
	}
}

//회원 탈퇴 (기본)
function id_check() {
	let id = $("#userId").val();
	let data = {"userId" : id};

	if (loginType == 'KAKAO') { // 카카오 로그인일 때
		Kakao.API.request({
	       url: '/v1/user/unlink',
	       success: function (response) {
	      	 let kakaoId = "K"+response.id;
	      	 if(kakaoId == id){
	      		id = kakaoId;
	      		alert(id);
	      	 }else{
	      		alert("탈퇴에 실패했습니다.");
	      		return;
	      	 }
	       },
	       fail: function (error) {
	           alert("카카오 로그인 상태가 아닙니다.");
	       }
		});
	}
	$("#deleteForm").submit();
}

function withdrawAjax() {
	let id = $("#userId").val();
	const data = {"userId" : id};
	
	alert("진입");
	$.ajax({
		url : "/mypage/delete",
		type: "post",
		data: JSON.stringify(data),
		dataType: "json",
		contentType: "application/json",
		success : function(result) {
			alert("성공:"+result);
			if (result == -1) {
				alert("통신 오류");
			} else {
				alert("탈퇴 성공");
				//alert("탈퇴되었습니다.");
				//window.location.href = "/index";
			}
		},
		error : function(errorThrown) {
			alert(errorThrown.statusText);
		}
	});
}

////회원 탈퇴 (카카오)
//function dropKakao() {
//	Kakao.API.request({
//       url: '/v1/user/unlink',
//       success: function (response) {
//      	 let kakaoId = "K"+response.id;
//
//       },
//       fail: function (error) {
//           alert("카카오 로그인 상태가 아닙니다.");
//       }
//   });
//}