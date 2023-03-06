package com.guhaejwo.view.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String index(Model model) throws Exception{
		List<Map<String, Object>> cnt = new ArrayList<Map<String,Object>>();
		cnt = chartService.totalsponsorState();
		System.out.println("결과1:" +cnt);
		for (Map<String, Object> cnt2 : cnt) {
			System.out.println("결과2: "+cnt2);
		}
		model.addAttribute("totalsponsorState", cnt);
		
		return "/adminPage/index";
	}
	
	// 이번주 가입자 수
	@RequestMapping("/admin/chart/join")
	public @ResponseBody List<Map<String, Object>> weekJoinCnt() throws Exception {
		return chartService.weekJoinCnt();
	}
	
	// 한달간 일별 결제건수, 결제금액
	@GetMapping("/admin/chart/{state}")
	public @ResponseBody List<Map<String, Object>> monthSponsorCnt(@PathVariable("state") String state) throws Exception {
		List<Map<String, Object>> monthSponsorPrice = new ArrayList<Map<String,Object>>();
		try {
			if (state.equals("sponsorcnt")) {
				monthSponsorPrice = chartService.monthSponsorCnt();
			}else if(state.equals("sponsorprice")) {
				monthSponsorPrice = chartService.monthSponsorPrice();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monthSponsorPrice;
	}
}
