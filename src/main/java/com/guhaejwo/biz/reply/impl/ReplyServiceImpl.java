package com.guhaejwo.biz.reply.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.reply.ReplyDTO;
import com.guhaejwo.biz.reply.ReplyService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	private ReplyDAO replyDAO;
	
	@Autowired
	public ReplyServiceImpl(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public void insertReply(ReplyDTO reply) {
		replyDAO.insertReply(reply);
	}

	@Override
	public void updateReply(ReplyDTO reply) {
		replyDAO.updateReply(reply);
	}

	@Override
	public void deleteReply(ReplyDTO reply) {
		replyDAO.deleteReply(reply);
	}

	@Override
	public List<ReplyDTO> getReplyList(ReplyDTO reply) {
		return replyDAO.getReplyList(reply);
	}

	@Override
	public ReplyDTO getReply(ReplyDTO reply) {
		return replyDAO.getReply(reply);
	}

}
