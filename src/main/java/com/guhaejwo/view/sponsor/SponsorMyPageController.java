package com.guhaejwo.view.sponsor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.SponsorMyPageDTO;
import com.guhaejwo.biz.sponsor.impl.SponsorServiceImpl;

@Controller
@RequestMapping("/sponsor")
public class SponsorMyPageController {

	private final SponsorServiceImpl sponsorService;
	
	@Autowired
	public SponsorMyPageController(SponsorServiceImpl sponsorService) {
		this.sponsorService = sponsorService;
	}
	
	// 후원 내역 조회 (마이페이지)
	@GetMapping(value = "/mysponsor/{seq}")
	public String mySponsor(@PathVariable("seq") int userSeq, SponsorMyPageDTO sponsor, Model model) {
		sponsor.setUserSeq(userSeq);
		model.addAttribute("sponsorMyPage", sponsorService.getSponsorMyPage(sponsor));
		return "/myPage/sponsor_list";
	}
}
