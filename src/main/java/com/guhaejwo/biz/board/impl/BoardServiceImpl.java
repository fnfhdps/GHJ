package com.guhaejwo.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.board.BoardDTO;
import com.guhaejwo.biz.board.BoardService;
import com.guhaejwo.biz.paging.Criteria;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	private BoardDAO boardDAO;
	
	@Autowired
	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	@Override
	public void insertBoard(BoardDTO board) {
		boardDAO.insertBoard(board);
	}

	@Override
	public void updateBoard(BoardDTO board) {
		boardDAO.updateBoard(board);
	}

	@Override
	public void updateState(BoardDTO board) {
	}

	@Override
	public void deleteBoard(BoardDTO board) {
		boardDAO.deleteBoard(board);
	}

	@Override
	public BoardDTO getBoard(BoardDTO board) {
		return boardDAO.getBoard(board);
	}
	
	@Override
	public List<BoardDTO> getBoardListMyPage(BoardDTO board) {
		return boardDAO.getBoardListMyPage(board);
	}

	@Override
	public BoardDTO getBefore(BoardDTO board) {
		return boardDAO.getBefore(board);
	}

	@Override
	public BoardDTO getAfter(BoardDTO board) {
		return boardDAO.getAfter(board);
	}

	@Override
	public int boardTotalCnt(BoardDTO board) {
		return boardDAO.boardTotalCnt(board);
	}

	@Override
	public List<BoardDTO> getBoardList(BoardDTO board) {
		return boardDAO.getBoardList(board);
	}
	
	@Override
	public List<BoardDTO> getBoardListPaging(Criteria cri) {
		return boardDAO.getBoardListPaging(cri);
	}
	
	@Override
	public int getBoardTotalCount(Criteria cri) {
		return boardDAO.getBoardTotalCount(cri);
	}

	@Override
	public void updateBoardCnt(BoardDTO board) {
		boardDAO.updateBoardCnt(board);
	}
}
