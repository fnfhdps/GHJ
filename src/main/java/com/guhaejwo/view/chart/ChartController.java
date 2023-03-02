package com.guhaejwo.view.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guhaejwo.biz.chart.ChartDTO;
import com.guhaejwo.biz.chart.ChartService;

@Controller
public class ChartController {
	
	private final ChartService chartService;
	
	@Autowired
	public ChartController(ChartService chartService) {
		this.chartService = chartService;
	}
	
	// 관리자 메인페이지 이동
	@GetMapping("/admin/index")
	public String index() {
		return "/adminPage/index";
	}
	
	// 이번주 가입자 수
	@RequestMapping("/admin/chart")
	public @ResponseBody List<Integer> weekJoinCnt() throws Exception {
		ChartDTO chart = new ChartDTO();
		List<Integer> cnt = new ArrayList<Integer>();
		
		chart = chartService.weekJoinCnt();
		
		cnt.add(0,chart.getSun());
		cnt.add(1,chart.getMon());
		cnt.add(2,chart.getTue());
		cnt.add(3,chart.getWed());
		cnt.add(4,chart.getThu());
		cnt.add(5,chart.getFri());
		cnt.add(6,chart.getSat());
		
		return cnt;
	}
}
