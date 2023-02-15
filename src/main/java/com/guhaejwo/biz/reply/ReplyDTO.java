package com.guhaejwo.biz.reply;

import java.util.Date;

public class ReplyDTO {
	
	private int replySeq;
	private int boardSeq;
	private int userSeq;
	private String replyContent;
	private Date replyDate;
	
	private String boardCategory;
	
	private String userImg;
	private String userId;
	private String userName;
	
	public ReplyDTO() {}
	
	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}


	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
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

	@Override
	public String toString() {
		return "ReplyDTO [replySeq=" + replySeq + ", boardSeq=" + boardSeq + ", userSeq=" + userSeq + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + ", boardCategory=" + boardCategory + ", userImg="
				+ userImg + ", userId=" + userId + ", userName=" + userName + "]";
	}

}
