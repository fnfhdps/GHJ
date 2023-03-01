package com.guhaejwo.biz.board;

import java.util.List;

import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.paging.Criteria;

public interface BoardService {

	// 글 입력 (관리자페이지:입양, 공지사항)
	public void insertBoard(BoardDTO board);

	// 글 수정 (관리자페이지:공지사항)
	public void updateBoard(BoardDTO board);

	// qna 상태 변경
	public void updateState(BoardDTO board);
	
	// 글 삭제 (관리자페이지:공지사항, qna 삭제)
	public void deleteBoard(BoardDTO board);
	
	// 글 상세 조회
	public BoardDTO getBoard(BoardDTO board);
	
	// 내 qna 목록 조회 (마이페이지)
	public List<BoardDTO> getBoardListMyPage(BoardDTO board);
	
	// 이전글 조회
	public BoardDTO getBefore(BoardDTO board);
	
	// 다음글 조회
	public BoardDTO getAfter(BoardDTO board);
	
	// 총  입양, 공지사항, 1:1 수 (관리자페이지)
	public int boardTotalCnt(BoardDTO board);
	
	// 입양, 공지사항, 1:1 목록 조회 (관리자페이지)
	public List<BoardDTO> getBoardList(BoardDTO board);
	
	// 입양, 공지사항, 1:1 목록 조회 (관리자페이지) / 페이징 적용
    public List<BoardDTO> getBoardListPaging(Criteria cri);
    
	// 입양, 공지사항, 1:1 목록 조회 (관리자페이지) / 총 갯수
    public int getBoardTotalCount(Criteria cri);
	
	// 조회수 증가
	public void updateBoardCnt(BoardDTO board);
 }
