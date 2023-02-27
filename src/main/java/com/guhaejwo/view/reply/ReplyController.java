package com.guhaejwo.view.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guhaejwo.biz.reply.ReplyDTO;
import com.guhaejwo.biz.reply.ReplyService;

@Controller
public class ReplyController {

	private ReplyService replyService;
	
	@Autowired
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	// 댓글 입력
	@PostMapping(value = "/reply/insert")
	public @ResponseBody int insertReply(@RequestBody ReplyDTO reply) {
		System.out.println("댓글 입력");
		try {
			replyService.insertReply(reply);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	
	// 댓글 수정
	@PostMapping(value = "/reply/update")
	public @ResponseBody int updateReply(@RequestBody ReplyDTO reply) {
		System.out.println("댓글 수정");
		try {
			replyService.updateReply(reply);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	
	// 댓글 삭제
	@PostMapping(value = "/reply/delete")
	public @ResponseBody int deleteReply(@RequestBody ReplyDTO reply) {
		System.out.println("댓글 삭제");
		try {
			replyService.deleteReply(reply);
			return 0;
		} catch (Exception e) {
			return -1;
		}
	}
	
	// 댓글 목록 조회
	@GetMapping(value = "/reply/list/{category}/{seq}")
	public String getReplyList(@PathVariable("category") String category,
				@PathVariable("seq") int boardSeq, ReplyDTO reply, Model model) {
		
		reply.setBoardCategory(category);
		reply.setBoardSeq(boardSeq);
	
		model.addAttribute("replyList", replyService.getReplyList(reply));
		return "/adopt/adopt_detail";
	}
}