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
public class SponsorController {

	private final SponsorServiceImpl sponsorService;
	
	@Autowired
	public SponsorController(SponsorServiceImpl sponsorService) {
		this.sponsorService = sponsorService;
	}

	// 후원 상품 목록 조회
	@GetMapping(value = "/list")
	public String getSponsorItemList(SponsorItemDTO sponsor, Model model) throws Exception {
		model.addAttribute("sponsorItemList", sponsorService.getSponsorItemList());
		return "/sponsor/sponsor_list";
	}
	
	// 후원 상품 상세 조회
	@GetMapping(value = "/get/{seq}")
	public String getSponsorItem(@PathVariable("seq") int sponsorItemSeq, HttpServletRequest req) throws Exception{		
		SponsorItemDTO sponsorItem = new SponsorItemDTO();
		sponsorItem.setSponsorItemSeq(sponsorItemSeq);
		
		HttpSession session = req.getSession();
		session.setAttribute("sponsorItem", sponsorService.getSponsorItem(sponsorItem));
		return "/sponsor/sponsor_form";
	}
	
	// 후원 상품 구매
	@PostMapping(value = "/insert")
	public String insertSponsor(SponsorDTO sponsor) throws Exception {
		System.out.println("후원값 확인"+sponsor);
		sponsorService.insertSponsor(sponsor);
		
		return "redirect:/sponsor/list";
	}
	
/*	public int insertSponsor(@RequestBody SponsorDTO sponsor) {
		System.out.println("");
		try {
			sponsorService.insertSponsor(sponsor);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}*/
}
