package com.guhaejwo.view.user;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.impl.UserServiceImpl;

@Controller
@SessionAttributes("login")
public class userMyPageController {
	
	private final UserServiceImpl userService;
	
	@Autowired
	public userMyPageController(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	
	
}
