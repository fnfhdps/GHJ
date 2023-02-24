package com.guhaejwo.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.impl.UserServiceImpl;

@Controller
public class LoginController {

	private final UserServiceImpl userService;
	
	@Autowired
	public LoginController(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	// 로그인 페이지 이동
	@GetMapping("/login")
	public String getLoginForm() {
		return "login";
	}
	
	// 로그인
	@PostMapping("/login")
	public @ResponseBody Object login(@RequestBody UserDTO user, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserDTO loginUser = new UserDTO();

		try {
			loginUser = userService.findById(user);
			if(loginUser != null && (loginUser.getUserPw()).equals(user.getUserPw())) {	// 성공
				session.setAttribute("login", loginUser);
				if(loginUser.getUserRole().equals("USER")) { // 유저
					return 1;
				}else {										// 관리자
					return 2;
				}
			} else {
				return -1; // 없을 때
			}
		} catch (Exception e) { // 통신오류
			return 9;
		}
	}
	
	// 카카오 로그인
	@PostMapping("/login/kakao")
	public @ResponseBody Object kakaoLogin(@RequestBody UserDTO user, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserDTO loginUser = new UserDTO();
		
		try {
			loginUser = userService.findById(user);
			if(loginUser != null) {	// 로그인 정보가 있다면
				session.setAttribute("login", loginUser);
				return loginUser;
			} else { // 없으면 회원가입
				userService.join_kakao(user);
				session.setAttribute("login", user);
				return user;
			}
		} catch (Exception e) { // 통신오류
			return 9;
		}
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/login/findPw")
	public String getfindForm(){
		return "find_pw";
	}
	
	// 비밀번호 찾기
	@PostMapping("/login/findPw")
	public @ResponseBody Object findPw(@RequestBody UserDTO user){
		UserDTO findedUser = new UserDTO();
		
		try {
			findedUser = userService.findByEmail(user);
			if(findedUser != null) {
				return findedUser;
			} else {
				return 0;
			}
		} catch (Exception e) {
			return 9;
		}
	}
	
}
