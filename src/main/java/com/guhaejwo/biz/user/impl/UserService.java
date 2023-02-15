package com.guhaejwo.biz.user.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.user.LoginType;
import com.guhaejwo.biz.user.Role;
import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.UserRepository;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userService")
public class UserService {
	
	private final UserRepository userRepository;
	
	@Autowired
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	// 일반 회원가입
	public String join(UserDTO user) {
		user.setLoginType(LoginType.BASIC);
		user.setUserRole(Role.USER);

		userRepository.save(user);
		return user.getUserId();
	}
	
	// 카카오 회원가입
	public String join_kakao(UserDTO user) {
		user.setLoginType(LoginType.KAKAO);
		user.setUserRole(Role.USER);
	
		userRepository.save(user);
		return user.getUserId();
	}
	
	// 비밀번호 조회
	public UserDTO getUserByPw(UserDTO user) {
		return userRepository.getUserByPw(user);
	}
	
	// 일반 회원 탈퇴
	public void withdraw(UserDTO user) {
		userRepository.delete(user);
	}
	
	// 회원 검색(ID)
	public UserDTO findById(UserDTO user) {
		return userRepository.getUserById(user);
	}
	
	// 회원 검색(ID & Email)
	public UserDTO findByEmail(UserDTO user) {
		return userRepository.getUserByEmail(user);
	}

	// 회원 정보 수정(마이페이지)
	public void update(UserDTO user) {
		userRepository.update(user);
	}
	
	// 휴대폰 번호 인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSP1Q8KU7TNOPM4";
	    String api_secret = "O9ARSGZNYCVH2XDC2NVVKARPQO7YKCRV";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01076336031");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}
	
	// 비밀번호 변경
	public void changePw(UserDTO user) {
		userRepository.changePw(user);
	}
}
