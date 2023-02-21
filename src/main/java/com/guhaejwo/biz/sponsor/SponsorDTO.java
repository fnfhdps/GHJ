package com.guhaejwo.biz.sponsor;

import java.util.Date;

public class SponsorDTO {
	
	private int sponsorSeq;
	private int userSeq;	   	// users 테이블
	private int sponsorItemSeq;	// sponsor_item 테이블
	private int sponsorAmount;
	private Date sponsorDate;
	private int sponsorTotalPrice;
	private String sponsorShippingAddr;
	private String sponsorName;
	private String sponsorPhone;
	private String payment;
	private String sponsorState;
	private String memo;
	
	public SponsorDTO() {}

	public int getSponsorSeq() {
		return sponsorSeq;
	}
	public void setSponsorSeq(int sponsorSeq) {
		this.sponsorSeq = sponsorSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getSponsorItemSeq() {
		return sponsorItemSeq;
	}
	public void setSponsorItemSeq(int sponsorItemSeq) {
		this.sponsorItemSeq = sponsorItemSeq;
	}
	public int getSponsorAmount() {
		return sponsorAmount;
	}
	public void setSponsorAmount(int sponsorAmount) {
		this.sponsorAmount = sponsorAmount;
	}
	public Date getSponsorDate() {
		return sponsorDate;
	}
	public void setSponsorDate(Date sponsorDate) {
		this.sponsorDate = sponsorDate;
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
	public String getSponsorName() {
		return sponsorName;
	}
	public void setSponsorName(String sponsorName) {
		this.sponsorName = sponsorName;
	}
	public String getSponsorPhone() {
		return sponsorPhone;
	}
	public void setSponsorPhone(String sponsorPhone) {
		this.sponsorPhone = sponsorPhone;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getSponsorState() {
		return sponsorState;
	}
	public void setSponsorState(String sponsorState) {
		this.sponsorState = sponsorState;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "SponsorDTO [sponsorSeq=" + sponsorSeq + ", userSeq=" + userSeq + ", sponsorItemSeq=" + sponsorItemSeq
				+ ", sponsorAmount=" + sponsorAmount + ", sponsorDate=" + sponsorDate + ", sponsorTotalPrice="
				+ sponsorTotalPrice + ", sponsorShippingAddr=" + sponsorShippingAddr + ", sponsorName=" + sponsorName
				+ ", sponsorPhone=" + sponsorPhone + ", payment=" + payment + ", sponsorState=" + sponsorState
				+ ", memo=" + memo + "]";
	}

}
