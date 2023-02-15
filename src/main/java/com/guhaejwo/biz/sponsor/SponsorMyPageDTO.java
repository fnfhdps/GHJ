package com.guhaejwo.biz.sponsor;

import java.util.Date;

public class SponsorMyPageDTO {
	
	private int rownum;
	
	private int userSeq;	// users 테이블
	private String sponsorItemName;
	private int sponsorAmount;
	private int sponsorTotalPrice;
	private String sponsorShippingAddr;
	private Date sponsorDate;
	
	public SponsorMyPageDTO() {}
	
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
	public String getSponsorItemName() {
		return sponsorItemName;
	}
	public void setSponsorItemName(String sponsorItemName) {
		this.sponsorItemName = sponsorItemName;
	}
	public int getSponsorAmount() {
		return sponsorAmount;
	}
	public void setSponsorAmount(int sponsorAmount) {
		this.sponsorAmount = sponsorAmount;
	}
	public int getSponsorTotalPrice() {
		return sponsorTotalPrice;
	}
	public void setSponsorTotalPrice(int sponsorTotalPrice) {
		this.sponsorTotalPrice = sponsorTotalPrice;
	}
	public String getSponsorShippingAddr() {
		return sponsorShippingAddr;
	}
	public void setSponsorShippingAddr(String sponsorShippingAddr) {
		this.sponsorShippingAddr = sponsorShippingAddr;
	}
	public Date getSponsorDate() {
		return sponsorDate;
	}
	public void setSponsorDate(Date sponsorDate) {
		this.sponsorDate = sponsorDate;
	}

	@Override
	public String toString() {
		return "SponsorMyPageDTO [rownum=" + rownum + ", userSeq=" + userSeq + ", sponsorItemName=" + sponsorItemName
				+ ", sponsorAmount=" + sponsorAmount + ", sponsorTotalPrice=" + sponsorTotalPrice
				+ ", sponsorShippingAddr=" + sponsorShippingAddr + ", sponsorDate=" + sponsorDate + "]";
	}

}
