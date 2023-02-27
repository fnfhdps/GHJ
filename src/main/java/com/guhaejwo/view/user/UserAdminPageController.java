package com.guhaejwo.view.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.guhaejwo.biz.user.impl.UserServiceImpl;

@Controller
public class UserAdminPageController {

	private final UserServiceImpl userService;
	
	@Autowired
	public UserAdminPageController(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	// 회원정보목록 이동 (관리자페이지)
	@GetMapping("/admin/member")
	public String memberList(Model model) {
		// 총 회원수
		model.addAttribute("totalCnt", userService.userTotalCnt());
		// 회원 목록
		model.addAttribute("memberList", userService.getUserList());
		
		return "/adminPage/member_list";
	}
	
	// 회원상세조회 이동 (관리자페이지)
	@GetMapping("/admin/member/info/{seq}")
	public String memberInfo(@PathVariable("seq") int userSeq, Model model) {
		UserDTO user = new UserDTO();
		user.setUserSeq(userSeq);
		
		// 각 컨텐츠별 회원의 총 갯수
		Map<String, Integer> totalCnt = new HashMap<String, Integer>();
		totalCnt.put("adopt", userService.userAdoptCnt(user));
		totalCnt.put("reply", userService.userReplyCnt(user));
		totalCnt.put("sponsor", userService.userSponsorCnt(user));
		totalCnt.put("qna", userService.userQnaCnt(user));
		totalCnt.put("blame", userService.userBlameCnt(user));
		
		model.addAttribute("totalCnt", totalCnt);
		// 회원 상세
		model.addAttribute("member", userService.getUser(user));
		
		return "/adminPage/member_info";
	}
	
	// 회원 수정 (관리자페이지) ***추후 파일업로드 추가***
	@PostMapping("/admin/member/update")
	public String update(UserDTO user) throws Exception{		
		userService.update(user);
		return "redirect: /admin/member";
	}
	
	// 회원 삭제 (관리자페이지)
	@PostMapping(value = "/admin/member/delete")
	public @ResponseBody int withdraw(@RequestBody UserDTO user, HttpSession session) {
		try {
			userService.withdraw(user);
			return 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}
}
