package com.guhaejwo.biz.chart.impl;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> weekJoinCnt() {
		return chartDAO.weekJoinCnt();
	}

	@Override
	public List<Map<String, Object>> monthSponsorCnt() {
		return chartDAO.monthSponsorCnt();
	}

	@Override
	public List<Map<String, Object>> monthSponsorPrice() {
		return chartDAO.monthSponsorPrice();
	}

	@Override
	public List<Map<String, Object>> totalsponsorState() {
		return chartDAO.totalsponsorState();
	}

}
