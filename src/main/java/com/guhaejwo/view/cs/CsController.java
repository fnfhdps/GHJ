package com.guhaejwo.view.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guhaejwo.biz.board.BoardDTO;
import com.guhaejwo.biz.board.BoardService;
import com.guhaejwo.biz.board.Category;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	private final BoardService boardService;
	
	@Autowired
	public CsController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	// faq 이동
	@GetMapping("/faq")
	public String faq() {
		return "/cs/faq";
	}

	// notice 이동
	@GetMapping("/notice")
	public String notice(Model model) {
		BoardDTO board = new BoardDTO();
		board.setBoardCategory(Category.NOTICE);
		model.addAttribute("boardList", boardService.getBoardList(board));
		return "/cs/notice";
	}
	
}
