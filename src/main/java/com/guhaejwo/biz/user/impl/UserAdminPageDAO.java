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

@Repository
public class UserAdminPageDAO{

	private final SqlSessionTemplate mybatis;
	
	@Autowired
	public UserAdminPageDAO(SqlSessionTemplate mybatis) { 
		this.mybatis = mybatis; 
	}
	
}
