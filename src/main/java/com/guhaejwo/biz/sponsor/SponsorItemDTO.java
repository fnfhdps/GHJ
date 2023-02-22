package com.guhaejwo.biz.sponsor;

public class SponsorItemDTO {
	
	private int totalCnt;
	
	private int sponsorItemSeq;
	private String sponsorItemName ;
	private String sponsorItemImg;
	private String sponsorItemPrice;
	private String sponsorItemCode;
	private String sponsorItemDate;
	private String sponsorItemState;
	
	public SponsorItemDTO() {}
	
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getSponsorItemSeq() {
		return sponsorItemSeq;
	}
	public void setSponsorItemSeq(int sponsorItemSeq) {
		this.sponsorItemSeq = sponsorItemSeq;
	}
	public String getSponsorItemName() {
		return sponsorItemName;
	}
	public void setSponsorItemName(String sponsorItemName) {
		this.sponsorItemName = sponsorItemName;
	}
	public String getSponsorItemImg() {
		return sponsorItemImg;
	}
	public void setSponsorItemImg(String sponsorItemImg) {
		this.sponsorItemImg = sponsorItemImg;
	}
	public String getSponsorItemPrice() {
		return sponsorItemPrice;
	}
	public void setSponsorItemPrice(String sponsorItemPrice) {
		this.sponsorItemPrice = sponsorItemPrice;
	}
	public String getSponsorItemCode() {
		return sponsorItemCode;
	}
	public void setSponsorItemCode(String sponsorItemCode) {
		this.sponsorItemCode = sponsorItemCode;
	}
	public String getSponsorItemDate() {
		return sponsorItemDate;
	}
	public void setSponsorItemDate(String sponsorItemDate) {
		this.sponsorItemDate = sponsorItemDate;
	}
	public String getSponsorItemState() {
		return sponsorItemState;
	}
	public void setSponsorItemState(String sponsorItemState) {
		this.sponsorItemState = sponsorItemState;
	}

	@Override
	public String toString() {
		return "SponsorItemDTO [totalCnt=" + totalCnt + ", sponsorItemSeq=" + sponsorItemSeq + ", sponsorItemName="
				+ sponsorItemName + ", sponsorItemImg=" + sponsorItemImg + ", sponsorItemPrice=" + sponsorItemPrice
				+ ", sponsorItemCode=" + sponsorItemCode + ", sponsorItemDate=" + sponsorItemDate
				+ ", sponsorItemState=" + sponsorItemState + "]";
	}

}
