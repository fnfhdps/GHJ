package com.guhaejwo.view.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	public ChatController() {}
	
	@RequestMapping(value = "/chat", method = { RequestMethod.GET })
	public String chat (HttpServletRequest req, HttpServletResponse res, HttpSession ssesion) {
		return "/chat/chat";
	}
}
