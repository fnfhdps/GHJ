package com.guhaejwo.view.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	
	public MapController() {}
	
	@GetMapping(value = "/map")
	public String kakaoMap() {
		return "/map/map";
	}
	
	@GetMapping("/chart")
	public String userChart() {
		return "/adminPage/index";
	}
}
