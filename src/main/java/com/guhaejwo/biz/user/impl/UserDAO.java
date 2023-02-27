package com.guhaejwo.biz.user.impl;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository("userRepository")
public class UserDAO implements UserService{

	private final SqlSessionTemplate mybatis;
	
	@Autowired
	public UserDAO(SqlSessionTemplate mybatis) { 
		this.mybatis = mybatis; 
	}
	
	@Override
	public void save(UserDTO user) {
		System.out.println("---> MybatisUserRepository.save() 실행");
		mybatis.insert("UserDAO.insertUser", user);
	}
	
	@Override
	public UserDTO getUserByPw(UserDTO user) {
		System.out.println("---> MybatisUserRepository.getUserByPw() 실행");
		return mybatis.selectOne("UserDAO.getUserByPw", user);
	}
	
	@Override
	public void delete(UserDTO user) {
		System.out.println("---> MybatisUserRepository.delete() 실행");
		mybatis.delete("UserDAO.deleteUser", user);
	}

	@Override
	public UserDTO getUserById(UserDTO user) {
		System.out.println("--> MybatisUserRepository.getUser() 실행");
		return mybatis.selectOne("UserDAO.getUserById", user);
	}
	
	@Override
	public UserDTO getUserByEmail(UserDTO user) {
		System.out.println("--> MybatisUserRepository.getUserByEmail() 실행");
		return mybatis.selectOne("UserDAO.getUserByEmail", user);
	}

	@Override
	public List<UserDTO> getUserList() {
		System.out.println("--> MybatisUserRepository.getUserList() 실행");
		return mybatis.selectList("UserDAO.getUserList");
	}

	@Override
	public void update(UserDTO user) {
		System.out.println("---> MybatisUserRepository.updateUser() 실행");
		mybatis.update("UserDAO.updateUser", user);
	}

	@Override
	public void changePw(UserDTO user) {
		System.out.println("---> MybatisUserRepository.changePw() 실행");
		mybatis.update("UserDAO.changePw", user);
	}

	@Override
	public int userTotalCnt() {
		System.out.println("--> MybatisUserRepository.userTotalCnt() 실행");
		return mybatis.selectOne("UserDAO.userTotalCnt");
	}

	@Override
	public UserDTO getUser(UserDTO user) {
		System.out.println("--> MybatisUserRepository.getUser() 실행");
		return mybatis.selectOne("UserDAO.getUser", user);
	}

	@Override
	public int userAdoptCnt(UserDTO user) {
		System.out.println("--> MybatisUserRepository.userAdoptCnt() 실행");
		return mybatis.selectOne("UserDAO.userAdoptCnt", user);
	}

	@Override
	public int userHeartCnt(UserDTO user) {
		System.out.println("--> MybatisUserRepository.userHeartCnt() 실행");
		return mybatis.selectOne("UserDAO.userHeartCnt", user);
	}

	@Override
	public int userSponsorCnt(UserDTO user) {
		System.out.println("--> MybatisUserRepository.userSponsorCnt() 실행");
		return mybatis.selectOne("UserDAO.userSponsorCnt", user);
	}

	@Override
	public int userQnaCnt(UserDTO user) {
		System.out.println("--> MybatisUserRepository.userQnaCnt() 실행");
		return mybatis.selectOne("UserDAO.userQnaCnt", user);
	}

	@Override
	public int userReplyCnt(UserDTO user) {
		System.out.println("--> MybatisUserRepository.userReplyCnt() 실행");
		return mybatis.selectOne("UserDAO.userReplyCnt", user);
	}

	@Override
	public int userBlameCnt(UserDTO user) {
		System.out.println("--> MybatisUserRepository.userBlameCnt() 실행");
		return mybatis.selectOne("UserDAO.userBlameCnt", user);
	}

	@Override
	public void updateLastTime(UserDTO user) {
		System.out.println("---> MybatisUserRepository.updateLastTime() 실행");
		mybatis.update("UserDAO.updateLastTime", user);
	}
	

}
