package com.guhaejwo.biz.adopt;

import java.util.Date;

public class AdoptReqDTO {
	private int adoptReqSeq;
	private int boardSeq;
	private int userSeq;
	private String adoptReqContent;
	private Date adoptReqDate;
	
	public AdoptReqDTO() {}

	public int getAdoptReqSeq() {
		return adoptReqSeq;
	}

	public void setAdoptReqSeq(int adoptReqSeq) {
		this.adoptReqSeq = adoptReqSeq;
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

	public String getAdoptReqContent() {
		return adoptReqContent;
	}

	public void setAdoptReqContent(String adoptReqContent) {
		this.adoptReqContent = adoptReqContent;
	}

	public Date getAdoptReqDate() {
		return adoptReqDate;
	}

	public void setAdoptReqDate(Date adoptReqDate) {
		this.adoptReqDate = adoptReqDate;
	}

	@Override
	public String toString() {
		return "AdoptReqDTO [adoptReqSeq=" + adoptReqSeq + ", boardSeq=" + boardSeq + ", userSeq=" + userSeq
				+ ", adoptReqContent=" + adoptReqContent + ", adoptReqDate=" + adoptReqDate + "]";
	}
	
	
	
	
}
