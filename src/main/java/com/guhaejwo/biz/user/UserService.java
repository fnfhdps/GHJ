package com.guhaejwo.biz.user;

import java.util.List;

public interface UserService {
	
	// 회원 저장
	public void save(UserDTO user);
	
	// 회원 수정 (마이페이지, 관리자페이지)
	public void update(UserDTO user);
	
	// 비밀번호 조회
	public UserDTO getUserByPw(UserDTO user);
	
	// 회원 삭제 (마이페이지, 관리자페이지)
	public void delete(UserDTO user);
	
	// 아이디 중복 체크 조회
	public UserDTO getUserById(UserDTO user);
	
	// 이메일 중복 체크 조회 (마이페이지)
	public UserDTO getUserByEmail(UserDTO user);
	
	// 회원 목록 조회 (관리자페이지)
	public List<UserDTO> getUserList();
	
	// 비밀번호 변경
	public void changePw(UserDTO user);
	
	// 총 회원수 (관리자페이지)
	public int userTotalCnt();
	
	// 회원 정보 상세 조회 (관리자페이지)
	public UserDTO getUser(UserDTO user);
	
	// 회원 총 게시글 수 (마이페이지, 관리자페이지)
	public int userAdoptCnt(UserDTO user);
	
	// 회원 총 좋아요 수 (마이페이지, 관리자페이지)
	public int userHeartCnt(UserDTO user);
	
	// 회원 총 후원수 (마이페이지, 관리자페이지)
	public int userSponsorCnt(UserDTO user);
	
	// 회원 총 문의수 (관리자페이지)
	public int userQnaCnt(UserDTO user);
	
	// 회원 총 댓글수 (관리자페이지)
	public int userReplyCnt(UserDTO user);
	
	// 회원 총 신고받은수 (관리자페이지)
	public int userBlameCnt(UserDTO user);
	
}
