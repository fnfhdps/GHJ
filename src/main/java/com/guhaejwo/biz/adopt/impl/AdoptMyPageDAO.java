package com.guhaejwo.biz.adopt.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptHeartDTO;
import com.guhaejwo.biz.adopt.AdoptMyPageDTO;

@Repository
public class AdoptMyPageDAO {

	private SqlSessionTemplate mybatis;
	
	// mybatis 연결
	@Autowired
	public AdoptMyPageDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	// 내 입양 글 목록 조회 (마이페이지)
	public List<AdoptDTO> getAdoptMypageList(AdoptDTO adopt) {
		System.out.println("--> AdoptMyPageRepository.getAdoptMypageList() 실행");
		return mybatis.selectList("AdoptMyPageDAO.getAdoptMypageList", adopt);
	}

	// 입양 희망자 목록 조회 (마이페이지)
	public List<AdoptMyPageDTO> getAdoptHopeList(AdoptMyPageDTO adopt) {
		System.out.println("--> AdoptMyPageRepository.getAdoptHopeList() 실행");
		return mybatis.selectList("AdoptMyPageDAO.getAdoptHopeList", adopt);
	}

	// 내 입양 신청 목록 조회 (마이페이지)
	public List<AdoptMyPageDTO> getAdoptReqList(AdoptMyPageDTO adopt) {
		System.out.println("--> AdoptMyPageRepository.getAdoptReqList() 실행");
		return mybatis.selectList("AdoptMyPageDAO.getAdoptReqList", adopt);
	}
	
	// 내 관심동물 목록 조회 (마이페이지)
	public List<AdoptHeartDTO> getHeartListMypage(AdoptHeartDTO adopt) {
		System.out.println("--> AdoptMyPageRepository.getHeartListMypage() 실행");
		return mybatis.selectList("AdoptMyPageDAO.getHeartListMypage", adopt);
	}
	
}
