package com.guhaejwo.biz.sponsor;

import java.util.List;

import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.SponsorMyPageDTO;

public interface SponsorService{

// 후원
	// 후원 내역 입력
	public void insertSponsor(SponsorDTO sponsor);
	
	// 후원 내역 상태 수정 (관리자페이지)
	public void StateupdateSponsor(SponsorDTO sponsor);
	
	// 후원 내역 조회 (마이페이지)
	public List<SponsorDTO> getSponsorMyPage(SponsorDTO sponsor);
	
	// 총 주문수 (관리자페이지)
	public int sponsorTotalCnt();

	// 전체 주문 내역 조회 (관리자페이지)
	public List<SponsorDTO> getSponsorList();
	
	// 주문 상세 조회 (관리자페이지)
	public SponsorDTO getSponsor(SponsorDTO sponsor);
	
// 후원 상품
	// 후원 상품 입력 (관리자페이지)
	public void insertSponsorItem(SponsorItemDTO sponsor);

	// 후원 상품 수정 (관리자페이지)
	public void updateSponsorItem(SponsorItemDTO sponsor);

	// 후원 상품 삭제 (관리자페이지)
	public void deleteSponsorItem(SponsorItemDTO sponsor);
	
	// 총 후원 상품수 (관리자페이지)
	public int sponsorItemTotalCnt();	
	
	// 후원 상품 목록 조회
	public List<SponsorItemDTO> getSponsorItemList();
	
	// 후원 상품 상세 
	public SponsorItemDTO getSponsorItem(SponsorItemDTO sponsor);
	
}
