package com.guhaejwo.biz.sponsor;

import java.util.Date;

public class SponsorDTO {
	
	private int totalCnt;
	private int num;
	
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
	
	private String sponsorItemName;
	
	private String userId;
	private String userName;
	private String userPhone;
	private String userEmail;
	
	public SponsorDTO() {}

	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

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

	public String getSponsorItemName() {
		return sponsorItemName;
	}
	public void setSponsorItemName(String sponsorItemName) {
		this.sponsorItemName = sponsorItemName;
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
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Override
	public String toString() {
		return "SponsorDTO [totalCnt=" + totalCnt + ", num=" + num + ", sponsorSeq=" + sponsorSeq + ", userSeq="
				+ userSeq + ", sponsorItemSeq=" + sponsorItemSeq + ", sponsorAmount=" + sponsorAmount + ", sponsorDate="
				+ sponsorDate + ", sponsorTotalPrice=" + sponsorTotalPrice + ", sponsorShippingAddr="
				+ sponsorShippingAddr + ", sponsorName=" + sponsorName + ", sponsorPhone=" + sponsorPhone + ", payment="
				+ payment + ", sponsorState=" + sponsorState + ", memo=" + memo + ", sponsorItemName=" + sponsorItemName
				+ ", userId=" + userId + ", userName=" + userName + ", userPhone=" + userPhone + ", userEmail="
				+ userEmail + "]";
	}

}
