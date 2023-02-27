package com.guhaejwo.view.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guhaejwo.biz.board.BoardDTO;
import com.guhaejwo.biz.board.BoardService;
import com.guhaejwo.biz.board.Category;


@Controller
public class BoardAdminPageController {

	private final BoardService boardService;
	
	@Autowired
	public BoardAdminPageController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	// 입양글, 공지사항, 1:1문의 목록 이동 (관리자페이지)
	@GetMapping("/admin/{category}")
	public String getboardList(@PathVariable("category") String category, Model model) throws Exception {
		BoardDTO board = new BoardDTO();
		
		if(category.equals("adopt")) {
			board.setBoardCategory(Category.ADOPT);
		}else if(category.equals("notice")) {
			board.setBoardCategory(Category.NOTICE);
		}else if(category.equals("qna")){
			board.setBoardCategory(Category.QNA);
		}
		// 총 입양글
		model.addAttribute("totalCnt", boardService.boardTotalCnt(board));
		model.addAttribute("boardList", boardService.getBoardList(board));
		return "/adminPage/"+category;
	}
	
	// 공지사항 입력 이동 (관리자페이지)
	@GetMapping("/admin/notice/insert")
	public String insertNotice() {
		return "/adminPage/notice_form";
	}
	
	// 공지사항 입력 (관리자페이지)
	@PostMapping("/admin/notice/insert")
	public String insertNotice(BoardDTO board) throws Exception {
		board.setBoardCategory(Category.NOTICE);
		
		boardService.insertBoard(board);
		return "redirect:/admin/notice";
	}
	
	// 공지사항 수정 이동 (관리자페이지)
	@GetMapping("/admin/notice/update/{seq}")
	public String noticeUpdate(@PathVariable("seq") int boardSeq, Model model) throws Exception {
		BoardDTO board = new BoardDTO();
		board.setBoardSeq(boardSeq);
		
		model.addAttribute("notice", boardService.getBoard(board));
		return "/adminPage/notice_update";
	}
	
	// 공지사항 수정 (관리자페이지)
	@PostMapping("/admin/notice/update")
	public String updateBoard(BoardDTO board) throws Exception {
		boardService.updateBoard(board);
		return "redirect:/admin/notice";
	}
	
	// 입양글, 공지사항 삭제 (관리자페이지)
	//카테고리 맞으면 해당 페이지
	@PostMapping("/admin/{category}/delete")
	public @ResponseBody int deleteBoard(@PathVariable("category") String category, @RequestBody BoardDTO board) throws Exception {
		System.out.println(board);
		if(category.equals("adopt") || category.equals("notice")) {
			boardService.deleteBoard(board);
			return 0;
		}else {
			return -1;
		}
	}

	// 댓글관리 이동 (관리자페이지)
	@GetMapping("/admin/comment")
	public String comment() {
		return "/adminPage/comment";
	}

}
