package com.guhaejwo.view.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

	// 공지사항 목록
	@GetMapping("/notice")
	public String getNoticeList(Model model) {
		BoardDTO board = new BoardDTO();
		board.setBoardCategory("NOTICE");
		model.addAttribute("boardList", boardService.getBoardList(board));
		return "/cs/notice";
	}
	
	// 공지사항 상세
	@GetMapping("/notice/{seq}")
	public String getnotice(@PathVariable("seq") int boardSeq, Model model) {
		BoardDTO board = new BoardDTO();
		board.setBoardSeq(boardSeq);

		BoardDTO boardDetail = boardService.getBoard(board);
		model.addAttribute("board", boardService.getBoard(boardDetail));
		
		// 조회수 카운트
//		int boardCnt = boardDetail.getBoardCnt();
		boardService.updateBoardCnt(boardDetail);
		return "/cs/notice_detail";
	}
	
}
