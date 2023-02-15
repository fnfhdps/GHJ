package com.guhaejwo.biz.sponsor;

import java.util.List;

import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.SponsorMyPageDTO;

public interface SponsorService{

	// 후원 정보 입력
	public void insertSponsor(SponsorDTO sponsor);
	
	// 후원 내역 조회 (마이페이지)
	public List<SponsorMyPageDTO> getSponsorMyPage(SponsorMyPageDTO sponsor);
	
	// 후원 상품 상세 조회
	public SponsorItemDTO getSponsorItem(SponsorItemDTO sponsor);
	
	// 후원 상품 목록 조회
	public List<SponsorItemDTO> getSponsorItemList(SponsorItemDTO sponsor);

}
