package com.guhaejwo.biz.adopt;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.guhaejwo.biz.board.Category;

public class AdoptDTO {
	
	private int totalCnt;
	private int rownum;
	
	// adopt 테이블
	private int boardSeq;
	private String adoptImg;
	private String adoptImg2;
	private String adoptImg3;
	private String adoptSex;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date adoptRescueDate;
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
	private String userImg;
	
	public AdoptDTO() {}
	
	
	// totalCnt
	public int getTotalCnt() {
		return totalCnt;
	}	
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	
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
	public String getAdoptImg2() {
		return adoptImg2;
	}

	public void setAdoptImg2(String adoptImg2) {
		this.adoptImg2 = adoptImg2;
	}

	public String getAdoptImg3() {
		return adoptImg3;
	}

	public void setAdoptImg3(String adoptImg3) {
		this.adoptImg3 = adoptImg3;
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
	public Date getAdoptRescueDate() {
		return adoptRescueDate;
	}
	public void setAdoptRescueDate(Date adoptRescueDate) {
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
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	@Override
	public String toString() {
		return "AdoptDTO [totalCnt=" + totalCnt + ", rownum=" + rownum + ", boardSeq=" + boardSeq + ", adoptImg="
				+ adoptImg + ", adoptImg2=" + adoptImg2 + ", adoptImg3=" + adoptImg3 + ", adoptSex=" + adoptSex
				+ ", adoptRescueDate=" + adoptRescueDate + ", adoptAge=" + adoptAge + ", adoptAddr=" + adoptAddr
				+ ", adoptWeight=" + adoptWeight + ", adoptNeutor=" + adoptNeutor + ", adoptState=" + adoptState
				+ ", adoptKind=" + adoptKind + ", boardCategory=" + boardCategory + ", boardTitle=" + boardTitle
				+ ", userSeq=" + userSeq + ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardCnt="
				+ boardCnt + ", userName=" + userName + ", userId=" + userId + ", userImg=" + userImg + "]";
	}

}
