package com.guhaejwo.view.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cs")
public class CsController {

	public CsController() {}
	
	// faq 이동
	@GetMapping("/faq")
	public String faq() {
		return "/cs/faq";
	}

	// notice 이동
	@GetMapping("/notice")
	public String notice() {
		return "/cs/faq";
	}
	
	// qna 이동
	@GetMapping("/qna")
	public String qna() {
		return "/cs/qna";
	}
	
}
