package com.guhaejwo.biz.adopt;

import java.util.Date;

public class AdoptBlameDTO {
	
	private int totalCnt;
	
	private int blaSeq;
	private int boardSeq;
	private int req_userSeq;	// 신고자
	private int res_userSeq;	// 피신고자
	private Date blaDate;
	private String blaTitle;	
	private String blaContent;
	
	public AdoptBlameDTO() {}

	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getBlaSeq() {
		return blaSeq;
	}
	public void setBlaSeq(int blaSeq) {
		this.blaSeq = blaSeq;
	}

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public int getReq_userSeq() {
		return req_userSeq;
	}

	public void setReq_userSeq(int req_userSeq) {
		this.req_userSeq = req_userSeq;
	}

	public int getRes_userSeq() {
		return res_userSeq;
	}

	public void setRes_userSeq(int res_userSeq) {
		this.res_userSeq = res_userSeq;
	}

	public Date getBlaDate() {
		return blaDate;
	}

	public void setBlaDate(Date blaDate) {
		this.blaDate = blaDate;
	}

	public String getBlaTitle() {
		return blaTitle;
	}

	public void setBlaTitle(String blaTitle) {
		this.blaTitle = blaTitle;
	}

	public String getBlaContent() {
		return blaContent;
	}

	public void setBlaContent(String blaContent) {
		this.blaContent = blaContent;
	}

	@Override
	public String toString() {
		return "AdoptBlameDTO [totalCnt=" + totalCnt + ", blaSeq=" + blaSeq + ", boardSeq=" + boardSeq
				+ ", req_userSeq=" + req_userSeq + ", res_userSeq=" + res_userSeq + ", blaDate=" + blaDate
				+ ", blaTitle=" + blaTitle + ", blaContent=" + blaContent + "]";
	}

}
