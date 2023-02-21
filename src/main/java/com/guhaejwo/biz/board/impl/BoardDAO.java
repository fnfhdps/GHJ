package com.guhaejwo.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guhaejwo.biz.board.BoardDTO;

@Repository
public class BoardDAO {

	private SqlSessionTemplate mybatis;
	
	@Autowired
	public BoardDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	// qna 질문 입력
	public void insertBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.insertBoard() 실행");
		mybatis.insert("BoardDAO.insertBoard", board);
	}
	
	// qna 질문 수정
	public void updateBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.updateBoard() 실행");
		mybatis.update("BoardDAO.updateBoard", board);
	}
	
	// qna 질문 삭제
	public void deleteBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.deleteBoard() 실행");
		mybatis.delete("BoardDAO.deleteBoard", board);
	}
	
	// qna 상세 조회
	public BoardDTO getBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.getBoard() 실행");
		return mybatis.selectOne("BoardDAO.getBoard", board);
	}
	
	// qna 목록 조회
	public List<BoardDTO> getBoardList(BoardDTO board){
		System.out.println("--> BoardRepository.getBoardList() 실행");
		return mybatis.selectList("BoardDAO.getBoardList", board);
	}
	
	// qna 이전글 조회
	public BoardDTO getBefore(BoardDTO board) {
		System.out.println("--> BoardRepository.getBefore() 실행");
		return mybatis.selectOne("BoardDAO.getBefore", board);
	}
	
	// qna 다음글 조회
	public BoardDTO getAfter(BoardDTO board) {
		System.out.println("--> BoardRepository.getAfter() 실행");
		return mybatis.selectOne("BoardDAO.getAfter", board);
	}
}
