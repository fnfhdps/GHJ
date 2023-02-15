package com.guhaejwo.biz.reply;

import java.util.List;

public interface ReplyService {

	// 댓글 입력
	public void insertReply(ReplyDTO reply);
	
	// 댓글 수정
	public void updateReply(ReplyDTO reply);
	
	// 댓글 삭제
	public void deleteReply(ReplyDTO reply);
	
	// 입양 댓글 목록 조회
	public List<ReplyDTO> getReplyList(ReplyDTO reply);
	
	// qna 답변 조회
	public ReplyDTO getReply(ReplyDTO reply);
}
