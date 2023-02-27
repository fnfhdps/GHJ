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
	
	// 글 입력 (관리자페이지:입양, 공지사항)
	public void insertBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.insertBoard() 실행");
		mybatis.insert("BoardDAO.insertBoard", board);
	}
	
	// 글 수정 (관리자페이지:공지사항)	
	public void updateBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.updateBoard() 실행");
		mybatis.update("BoardDAO.updateBoard", board);
	}
	
	// 글 삭제 (관리자페이지:공지사항, qna 삭제)
	public void deleteBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.deleteBoard() 실행");
		mybatis.delete("BoardDAO.deleteBoard", board);
	}
	
	// 글 상세 조회
	public BoardDTO getBoard(BoardDTO board) {
		System.out.println("--> BoardRepository.getBoard() 실행");
		return mybatis.selectOne("BoardDAO.getBoard", board);
	}
	
	// 내 qna 목록 조회 (마이페이지)
	public List<BoardDTO> getBoardListMyPage(BoardDTO board){
		System.out.println("--> BoardRepository.getBoardListMyPage() 실행");
		return mybatis.selectList("BoardDAO.getBoardListMyPage", board);
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
	
	// 총  입양, 공지사항, 1:1 수 (관리자페이지)
	public int boardTotalCnt(BoardDTO board) {
		System.out.println("--> BoardRepository.boardTotalCnt() 실행");
		return mybatis.selectOne("BoardDAO.boardTotalCnt", board);
	}
	
	// 입양, 공지사항, 1:1 목록 조회 (관리자페이지)
	public List<BoardDTO> getBoardList(BoardDTO board){
		System.out.println("--> BoardRepository.getBoardList() 실행");
		return mybatis.selectList("BoardDAO.getBoardList", board);
	}
	
	// 조회수 증가
	public void updateBoardCnt(BoardDTO board) {
		System.out.println("--> BoardRepository.updateBoardCnt() 실행");
		mybatis.update("BoardDAO.updateBoardCnt", board);
	}
}
