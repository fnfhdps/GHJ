package com.guhaejwo.biz.user.impl;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.user.LoginType;
import com.guhaejwo.biz.user.Role;
import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userService")
public class UserServiceImpl {
	
	private final UserService userRepository;
	
	@Autowired
	public UserServiceImpl(UserService userRepository) {
		this.userRepository = userRepository;
	}
	
	// 회원 저장(일반)
	public String join(UserDTO user) {
		user.setLoginType(LoginType.BASIC);
		user.setUserRole(Role.USER);

		userRepository.save(user);
		return user.getUserId();
	}
	
	// 회원 저장(카카오)
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
	
	// 회원 삭제 (마이페이지, 관리자페이지)
	public void withdraw(UserDTO user) {
		userRepository.delete(user);
	}
	
	// 아이디 중복 체크 조회
	public UserDTO findById(UserDTO user) {
		return userRepository.getUserById(user);
	}
	
	// 이메일 중복 체크 조회 (마이페이지)
	public UserDTO findByEmail(UserDTO user) {
		return userRepository.getUserByEmail(user);
	}

	// 회원 수정(마이페이지, 관리자페이지)
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
	
	// 회원 목록 조회 (관리자페이지)
	public List<UserDTO> getUserList(){
		return userRepository.getUserList();
	}

	// 총 회원수 (관리자페이지)
	public int userTotalCnt() {
		return userRepository.userTotalCnt();
	}
	
	// 회원 정보 상세 조회 (관리자페이지)
	public UserDTO getUser(UserDTO user) {
		return userRepository.getUser(user);
	}
	
	// 회원 총 게시글 수 (마이페이지, 관리자페이지)
	public int userAdoptCnt(UserDTO user) {
		return userRepository.userAdoptCnt(user);
	}
	
	// 회원 총 좋아요 수 (마이페이지, 관리자페이지)
	public int userHeartCnt(UserDTO user) {
		return userRepository.userHeartCnt(user);
	}
	
	// 회원 총 후원수 (마이페이지, 관리자페이지)
	public int userSponsorCnt(UserDTO user) {
		return userRepository.userSponsorCnt(user);
	}
	
	// 회원 총 문의수 (관리자페이지)
	public int userQnaCnt(UserDTO user) {
		return userRepository.userQnaCnt(user);
	}
	
	// 회원 총 댓글수 (관리자페이지)
	public int userReplyCnt(UserDTO user) {
		return userRepository.userReplyCnt(user);
	}
	
	// 회원 총 신고받은수 (관리자페이지)
	public int userBlameCnt(UserDTO user) {
		return userRepository.userBlameCnt(user);
	}
	
	
}
