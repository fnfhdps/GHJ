package com.guhaejwo.biz.chart.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guhaejwo.biz.chart.ChartDTO;

@Repository
public class ChartDAO {
	
	private SqlSessionTemplate mybatis;
	
	@Autowired
	public ChartDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	// 이번주 가입자수
	public List<Map<String, Object>> weekJoinCnt() {
		System.out.println("--> ChartRepository.weekJoinCnt() 실행");
		return mybatis.selectList("ChartDAO.weekJoinCnt");
	}
	
	// 한달간 일별 결제건수
	public List<Map<String, Object>> monthSponsorCnt(){
		System.out.println("--> ChartRepository.monthSponsorCnt() 실행");
		return mybatis.selectList("ChartDAO.monthSponsorCnt");
	}
	
	// 한달간 일별 결제금액
	public List<Map<String, Object>> monthSponsorPrice(){
		System.out.println("--> ChartRepository.monthSponsorPrice() 실행");
		return mybatis.selectList("ChartDAO.monthSponsorPrice");
	}
	
	// 배송 상태 집계
	public List<Map<String, Object>> totalsponsorState(){
		System.out.println("--> ChartRepository.totalsponsorState() 실행");
		return mybatis.selectList("ChartDAO.totalsponsorState");
	}
}
