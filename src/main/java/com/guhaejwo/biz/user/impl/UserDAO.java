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
		// System.out.println("---> MybatisUserRepository.save() 완료");
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
		//System.out.println("---> MybatisUserRepository.delete() 완료");
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(UserDTO user) {
		System.out.println("---> MybatisUserRepository.user() 실행");
		System.out.println(user);
		mybatis.update("UserDAO.updateUser", user);
	}

	@Override
	public void changePw(UserDTO user) {
		System.out.println("---> MybatisUserRepository.changePw() 실행");
		mybatis.update("UserDAO.changePw", user);
	}

}
