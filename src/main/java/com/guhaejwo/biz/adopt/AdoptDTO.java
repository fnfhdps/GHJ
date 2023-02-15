package com.guhaejwo.biz.adopt;

import java.util.Date;

public class AdoptDTO {
	
	private int rownum;
	
	// adopt 테이블
	private int boardSeq;
	private String adoptImg;
	private String adoptSex;
	private String adoptRescueDate;
	private int adoptAge;
	private String adoptAddr;
	private int adoptWeight;
	private String adoptNeutor;
	private String adoptState;
	private String adoptKind;
	
	// board 테이블
	private String boardCategory;
	private String boardTitle;
	private int userSeq;
	private String boardContent;
	private Date boardDate;
	private int boardCnt;
	
	// users 테이블
	private String userName;
	private String userId;
	
	public AdoptDTO() {}
	
	// rownum
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	// adopt 테이블
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getAdoptImg() {
		return adoptImg;
	}
	public void setAdoptImg(String adoptImg) {
		this.adoptImg = adoptImg;
	}
	public String getAdoptSex() {
		return adoptSex;
	}
	public void setAdoptSex(String adoptSex) {
		this.adoptSex = adoptSex;
	}
	public String getAdoptRescueDate() {
		return adoptRescueDate;
	}
	public void setAdoptRescueDate(String adoptRescueDate) {
		this.adoptRescueDate = adoptRescueDate;
	}	
	public int getAdoptAge() {
		return adoptAge;
	}
	public void setAdoptAge(int adoptAge) {
		this.adoptAge = adoptAge;
	}
	public String getAdoptAddr() {
		return adoptAddr;
	}
	public void setAdoptAddr(String adoptAddr) {
		this.adoptAddr = adoptAddr;
	}
	public int getAdoptWeight() {
		return adoptWeight;
	}
	public void setAdoptWeight(int adoptWeight) {
		this.adoptWeight = adoptWeight;
	}
	public String getAdoptNeutor() {
		return adoptNeutor;
	}
	public void setAdoptNeutor(String adoptNeutor) {
		this.adoptNeutor = adoptNeutor;
	}
	public String getAdoptState() {
		return adoptState;
	}
	public void setAdoptState(String adoptState) {
		this.adoptState = adoptState;
	}
	public String getAdoptKind() {
		return adoptKind;
	}
	public void setAdoptKind(String adoptKind) {
		this.adoptKind = adoptKind;
	}

	// board 테이블
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
	
	// users 테이블
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "AdoptDTO [rownum=" + rownum + ", boardSeq=" + boardSeq + ", adoptImg=" + adoptImg + ", adoptSex="
				+ adoptSex + ", adoptRescueDate=" + adoptRescueDate + ", adoptAge=" + adoptAge + ", adoptAddr="
				+ adoptAddr + ", adoptWeight=" + adoptWeight + ", adoptNeutor=" + adoptNeutor + ", adoptState="
				+ adoptState + ", adoptKind=" + adoptKind + ", boardCategory=" + boardCategory + ", boardTitle="
				+ boardTitle + ", userSeq=" + userSeq + ", boardContent=" + boardContent + ", boardDate=" + boardDate
				+ ", boardCnt=" + boardCnt + ", userName=" + userName + ", userId=" + userId + "]";
	}

}
