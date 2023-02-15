package com.guhaejwo.biz.adopt;

import java.util.Date;

public class AdoptMyPageDTO {
	
	private int rownum;
	
	private int userSeq;
	private String userId;
	private String userName;
	private String userEmail;
	private String userPhone;
	
	private int boardSeq;
	private String boardTitle;
	
	private String adoptImg;
	private String adoptState;
	private String adoptKind;
	
	private Date adoptReqDate;

	
	public AdoptMyPageDTO() {}

	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getAdoptImg() {
		return adoptImg;
	}
	public void setAdoptImg(String adoptImg) {
		this.adoptImg = adoptImg;
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
	public Date getAdoptReqDate() {
		return adoptReqDate;
	}
	public void setAdoptReqDate(Date adoptReqDate) {
		this.adoptReqDate = adoptReqDate;
	}
	
	@Override
	public String toString() {
		return "AdoptMixDTO [rownum=" + rownum + ", userSeq=" + userSeq + ", userId=" + userId + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", boardSeq=" + boardSeq + ", boardTitle="
				+ boardTitle + ", adoptImg=" + adoptImg + ", adoptState=" + adoptState + ", adoptKind=" + adoptKind
				+ ", adoptReqDate=" + adoptReqDate + "]";
	}
	
}
