package com.guhaejwo.biz.adopt;

import java.util.List;

public interface AdoptMyPageService {
	
	// 내 입양 글 목록 조회 (마이페이지)
	public List<AdoptDTO> getAdoptMypageList(AdoptDTO adopt);
	
	// 입양 희망자 목록 조회 (마이페이지)
	public List<AdoptMyPageDTO> getAdoptHopeList(AdoptMyPageDTO adopt);
	
	// 내 입양 신청 목록 조회 (마이페이지)
	public List<AdoptMyPageDTO> getAdoptReqList(AdoptMyPageDTO adopt);
	
	// 내 관심동물 목록 조회 (마이페이지)
	public List<AdoptHeartDTO> getHeartListMypage(AdoptHeartDTO adopt);
}
