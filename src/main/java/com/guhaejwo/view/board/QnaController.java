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
import com.guhaejwo.biz.reply.ReplyDTO;
import com.guhaejwo.biz.reply.ReplyService;

@Controller
public class QnaController {

	private BoardService boardService;
	private ReplyService replyService;
	
	@Autowired
	public QnaController(BoardService boardService, ReplyService replyService) {
		this.boardService = boardService;
		this.replyService = replyService;
	}
	
	// qna 목록 조회 (마이페이지)
	@GetMapping("/mypage/qna/{seq}")
	public String qnaList(@PathVariable("seq") int userSeq, BoardDTO board, Model model) throws Exception {
		board.setBoardCategory(Category.QNA);
		board.setUserSeq(userSeq);
		model.addAttribute("qnaList", boardService.getBoardListMyPage(board));
	return "/myPage/qna_list";
	}
	
	// qna 상세 조회 (마이페이지)
	@GetMapping("/mypage/qna/get/{seq}")
	public String qnaDetail(@PathVariable("seq") int boardSeq, Model model) throws Exception {
		// 게시글 상세 조회
		BoardDTO board = new BoardDTO();
		board.setBoardSeq(boardSeq);
		model.addAttribute("qnaDetail", boardService.getBoard(board));
		
		// 댓글 목록 조회 (답변을 댓글 db로에 넣음)
		ReplyDTO reply = new ReplyDTO();
		reply.setBoardSeq(boardSeq);
		model.addAttribute("reply", replyService.getReply(reply));
	return "/myPage/qna_detail";
	}
	
	// qna 입력 이동 (마이페이지)
	@GetMapping("/mypage/qna/new")
	public String qnaNew() {
	return "/myPage/qna_new";
	}
	
	// qna 입력 (마이페이지)
	@PostMapping("/mypage/qna/new")
	public String qnaNew(BoardDTO board) throws Exception {
		board.setBoardCategory(Category.QNA);
		boardService.insertBoard(board);

		int userSeq = board.getUserSeq();
	return "redirect:/mypage/qna/"+ userSeq;
	}
	
	// qna 수정 (마이페이지)
	@PostMapping("/mypage/qna/update")
	public String qnaUpdate(BoardDTO board) throws Exception {
		boardService.updateBoard(board);
		return "/myPage/qna_detail";
	}
	
	// qna 삭제 (마이페이지)
	@PostMapping("/mypage/qna/delete")
	public @ResponseBody int qnaDelete(@RequestBody BoardDTO board) throws Exception {
		try {
			boardService.deleteBoard(board);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	
	// qna 이전글 조회 (마이페이지)
	@GetMapping("/before")
	public @ResponseBody Object getBefore(BoardDTO board) throws Exception {
		System.out.println("옴?"+board);
		BoardDTO boardBefore = new BoardDTO();
		
		try {
			boardBefore = boardService.getBefore(board);
			System.out.println(boardBefore);
			if(boardBefore != null) {
				return boardBefore;				
			}else {
				return 0; // 이전글 없으면 0
			}
		} catch (Exception e) {
			return -1;
		}
	}
	
	// 다음글 조회 (마이페이지)
	@GetMapping("/after")
	public @ResponseBody Object getAfter(BoardDTO board) throws Exception {
		System.out.println(board);
		BoardDTO boardAfter = new BoardDTO();
		
		try {
			boardAfter = boardService.getAfter(board);
			System.out.println(boardAfter);
			if(boardAfter != null) {
				return boardAfter;				
			}else {
				return 0; // 이전글 없으면 0
			}
		} catch (Exception e) {
			return -1;
		}
	}
}
