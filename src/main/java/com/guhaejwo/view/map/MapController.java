package com.guhaejwo.view.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	
	public MapController() {}
	
	@GetMapping(value = "/map")
	public String kakaoMap() {
		return "/notice/map";
	}
}
