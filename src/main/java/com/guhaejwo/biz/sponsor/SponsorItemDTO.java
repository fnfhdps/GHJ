package com.guhaejwo.biz.sponsor;

public class SponsorItemDTO {
	
	private int sponsorItemSeq;
	private String sponsorItemName ;
	private String sponsorItemImg;
	private String sponsorItemPrice;
	
	public SponsorItemDTO() {}
	
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
	
	@Override
	public String toString() {
		return "SponsorItemDTO [sponsorItemSeq=" + sponsorItemSeq + ", sponsorItemName=" + sponsorItemName
				+ ", sponsorItemImg=" + sponsorItemImg + ", sponsorItemPrice=" + sponsorItemPrice + "]";
	}
	
}
