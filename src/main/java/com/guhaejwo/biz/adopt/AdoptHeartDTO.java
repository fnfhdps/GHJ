package com.guhaejwo.biz.adopt;

public class AdoptHeartDTO {

	private int totalCnt;
	
	private int userHeartSeq;
	private int boardSeq;
	private int userSeq;
	private int heartcnt;
	
	// adopt 테이블
	private String adoptImg;
	
	public AdoptHeartDTO() {}

	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getUserHeartSeq() {
		return userHeartSeq;
	}
	public void setUserHeartSeq(int userHeartSeq) {
		this.userHeartSeq = userHeartSeq;
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
	public int getHeartcnt() {
		return heartcnt;
	}
	public void setHeartcnt(int heartcnt) {
		this.heartcnt = heartcnt;
	}
	
	// adopt 테이블
	public String getAdoptImg() {
		return adoptImg;
	}
	public void setAdoptImg(String adoptImg) {
		this.adoptImg = adoptImg;
	}

	@Override
	public String toString() {
		return "AdoptHeartDTO [totalCnt=" + totalCnt + ", userHeartSeq=" + userHeartSeq + ", boardSeq=" + boardSeq
				+ ", userSeq=" + userSeq + ", heartcnt=" + heartcnt + ", adoptImg=" + adoptImg + "]";
	}

}
