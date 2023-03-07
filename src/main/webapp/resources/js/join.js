/**
 * 회원가입 js
 */

// 값 체크 변수
let id_check = false;
let pw_check = false;
let name_check = false;
let phone_check = false;

// 휴대폰 번호 패턴
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
        url:"phoneCheck?phone=" + phone,
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
        		//$("#phone").attr("readonly",true);
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
		$("#phone2").attr("disabled",true);
		phone_check = true;
	}else{
		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successPhoneChk").css("color","red");
		$("#phoneDoubleChk").val("false");
		$(this).attr("autofocus",true);
	}
});


// 아이디 패턴 체크
function idPtnchk(id) {
    const num = id.search(/[0-9]/g);
    const eng = id.search(/[a-zA-Z]/ig);
    const spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    let chk_num = false;
    let chk_eng = false;
    let chk_spe = false;
    let chk_len = false;

    if( eng >= 0 ) {
        chk_eng = true;
    }
    if( num >= 0 ) {
        chk_num = true;
    }
    if( spe >= 0 ) {
        chk_spe = true;
    }
    if( id.length > 5 && id.length < 21 ) {
        chk_len = true;
    }

    if(chk_spe){
    	return false;
    }else if( chk_eng && chk_num && chk_len ){
        return true;
    }else if(chk_eng && chk_len){
    	return true;
    }else{
        return false;
    }
}

$("#userId").focusout(function() {
	let userId  = $(this).val();
	if(idPtnchk(userId)){
		const userData = {"userId": userId};
		$.ajax({
			url: "/join/checkId",
			type: "post",
			data: JSON.stringify(userData),
			dataType: "json",
			contentType: "application/json",
			success: function(result){
				if(result == 0) {
					$("#idCheckMsg").text("사용 가능한 아이디입니다.")
					.css("color","green");
					id_check = true;
				} else if(result == 9) {
					alert("통신 오류");
				} else {
					$("#idCheckMsg").text("이미 사용중인 아이디입니다.")
					.css("color","red");
				}
			},
			error : function(errorThrown){
				alert(errorThrown.statusText);
			}
		});
	}else{
		$("#idCheckMsg").text("6~20자의 영문 소문자, 숫자를 포함해야 합니다.")
		.css("color","red");
		
	}
});


//비밀번호 패턴 확인
function pwPtnchk(pw) {
    const num = pw.search(/[0-9]/g);
    const eng = pw.search(/[a-z]/ig);
    const spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    let chk_num = false;
    let chk_eng = false;
    let chk_spe = false;
    let chk_len = false;

    if( eng >= 0 ) {
        chk_eng = true;
    }
    if( num >= 0 ) {
        chk_num = true;
    }
    if( spe >= 0 ) {
        chk_spe = true;
    }
    if( pw.length > 7 || pw.length < 17 ) {
        chk_len = true;
    }

    if( chk_eng && chk_num && chk_spe && chk_len ){
        return true;
    }else{
        return false;
    }
}

// 비밀번호 패턴 확인
$("#userPw").focusout(function() {
	let userPw  = $(this).val();
	
	if(pwPtnchk(userPw)){
		$("#pwCheckMsg").text("");
	}else{
		$("#pwCheckMsg").text("8~16자 영문 대 소문자, 숫자, 특수문자를 포함해야 합니다.")
		.css("color","red");
	}
});

// 비밀번호 재확인
$("#pwCheck").focusout(function() {
	const userPw = $('#userPw').val();
	const pwCheck = $(this).val();
	
	if(userPw !== pwCheck){
		$("#pwCheckMsg2").text("비밀번호가 일치하지 않습니다.")
		.css("color","red");
		return;
	}else if ((pwCheck != "") && (userPw == pwCheck)){
		$("#pwCheckMsg2").text("비밀번호가 일치합니다.")
		.css("color","green");
		pw_check = true;
	}
});

$("#pwView").click(function() {
	let eye = $(this).attr("class");
	if(eye == "bi bi-eye-fill"){ // 비번 -> 텍스트
		$("#userPw").prop("type", "text");
		$(this).attr("class", "bi bi-eye-slash-fill");
	}else{
		$("#userPw").prop("type", "password"); // 텍스트 -> 비번
		$(this).attr("class", "bi bi-eye-fill");
	}
});

// 
$("#userName").focusout(function() {
	if($(this).val() != ""){
		name_check = true;
		$("#nameCheckMsg").text("");
	}else{
		name_check = false;
	}
})


// 회원가입 체크 후 submit
function checkSummit(){

	// 이메일 합치기
	let beforeEmail = $("#beforeEmail").val();
	let afterEmail = $("#afterEmail").val();


	let emailVal = beforeEmail + '@' + afterEmail;
	if(beforeEmail != ''){
		$("#emailVal").val(emailVal);
	}

	
	if(!($('#member').is(':checked') && $('#individual').is(':checked'))){
		alert("약관에 동의해주세요");
		return;
	}
	if(id_check != true){
		$("#idCheckMsg").text("필수 정보입니다.")
		.css("color","red");
	}
	if(pw_check != true){
		$("#pwCheckMsg").text("필수 정보입니다.")
		.css("color","red");
		$("#pwCheckMsg2").text("필수 정보입니다.")
		.css("color","red");
	}
	if(name_check != true){
		$("#nameCheckMsg").text("필수 정보입니다.")
		.css("color","red");
	}
	if(phone_check != true){
		$("#phoneCheckMsg").text("필수 정보입니다.")
		.css("color","red");
	} 
	
	if((id_check == true) && (pw_check == true) && (name_check == true) && (phone_check == true)) {
		alert("환영합니다");
		$('#join-form').submit();
	}
}
