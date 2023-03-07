package com.guhaejwo.biz.chart;

import java.util.Map;

public class ChartDTO {
	
	// 요일 통계시 사용
	private int sun;
	private int mon;
	private int tue;
	private int wed;
	private int thu;
	private int fri;
	private int sat;
	
	// 한달간 일별 통계
	private String chartDate; // 오늘부터 한달전까지의 날짜
	private int chartVal; // 통계 값
	
	public ChartDTO() {}
	
	public String getChartDate() {
		return chartDate;
	}
	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}
	public int getChartVal() {
		return chartVal;
	}
	public void setChartVal(int chartVal) {
		this.chartVal = chartVal;
	}

	public int getSun() {
		return sun;
	}
	public void setSun(int sun) {
		this.sun = sun;
	}
	public int getMon() {
		return mon;
	}
	public void setMon(int mon) {
		this.mon = mon;
	}
	public int getTue() {
		return tue;
	}
	public void setTue(int tue) {
		this.tue = tue;
	}
	public int getWed() {
		return wed;
	}
	public void setWed(int wed) {
		this.wed = wed;
	}
	public int getThu() {
		return thu;
	}
	public void setThu(int thu) {
		this.thu = thu;
	}
	public int getFri() {
		return fri;
	}
	public void setFri(int fri) {
		this.fri = fri;
	}
	public int getSat() {
		return sat;
	}
	public void setSat(int sat) {
		this.sat = sat;
	}
	
	@Override
	public String toString() {
		return "ChartDTO [sun=" + sun + ", mon=" + mon + ", tue=" + tue + ", wed=" + wed + ", thu=" + thu + ", fri="
				+ fri + ", sat=" + sat + "]";
	}
	
}
