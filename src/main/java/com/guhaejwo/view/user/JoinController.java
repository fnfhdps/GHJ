package com.guhaejwo.view.user;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.guhaejwo.biz.user.LoginType;
import com.guhaejwo.biz.user.Role;
import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.impl.UserService;

@Controller
public class JoinController {

	private final UserService userService;
	
	@Autowired
	public JoinController(UserService userService) {
		this.userService = userService;
	}
	
	// 회원 가입 이동
	@GetMapping("/join")
	public String getJoinPage() {
		return "join";
	}
	
	// 회원 가입
	@PostMapping("/join")
	public String join(UserDTO user) {
		userService.join(user);
		return "login";
	}
	
	// 아이디 중복 체크
	@PostMapping("/join/checkId")
	public @ResponseBody Object checkId(@RequestBody UserDTO user) {
		UserDTO existUser;
		existUser = userService.findById(user);
		try {
			if(existUser == null) {
				return 0;
			} else {
				return 1; // 아무거나 넣었음
			}
		} catch (Exception e) {
			return 9;
		}
	}
	
	// 휴대폰 인증 번호 생성
	@GetMapping(value = "/phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		userService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return Integer.toString(randomNumber);
	}

}
