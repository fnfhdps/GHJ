package com.guhaejwo.biz.chart.impl;

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
	public ChartDTO weekJoinCnt() {
		System.out.println("--> ChartRepository.weekJoinCnt() 실행");
		return mybatis.selectOne("ChartDAO.weekJoinCnt");
	}

}
