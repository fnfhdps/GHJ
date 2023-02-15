package com.guhaejwo.view.adopt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptHeartDTO;
import com.guhaejwo.biz.adopt.AdoptMyPageDTO;
import com.guhaejwo.biz.adopt.AdoptMyPageService;
import com.guhaejwo.biz.adopt.AdoptService;

@Controller
@RequestMapping("/mypage")
public class adoptMyPageController {

	private AdoptMyPageService adoptMyPageService;
	
	@Autowired
	public adoptMyPageController(AdoptMyPageService adoptMyPageService) {
		this.adoptMyPageService = adoptMyPageService;
	}
	
	// 내 입양 글 목록 조회
	@GetMapping("/mywriting/{seq}")
	public String getAdoptMypageList(@PathVariable("seq") int userSeq, AdoptDTO adopt ,Model model) {
		System.out.println("내 입양 글 목록 조회 실행 "+userSeq);
		
		adopt.setUserSeq(userSeq);
		model.addAttribute("myAdopt", adoptMyPageService.getAdoptMypageList(adopt));
		
		return "/myPage/adopt_mywriting";
	}
	
	// 입양 희망자 목록 조회
	@GetMapping("/hope/{seq}")
	public String getAdoptHopeList(@PathVariable("seq") int userSeq, AdoptMyPageDTO adopt, Model model) {
		System.out.println("입양자 희망 목록 조회");
		adopt.setUserSeq(userSeq);
		model.addAttribute("hopeList", adoptMyPageService.getAdoptHopeList(adopt));
		return "/myPage/adopt_hope";
	}
	
	// 내 입양 신청 목록 조회
	@GetMapping("/mysign/{seq}")
	public String getAdoptReqList(@PathVariable("seq") int userSeq, AdoptMyPageDTO adopt, Model model) {
		System.out.println("내 입양 신청 목록 조회 실행"+userSeq);
		
		adopt.setUserSeq(userSeq);
		model.addAttribute("mysign", adoptMyPageService.getAdoptReqList(adopt));
		
		return "/myPage/adopt_mysign";
	}
	
	// 내 관심 동물 목록 조회
	@GetMapping("/heart/{seq}")
	public String heart(@PathVariable("seq") int userSeq, AdoptHeartDTO adopt, Model model) {
		System.out.println("userSeq"+userSeq+"관심동물조회");
		adopt.setUserSeq(userSeq);
		model.addAttribute("myHeart", adoptMyPageService.getHeartListMypage(adopt));
		
		return "/myPage/adopt_heart";
	}
}
