package com.guhaejwo.view.sponsor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.impl.SponsorServiceImpl;

@Controller
@SessionAttributes("sponsorDetail")
public class SponsorAdminPageController {

	private final SponsorServiceImpl sponsorService;
	
	@Autowired
	public SponsorAdminPageController(SponsorServiceImpl sponsorService) {
		this.sponsorService = sponsorService;
	}

	// 후원 상품 목록 (관리자페이지)
	@GetMapping("/admin/sponsor/item")
	public String getSponsorItemList(Model model) throws Exception {
		// 총 상품수
		model.addAttribute("totalCnt", sponsorService.sponsorItemTotalCnt());
		// 상품 목록
		model.addAttribute("sponsorItemList", sponsorService.getSponsorItemList());
		return "/adminPage/sponsor_item";
	}
	
	// 후원 상품 입력 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/item/insert")
	public String insertSponsorItem() {
		return "/adminPage/sponsor_item_form";
	}
	
	// 후원 상품 입력 (관리자페이지)
	@PostMapping("/admin/sponsor/item/insert")
	public String insertSponsorItem(SponsorItemDTO sponsor) throws Exception {
		sponsorService.insertSponsorItem(sponsor);
		return "redirect:/admin/sponsor/item";
	}
	
	// 후원 상품 수정 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/item/update/{seq}")
	public String updateSponsorItem(@PathVariable("seq") int sponsorItemSeq, Model model) throws Exception {
		SponsorItemDTO sponsor = new SponsorItemDTO();
		
		sponsor.setSponsorItemSeq(sponsorItemSeq);
		model.addAttribute("sponsorItem", sponsorService.getSponsorItem(sponsor));
		return "/adminPage/sponsor_item_update";
	}

	// 후원 상품 수정 (관리자페이지)
	@PostMapping("/admin/sponsor/item/update")
	public String updateSponsorItem(SponsorItemDTO sponsor) throws Exception {
		sponsorService.updateSponsorItem(sponsor);
		return "redirect:/admin/sponsor/item";
	}
	
	//후원 상품 삭제 (관리자페이지)
	@PostMapping("/admin/sponsor/item/delete")
	public @ResponseBody int deleteSponsorItem(@RequestBody SponsorItemDTO sponsor) throws Exception {
		try {
			sponsorService.deleteSponsorItem(sponsor);
			return 0;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}

// ---------------------------------------------------------
	
	// 주문 목록 이동 (관리자페이지)
	@GetMapping("/admin/sponsor/order")
	public String sponsorOrderList(Model model) throws Exception {
		// 총 상품수
		model.addAttribute("totalCnt", sponsorService.sponsorTotalCnt());
		// 주문 목록
		model.addAttribute("sponsorList", sponsorService.getSponsorList());
		return "/adminPage/sponsor_order";
	}
	
	// 주문 상세 조회
	@GetMapping("/admin/sponsor/order/info/{seq}")
	public String sponsorOrder(@PathVariable("seq") int sponsorSeq, Model model) throws Exception {
		SponsorDTO sponsor = new SponsorDTO();
		sponsor.setSponsorSeq(sponsorSeq);
		model.addAttribute("sponsorDetail", sponsorService.getSponsor(sponsor));
		return "redirect:/admin/sponsor/order";
	}

	// 주문 상태 수정 (관리자페이지)
	@PostMapping("/admin/sponsor/order/state")
	public @ResponseBody int sponsorOrder(@RequestBody SponsorDTO sponsor) throws Exception {
		System.out.println(sponsor);
		try {
			sponsorService.StateupdateSponsor(sponsor);
			return 0;			
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			return -1;
		}
	}
}
