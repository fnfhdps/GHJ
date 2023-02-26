/**
 * 
 */
	//회원 탈퇴 모달 js
  $('#modalBtn').click(function(e){
    e.preventDefault();
    $('#withdrawModal').modal("show");
  });

/*   $("input[type='checkbox']").click(function() {
    if($(this).is(':checked')){
      $("#withdrawBtn").prop("disabled", false);
      // $(this).removeAttr("checked");
    }else{
      $("#withdrawBtn").prop("disabled", ture);
    }
  }); */
  
  
  // 회원탈퇴
  function withdraw() {
	  if(!($('input[type="checkbox"]').is(':checked'))){
		  alert("탈퇴 안내를 확인하고 동의해 주세요.");
		  return;
	  }else{
		  $("#deleteForm").submit();
	  }
	}
  
  //현재 비밀번호 확인
  $('#pwSuccess').css('display', 'none');
  $('#pwDanger').css('display', 'none');

  $('#current_pw').focusout(function() {
  	let pw1 = $("#userPw").val();
  	let pw2 = $(this).val();
  	
  	//alert("pw1 : "+ pw1 + "pw2 : "+ pw2);
  	if((pw1 != '')&&(pw2 == '')){
  		null;
  	}else if((pw1 != '') || (pw2 != '')){
  		if(pw1 == pw2){
  			$('#pwSuccess').css('display', 'inline-block').css("color","green");
  			$('#pwDanger').css('display', 'none');
  			$("#change_pw").removeAttr("disabled");
  			$("#check_pw").removeAttr("disabled");
  			$(this).prop("disabled", true);
  		}else {
              $("#pwSuccess").css('display', 'none');
              $("#pwDanger").css('display', 'inline-block').css("color","red");
          }
  	}
  });

  // 새 비밀번호 확인
  // submit시 비밀번호 한번더 확인
  $("#btn_pw").click(function() {
  	const userSeq = $("#userSeq").val();
  	const currentPw = $("#current_pw").val();
  	const changePw = $('#change_pw').val();
  	const pwCheck = $('#check_pw').val();
  	
  	if(changePw != pwCheck){
  		alert("비밀번호를 확인해주세요");
  	}else if(currentPw == changePw){
  		alert("이전과 동일한 비밀번호 입니다.");
  	}else{
  		let data = {
  				"userSeq" : userSeq,
  				"userPw" : changePw
  					};
  	  	$.ajax({
  	  		url : "/change_pw",
  	  		type: "post",
  			data: JSON.stringify(data),
  			dataType: "json",
  			contentType: "application/json",
  			success : function(result) {
  				//alert("성공:"+result);
  				if (result == -1) {
  					alert("통신 오류");
  				} else {
  					alert("변경 되었습니다.");
  					location.href = "/mypage/info";
  				}
  			},
  			error : function(errorThrown) {
  				alert(errorThrown.statusText);
  			}
  		});
  	}
  });

//휴대폰 번호 패턴
  const autoHyphen = function(target) {
  	 target.value = target.value
  	   .replace(/[^0-9]/g, '')
  	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
  	}
  
//휴대폰 번호 인증
  let code2 = "";
  $("#phoneChk").click(function(){
  	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
  	const phone = $("#phone").val();
  	$.ajax({
          type:"GET",
          url:"/phoneCheck?phone=" + phone,
          cache : false,
          success:function(data){
          	if(data == "error"){
          		alert("휴대폰 번호가 올바르지 않습니다.");
  				$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
  				$(".successPhoneChk").css("color","red");
  				$("#phone").attr("autofocus",true);
          	}else{	        		
          		$("#phone2").attr("disabled",false);
          		$("#phoneChk2").css("display","inline-block");
          		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
          		$(".successPhoneChk").css("color","green");
          		$("#phone").attr("readonly",true);
          		code2 = data;
          	}
          }
      });
  });
  
//휴대폰 인증번호 대조
  $("#phoneChk2").click(function(){
  	if($("#phone2").val() == ""){
  		$(".successPhoneChk").text("인증번호를 입력하세요.");
  	}else if($("#phone2").val() == code2){
  		$(".successPhoneChk").text("인증번호가 일치합니다.");
  		$(".successPhoneChk").css("color","green");
  		$("#phoneDoubleChk").val("true");
  		$("#phone2").attr("readonly",true);
  		phone_check = true;
  	}else{
  		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
  		$(".successPhoneChk").css("color","red");
  		$("#phoneDoubleChk").val("false");
  		$(this).attr("autofocus",true);
  	}
  });
  
  // 주소 api
  function excution_addr(){
	     
      new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;

                  } else {
                    addr += " ";
                  }

                $("#addr1").val(data.zonecode);
                $("#addr2").val(addr);
                $("#addr3").val(""); //이거 왜 안됨...
                $("#addr3").attr("readonly", false).focus();
            }
        }).open();
    }
    
function drop() {
	//const loginType = $("#loginType").val();

	if(window.confirm("탈퇴하시면 기존의 저장된 활동 내역이 모두 사라집니다")){
		if(loginType == "KAKAO"){
			dropKakao();
		}else{
			dropBasic();
		}
	}
}

//회원 탈퇴 (기본)
function dropBasic() {
	const id = $("#userId").val();
	let data = {"userId" : id};
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
				alert("탈퇴되었습니다.");
				window.location.href = "/index";
			}
		},
		error : function(errorThrown) {
			alert(errorThrown.statusText);
		}
	  	});
}

// 회원 탈퇴 (카카오)
function dropKakao() {
  	Kakao.API.request({
         url: '/v1/user/unlink',
         success: function (response) {
     	$.ajax({
     	url : "/mypage/delete",
		type : "post",
		data : {"userId" : "K"+response.id},
		dataType : "json",
		contentType : "application/json",
		success : function(result) {
			if (result == -1) {
				alert("통신 오류");
			} else {
				alert("탈퇴되었습니다.");
				window.location.href = "/index";
			}
		},
		error : function(errorThrown) {
			alert(errorThrown.statusText);
		}
         	})
         },
         fail: function (error) {
             alert("카카오 로그인 상태가 아닙니다.");
         }
     });
}

