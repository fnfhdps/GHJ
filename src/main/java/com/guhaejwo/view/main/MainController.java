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

import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptService;

@Controller
public class MainController {
	
	private AdoptService adoptService;
	
	@Autowired
	public MainController(AdoptService adoptService) {
		this.adoptService = adoptService;
	}
	
//	@GetMapping("/index")
//	public @ResponseBody int getMainPage(AdoptDTO adopt, Model model, HttpServletRequest req) {
////		AdoptDTO adopt = new AdoptDTO();
//		HttpSession session = req.getSession();
//		try {
//			model.addAttribute("adoptList1", adoptService.getAdoptList(adopt));
//			System.out.println("컨트롤러 ㅇㅋ?");
//			System.out.println(session.getAttribute("adoptList1"));
//			return 0;
////			return "redirect: index.jsp";
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//			return -1;
//		}
//	}
//	
	@GetMapping("/index")
	public String getMainPage(HttpSession session) {
		return "redirect: index.jsp";
	}
}
