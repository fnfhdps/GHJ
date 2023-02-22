package com.guhaejwo.view.adminPage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.impl.UserServiceImpl;

@Controller
public class AdminPageController {

	private final UserServiceImpl userService;
	
	@Autowired
	public AdminPageController(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	// 회원정보목록 이동 (관리자페이지)
	@GetMapping("/admin/member/list")
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
		model.addAttribute("momber", userService.getUser(user));
		
		return "/adminPage/member_info";
	}
	
	// 회원 수정 (관리자페이지) ***추후 파일업로드 추가***
	@PostMapping("/admin/member/info/update")
	public String update(UserDTO user) throws Exception{		
		userService.update(user);
		return "redirect:/admin/member/list";
	}
	
	// 회원 삭제 (관리자페이지) **이거 되려나**
	@PostMapping(value = "/admin/member/info/delete")
	public String withdraw(UserDTO user, HttpSession session) {
		System.out.println("id, pw 확인 : "+user);
		
		UserDTO findPw = new UserDTO();
		findPw = userService.getUserByPw(user);
		
		if (findPw != null) {
			userService.withdraw(user);
			session.removeAttribute("login");
			session.invalidate();
			return "redirect: /index";
		} else {
			return "redirect: /test.jsp";
		}
	}
	
	// 입양글관리 이동 (관리자페이지)
	@GetMapping("/admin/board")
	public String board(Model model) {
		// 총 입양글
		model.addAttribute("totalCnt");
		
		return "/adminPage/board";
	}
	
	// 댓글관리 이동 (관리자페이지)
	@GetMapping("/admin/comment")
	public String comment() {
		
		return "/adminPage/comment";
	}
	
	// 공지사항 이동 (관리자페이지)
	@GetMapping("/admin/notice")
	public String notice() {
		return "/adminPage/notice";
	}
	
	// 공지사항 등록 이동 (관리자페이지)
	@GetMapping("/admin/notice/insert")
	public String noticeInsert() {
		return "/adminPage/notice_form";
	}
	
	// 공지사항 수정 이동 (관리자페이지)
	@GetMapping("/admin/notice/update")
	public String noticeUpdate() {
		return "/adminPage/notice_form";
	}
	
	// 1:1문의 이동 (관리자페이지)
	@GetMapping("/admin/qna")
	public String qna() {
		return "/adminPage/qna_list";
	}
	
	// 후원 상품 목록 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/item")
	public String sponsorItem() {
		return "/adminPage/sponsor_item";
	}
	
	// 후원 상품 목록 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/item/insert")
	public String sponsorItemInsert() {
		return "/adminPage/sponsor_item_form";
	}
	
	// 후원 상품 주문 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/order")
	public String sponsorOrder() {
		return "/adminPage/sponsor_order";
	}
	
	
}
