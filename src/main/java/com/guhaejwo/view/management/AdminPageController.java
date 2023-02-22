package com.guhaejwo.view.management;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.guhaejwo.biz.board.BoardDTO;
import com.guhaejwo.biz.board.BoardService;
import com.guhaejwo.biz.board.impl.BoardServiceImpl;
import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.SponsorService;
import com.guhaejwo.biz.user.UserDTO;
import com.guhaejwo.biz.user.impl.UserServiceImpl;

import oracle.net.aso.c;

@Controller
@SessionAttributes("sponsorDetail")
public class AdminPageController {

	private final UserServiceImpl userService;
	private final BoardService boardService;
	private final SponsorService sponsorService;
	
	@Autowired
	public AdminPageController(UserServiceImpl userService, BoardService boardService, SponsorService sponsorService) {
		this.userService = userService;
		this.boardService = boardService;
		this.sponsorService = sponsorService;
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
		return "redirect:/admin/member";
	}
	
	// 회원 삭제 (관리자페이지) **이거 되려나**
	@PostMapping(value = "/admin/member/delete")
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
	
	// 입양글, 공지사항, 1:1문의 목록 이동 (관리자페이지)
	@GetMapping("/admin/{category}")
	public String getboardList(@PathVariable("category") String category, Model model) {
		BoardDTO board = new BoardDTO();
		board.setBoardCategory(category);
		
		// 총 입양글
		model.addAttribute("totalCnt", boardService.boardTotalCnt(board));
		model.addAttribute("boardList", boardService.getBoardList(board));
		
		return "/adminPage/"+category.toLowerCase();
		
//		if(category.equals("ADOPT")) {
//			return "/adminPage/adopt";
//		}else if(category.equals("NOTICE")) {
//			return "/adminPage/notice";
//		}else {
//			return "/adminPage/qna";
//		}
	}
	
	// 공지사항 입력 이동 (관리자페이지)
	@GetMapping("/admin/notice/insert")
	public String noticeInsert() {
		return "/adminPage/notice_form";
	}
	
	// 공지사항 입력 (관리자페이지)
	@PostMapping("/admin/notice/insert")
	public String insertBoard(BoardDTO board) {
		boardService.insertBoard(board);
		return "redirect:/admin/NOTICE";
	}
	
	// 입양글, 공지사항 삭제 (관리자페이지)
	//카테고리 맞으면 해당 페이지 목록으로 아니면 이전페이지로
	@PostMapping("/admin/{category}/delete")
	public String deleteBoard(@PathVariable("category") String category, @RequestBody BoardDTO board) {

		return "redirect:/admin/"+category;
		//		if(category.equals("ADOPT")) {
//			return "redirect:/admin/"+category;
//		}else if(category.equals("NOTICE")) {
//			return "/adminPage/notice";
//		}else {
//			return "/adminPage/qna";
//		}
	}
	
	// 댓글관리 이동 (관리자페이지)
	@GetMapping("/admin/comment")
	public String comment() {
		
		return "/adminPage/comment";
	}
	
	// 공지사항 수정 이동 (관리자페이지)
	@GetMapping("/admin/notice/update")
	public String noticeUpdate() {
		return "/adminPage/notice_form";
	}
	
	// 후원 상품 목록 (관리자페이지)
	@GetMapping("/admin/sponsor/item")
	public String getSponsorItemList(Model model) {
		// 총 상품수
		model.addAttribute("totalCnt", sponsorService.sponsorItemTotalCnt());
		// 상품 목록
		model.addAttribute("sponsorItemList", sponsorService.getSponsorItemList());
		return "/adminPage/sponsor_item";
	}
	
	// 후원 상품 입력 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/item/insert")
	public String insertSponsorItem() {
		return "/adminPage/sponsor_item_form";
	}
	
	// 후원 상품 입력 (관리자페이지)
	@PostMapping("/admin/sponsor/item/insert")
	public String insertSponsorItem(SponsorItemDTO sponsor) {
		sponsorService.insertSponsorItem(sponsor);
		return "redirect:/admin/sponsor/item";
	}
	
	// 후원 상품 수정 이동 (관리자페이지)
	// 조회겸 수정으로 만들어 놨음 분리하려면 디자인 수정해야함
	// 입력 폼이랑 같이 쓰게 만들었더니 form을 입력이 사용해서  수정은 아작스로하거나 새파일 만들어야할듯
	@GetMapping("/admin/sponsor/item/update/{seq}")
	public String updateSponsorItem(@PathVariable("seq") int sponsorItemSeq, Model model) {
		SponsorItemDTO sponsor = new SponsorItemDTO();
		sponsor.setSponsorItemSeq(sponsorItemSeq);
		sponsorService.getSponsorItem(sponsor);
		return "/adminPage/sponsor_item_form";
	}

	// 후원 상품 수정 (관리자페이지)
	@PostMapping("/admin/sponsor/item/update")
	public String updateSponsorItem(SponsorItemDTO sponsor) {
		sponsorService.updateSponsorItem(sponsor);
		return "redirect:/admin/sponsor/item";
	}
	
	// 주문 목록 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/order")
	public String sponsorOrderList(Model model) {
		// 총 상품수
		model.addAttribute("totalCnt", sponsorService.sponsorTotalCnt());
		// 주문 목록
		model.addAttribute("sponsorList", sponsorService.getSponsorList());
		return "/adminPage/sponsor_order";
	}
	
	// 주문 상세 조회
	@GetMapping("/admin/sponsor/order/info/{seq}")
	public String sponsorOrder(@PathVariable("seq") int sponsorSeq, Model model) {
		SponsorDTO sponsor = new SponsorDTO();
		sponsor.setSponsorSeq(sponsorSeq);
		model.addAttribute("sponsorDetail", sponsorService.getSponsor(sponsor));
		return "redirect:/admin/sponsor/order";
	}

	// 주문 내역 상태 수정 (관리자페이지)
	@PostMapping("/admin/sponsor/order")
	public String sponsorOrder(SponsorDTO sponsor) {
		sponsorService.StateupdateSponsor(sponsor);
		return "redirect:/admin/sponsor/order";
	}
}
