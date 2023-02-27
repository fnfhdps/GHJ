package com.guhaejwo.view.sponsor;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.impl.SponsorServiceImpl;

@Controller
@SessionAttributes("sponsorDetail")
public class SponsorAdminPageController {

	private final SponsorServiceImpl sponsorService;
	private final ServletContext ctx;
	
	@Autowired
	public SponsorAdminPageController(SponsorServiceImpl sponsorService, ServletContext ctx) {
		this.sponsorService = sponsorService;
		this.ctx = ctx;
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
	public String insertSponsorItem(@RequestParam MultipartFile sponsorFile, SponsorItemDTO sponsor) throws IllegalStateException, IOException, Exception {
		String fileName = sponsorFile.getOriginalFilename();	// 파일 이름(확장자명 포함)
		String webPath ="/resources/image/sponsor";
		String realPath = ctx.getRealPath(webPath);
		
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];
		String realSaveFileName = uniqueName + fileName;
		
		File savePath = new File(realPath);		// 파일명이 포함되지 않은 경로
		// 업로드하기 위한 경로가 없을 경우
		if(!savePath.exists())	// savePath의 경로가 존재하는지 존재하지 않는지 boolean 체크
			savePath.mkdirs();	// make Directory : 경로 만들어줌
		
		realPath += File.separator + realSaveFileName;	// File.separator : 구분자 ("\" 또는 "/" 자동으로 지정해서 경로 뒤에 붙여준다.)
		File saveFile = new File(realPath);		// 파일명이 포함된 경로
		
		 try {
			 sponsorFile.transferTo(saveFile);
			 
	    } catch (IOException e) {
	    	e.printStackTrace();
	    }
		 sponsor.setSponsorItemImg(realSaveFileName); // 파일 이름으로 adoptImg set
		
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
	public String updateSponsorItem(@RequestParam MultipartFile sponsorFile, SponsorItemDTO sponsor) throws IllegalStateException, IOException, Exception {
		String fileName = sponsorFile.getOriginalFilename();	// 파일 이름(확장자명 포함)
		String webPath ="/resources/image/sponsor";
		String realPath = ctx.getRealPath(webPath);
		
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];
		String realSaveFileName = uniqueName + fileName;
		
		File savePath = new File(realPath);		// 파일명이 포함되지 않은 경로
		// 업로드하기 위한 경로가 없을 경우
		if(!savePath.exists())	// savePath의 경로가 존재하는지 존재하지 않는지 boolean 체크
			savePath.mkdirs();	// make Directory : 경로 만들어줌
		
		realPath += File.separator + realSaveFileName;	// File.separator : 구분자 ("\" 또는 "/" 자동으로 지정해서 경로 뒤에 붙여준다.)
		File saveFile = new File(realPath);		// 파일명이 포함된 경로
		
		try {
			sponsorFile.transferTo(saveFile);
	    } catch (IOException e) {
	    	e.printStackTrace();
	    }
		 sponsor.setSponsorItemImg(realSaveFileName); // 파일 이름으로 adoptImg set
		
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
