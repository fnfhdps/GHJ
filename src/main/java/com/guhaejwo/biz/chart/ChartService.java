package com.guhaejwo.biz.chart;

public interface ChartService {
	
	// 이번주 가입자수
	public ChartDTO weekJoinCnt();
	
	// 이번달 가입자수
	public ChartDTO monthJoinCnt();
	
}
