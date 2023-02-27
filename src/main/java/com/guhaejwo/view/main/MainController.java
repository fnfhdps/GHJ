package com.guhaejwo.view.main;

import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptService;

@Controller
@SessionAttributes("indexAdopt")
public class MainController {
	
	private AdoptService adoptService;
	
	@Autowired
	public MainController(AdoptService adoptService) {
		this.adoptService = adoptService;
	}
	
	@GetMapping("/index")
	public String getMainPage(AdoptDTO adopt, Model model) {
		model.addAttribute("indexAdopt", adoptService.getAdoptList(adopt));
		return "redirect: index.jsp";
	}
	
//	@GetMapping("/index")
//	public String getMainPage(HttpSession session) {
//		return "redirect: index.jsp";
//	}
}
