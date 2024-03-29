package com.guhaejwo.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {

	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
			session.invalidate();
		return "redirect: /index";

	}
}
