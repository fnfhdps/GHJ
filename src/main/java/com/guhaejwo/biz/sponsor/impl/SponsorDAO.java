package com.guhaejwo.biz.sponsor.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.SponsorMyPageDTO;

@Repository
public class SponsorDAO {

	private SqlSessionTemplate mybatis;
	
	@Autowired
	public SponsorDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	// 후원 내역 입력
	public void insertSponsor(SponsorDTO sponsor) {
		System.out.println("--> SponsorRepository.insertSponsor() 실행");
		mybatis.insert("SponsorDAO.insertSponsor", sponsor);
	}
	
	// 마이페이지 후원 내역 조회
	public List<SponsorMyPageDTO> getSponsorMyPage(SponsorMyPageDTO sponsor) {
		System.out.println("--> SponsorRepository.getSponsorMyPage() 실행");
		return mybatis.selectList("SponsorDAO.getSponsorMyPage", sponsor);
	}
	
	// 후원 상품 상세 조회
	public SponsorItemDTO getSponsorItem(SponsorItemDTO sponsor) {
		System.out.println("--> SponsorRepository.getSponsorItem() 실행");
		return (SponsorItemDTO) mybatis.selectOne("SponsorDAO.getSponsorItem", sponsor);
	}
	
	// 후원 상품 목록 조회
	public List<SponsorItemDTO> getSponsorItemList(SponsorItemDTO sponsor){
		System.out.println("--> SponsorRepository.getSponsorItemList() 실행");
		return mybatis.selectList("SponsorDAO.getSponsorItemList", sponsor);
	}
}
