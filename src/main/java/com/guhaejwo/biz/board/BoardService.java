package com.guhaejwo.biz.board;

import java.util.List;

public interface BoardService {

	// qna 질문 입력
	public void insertBoard(BoardDTO board);

	// qna 질문 수정
	public void updateBoard(BoardDTO board);

	// qna 상태 변경
	public void updateState(BoardDTO board);
	
	// qna 질문 삭제
	public void deleteBoard(BoardDTO board);
	
	// qna 상세 조회
	public BoardDTO getBoard(BoardDTO board);
	
	// qna 목록 조회
	public List<BoardDTO> getBoardListMyPage(BoardDTO board);
	
	// 이전글 조회
	public BoardDTO getBefore(BoardDTO board);
	
	// 다음글 조회
	public BoardDTO getAfter(BoardDTO board);
 }
