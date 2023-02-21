package com.guhaejwo.biz.board;

import java.util.Date;

public class BoardDTO {

	private int num; // 게시글 번호
	private int findSeq; // 이전글, 다음글 seq
	private String findTitle; // 이전글, 다음글 title
	
	private int boardSeq;
	private String boardCategory;
	private String boardTitle;
	private int userSeq;
	private String boardContent;
	private Date boardDate;
	private int boardCnt;
	private String boardSubCategory;
	
	public BoardDTO() {}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getFindSeq() {
		return findSeq;
	}

	public void setFindSeq(int findSeq) {
		this.findSeq = findSeq;
	}

	public String getFindTitle() {
		return findTitle;
	}

	public void setFindTitle(String findTitle) {
		this.findTitle = findTitle;
	}

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardCnt() {
		return boardCnt;
	}

	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}

	public String getBoardSubCategory() {
		return boardSubCategory;
	}

	public void setBoardSubCategory(String boardSubCategory) {
		this.boardSubCategory = boardSubCategory;
	}

	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", findSeq=" + findSeq + ", findTitle=" + findTitle + ", boardSeq=" + boardSeq
				+ ", boardCategory=" + boardCategory + ", boardTitle=" + boardTitle + ", userSeq=" + userSeq
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardCnt=" + boardCnt
				+ ", boardSubCategory=" + boardSubCategory + "]";
	}

}
