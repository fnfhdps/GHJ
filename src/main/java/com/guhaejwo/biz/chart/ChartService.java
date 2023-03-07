package com.guhaejwo.biz.chart;

import java.util.List;
import java.util.Map;

public interface ChartService {
	
	// 열흘간 가입자수
	public List<Map<String, Object>> weekJoinCnt();
	
	// 한달간 일별 결제건수
	public List<Map<String, Object>> monthSponsorCnt();
	
	// 한달간 일별 결제금액
	public List<Map<String, Object>> monthSponsorPrice();
	
	// 배송 상태 집계
	public List<Map<String, Object>> totalsponsorState();
}
