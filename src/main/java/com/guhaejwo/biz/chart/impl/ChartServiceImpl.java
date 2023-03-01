package com.guhaejwo.biz.chart.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.chart.ChartDTO;
import com.guhaejwo.biz.chart.ChartService;

@Service("chartService")
public class ChartServiceImpl implements ChartService{

	private final ChartDAO chartDAO;
	
	@Autowired
	public ChartServiceImpl(ChartDAO chartDAO) {
		this.chartDAO = chartDAO;
	}
	
	@Override
	public ChartDTO weekJoinCnt() {
		return chartDAO.weekJoinCnt();
	}

	@Override
	public ChartDTO monthJoinCnt() {
		return null;
	}

}
