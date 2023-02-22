package com.guhaejwo.biz.user.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.user.LoginType;
import com.guhaejwo.biz.user.Role;
import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userAdminPageService")
public class UserAdminPageServiceImpl {
	
	private final UserService userRepository;
	
	@Autowired
	public UserAdminPageServiceImpl(UserService userRepository) {
		this.userRepository = userRepository;
	}

}
