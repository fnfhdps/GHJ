package com.guhaejwo.biz.user;

import java.util.List;

public interface UserService {
	
	// 회원 저장
	public void save(UserDTO user);
	
	// 회원 수정
	public void update(UserDTO user);
	
	// 비밀번호 조회
	public UserDTO getUserByPw(UserDTO user);
	
	// 회원 삭제
	public void delete(UserDTO user);
	
	// 회원 검색
	public UserDTO getUserById(UserDTO user);
	
	// id&이메일로 회원 검색
	public UserDTO getUserByEmail(UserDTO user);
	
	// 회원 리스트 가져오기
	public List<UserDTO> getUserList();
	
	// 비밀번호 변경
	public void changePw(UserDTO user);
}
