package com.guhaejwo.biz.reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guhaejwo.biz.reply.ReplyDTO;

@Repository
public class ReplyDAO {

	private SqlSessionTemplate mybatis;
	
	@Autowired
	public ReplyDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	// 댓글 입력
	public void insertReply(ReplyDTO reply) {
		System.out.println("--> ReplyRepository.insertReply() 실행");
		mybatis.insert("ReplyDAO.insertReply", reply);
	}

	// 댓글 수정
	public void updateReply(ReplyDTO reply) {
		System.out.println("--> ReplyRepository.updateReply() 실행");
		mybatis.update("ReplyDAO.updateReply", reply);
	}

	// 댓글 삭제
	public void deleteReply(ReplyDTO reply) {
		System.out.println("--> ReplyRepository.deleteReply() 실행");
		mybatis.delete("ReplyDAO.deleteReply", reply);
	}

	// 입양 댓글 목록 조회
	public List<ReplyDTO> getReplyList(ReplyDTO reply) {
		System.out.println("--> ReplyRepository.getReplyList() 실행");
		return mybatis.selectList("ReplyDAO.getReplyList", reply);
	}
	
	// qna 답변 조회
	public ReplyDTO getReply(ReplyDTO reply) {
		System.out.println("--> ReplyRepository.getReply() 실행");
		return mybatis.selectOne("getReply", reply);
	}
}
