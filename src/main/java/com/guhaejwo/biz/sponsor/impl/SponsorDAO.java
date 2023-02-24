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

// 후원
	// 후원 내역 입력
	public void insertSponsor(SponsorDTO sponsor) {
		System.out.println("--> SponsorRepository.insertSponsor() 실행");
		mybatis.insert("SponsorDAO.insertSponsor", sponsor);
	}
	
	// 후원 내역 상태 수정 (관리자페이지)
	public void StateupdateSponsor(SponsorDTO sponsor) {
		System.out.println("--> SponsorRepository.StateupdateSponsor() 실행");
		mybatis.update("SponsorDAO.StateupdateSponsor", sponsor);
	}
	
	// 후원 내역 조회 (마이페이지)
	public List<SponsorMyPageDTO> getSponsorMyPage(SponsorMyPageDTO sponsor) {
		System.out.println("--> SponsorRepository.getSponsorMyPage() 실행");
		return mybatis.selectList("SponsorDAO.getSponsorMyPage", sponsor);
	}
	
	// 총 주문수 (관리자페이지)
	public int sponsorTotalCnt() {
		System.out.println("--> SponsorRepository.sponsorTotalCnt() 실행");
		return mybatis.selectOne("SponsorDAO.sponsorTotalCnt");
	}

	// 전체 주문 내역 조회 (관리자페이지)
	public List<SponsorDTO> getSponsorList(){
		System.out.println("--> SponsorRepository.getSponsorList() 실행");
		return mybatis.selectList("SponsorDAO.getSponsorList");
	}
	
	// 주문 상세 조회 (관리자페이지)
	public SponsorDTO getSponsor(SponsorDTO sponsor) {
		System.out.println("--> SponsorRepository.getSponsor() 실행");
		return mybatis.selectOne("SponsorDAO.getSponsor", sponsor);
	}
	
// 후원 상품
	// 후원 상품 입력 (관리자페이지)
	public void insertSponsorItem(SponsorItemDTO sponsor) {
		System.out.println("--> SponsorRepository.insertSponsorItem() 실행");
		mybatis.insert("SponsorDAO.insertSponsorItem", sponsor);
	}

	// 후원 상품 수정 (관리자페이지)
	public void updateSponsorItem(SponsorItemDTO sponsor) {
		System.out.println("--> SponsorRepository.updateSponsorItem() 실행");
		mybatis.update("SponsorDAO.updateSponsorItem", sponsor);
	}

	// 후원 상품 삭제 (관리자페이지)
	public void deleteSponsorItem(SponsorItemDTO sponsor) {
		System.out.println("--> SponsorRepository.deleteSponsorItem() 실행");
		mybatis.delete("SponsorDAO.deleteSponsorItem", sponsor);
	}
	
	// 총 후원 상품수 (관리자페이지)
	public int sponsorItemTotalCnt() {
		System.out.println("--> SponsorRepository.sponsorItemTotalCnt() 실행");
		return mybatis.selectOne("SponsorDAO.sponsorItemTotalCnt");
	}

	// 후원 상품 목록 조회
	public List<SponsorItemDTO> getSponsorItemList(){
		System.out.println("--> SponsorRepository.getSponsorItemList() 실행");
		return mybatis.selectList("SponsorDAO.getSponsorItemList");
	}
	
	// 후원 상품 상세 조회
	public SponsorItemDTO getSponsorItem(SponsorItemDTO sponsor) {
		System.out.println("--> SponsorRepository.getSponsorItem() 실행");
		return (SponsorItemDTO) mybatis.selectOne("SponsorDAO.getSponsorItem", sponsor);
	}

}
