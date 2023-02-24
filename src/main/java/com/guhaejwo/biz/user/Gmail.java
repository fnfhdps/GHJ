package com.guhaejwo.biz.user;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// javax.mail의 Authenticator 상속
public class Gmail extends Authenticator {
	// 외부 라이브러리 추가
	//	1. javamail 라이브러리 추가
	//	2. activation 라이브러리 추가
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		// 실제로 사용자한테 메일을 전송할, 그 메일을 보내는 사람, 즉 관리자 자신의 gmail 계정의 아이디와 비밀번호.
		// new PasswordAuthentication("자신의 구글 아이디", "구글 비밀번호");
		return new PasswordAuthentication("mimh0332", "Dkfvk7103!");
		
		// 구글 로그인 후 설정으로 이동해서 보안수준이 낮은 앱 허용하기.
	}
}
