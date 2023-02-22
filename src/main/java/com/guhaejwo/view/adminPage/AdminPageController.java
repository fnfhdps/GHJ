package com.guhaejwo.view.adminPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminPageController {

	public AdminPageController() {}
	
	// 회원정보목록 이동 (관리자페이지)
	@GetMapping("/admin/member/list")
	public String memberList() {
		
		return "/adminPage/member_list";
	}
	
	// 회원상세조회 이동 (관리자페이지)
	@GetMapping("/admin/member/info")
	public String memberInfo() {
		return "/adminPage/member_info";
	}
	
	// 게시글관리 이동 (관리자페이지)
	@GetMapping("/admin/board")
	public String board() {
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
