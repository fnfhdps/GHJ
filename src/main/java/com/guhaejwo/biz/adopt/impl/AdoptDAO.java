package com.guhaejwo.biz.adopt.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guhaejwo.biz.adopt.AdoptBlameDTO;
import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptMyPageDTO;
import com.guhaejwo.biz.adopt.AdoptReqDTO;
import com.guhaejwo.biz.paging.Criteria;
import com.guhaejwo.biz.adopt.AdoptHeartDTO;

@Repository
public class AdoptDAO {

	private SqlSessionTemplate mybatis;
	
	// mybatis 연결
	@Autowired
	public AdoptDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	// 입양 관련  board 입력
	public void insertBoard(AdoptDTO adopt) {
		System.out.println("--> AdoptRepository.insertBoard() 실행");
		mybatis.insert("AdoptDAO.insertBoard", adopt);
	}

	// 입양 글 입력
	public void insertAdopt(AdoptDTO adopt) {
		System.out.println("--> AdoptRepository.insertAdopt() 실행");
		mybatis.insert("AdoptDAO.insertAdopt", adopt);
	}
	
	// 입양 관련  board 수정
	public void updateBoard(AdoptDTO adopt) {
		System.out.println("--> AdoptRepository.updateBoard() 실행");
		mybatis.update("AdoptDAO.updateBoard", adopt);
	}
	
	// 입양 글 수정
	public void updateAdopt(AdoptDTO adopt) {
		System.out.println("--> AdoptRepository.updateAdopt() 실행");
		mybatis.update("AdoptDAO.updateAdopt", adopt);
	}
	
	// 입양 글 삭제
	public void deleteBoard(AdoptDTO adopt) {
		System.out.println("--> AdoptRepository.deleteBoard() 실행");
		mybatis.delete("AdoptDAO.deleteBoard", adopt);
	}

	// 입양 목록 상세 조회
	public AdoptDTO getAdoptDetail(AdoptDTO adopt) {
		System.out.println("--> AdoptRepository.getAdoptDetail() 실행");
		return (AdoptDTO) mybatis.selectOne("AdoptDAO.getAdoptDetail", adopt);
	}
	
	// 입양 목록 조회
	public List<AdoptDTO> getAdoptList(AdoptDTO adopt){
		System.out.println("--> AdoptRepository.getAdoptList() 실행1");
		return mybatis.selectList("AdoptDAO.getAdoptList", adopt);
	}
	
	// 입양 목록 조회(페이징)
		public List<AdoptDTO> getAdoptListPaging(Criteria cri){
			System.out.println("--> AdoptRepository.getAdoptList() 실행2");
			return mybatis.selectList("AdoptDAO.getAdoptListPaging", cri);
		}
	
	// 입양 목록 게시판 총 갯수 
	public int getAdoptTotalCount(Criteria cri){
		System.out.println("--> AdoptRepository.getAdoptList() 실행3");
		return mybatis.selectOne("AdoptDAO.getAdoptTotalCount");
	}
	

	// 입양 희망자 입력
	public void insertAdoptReq(AdoptReqDTO adopt) {
		System.out.println("--> AdoptRepository.insertAdoptReq() 실행");
		mybatis.insert("AdoptDAO.insertAdoptReq", adopt);
	}
	
	// 입양 희망자 중복 체크
	public AdoptReqDTO hopeCheck(AdoptReqDTO adopt) {
		System.out.println("--> AdoptRepository.hopeCheck() 실행");
		return mybatis.selectOne("AdoptDAO.hopeCheck", adopt);
	}
	
	// 입양 상태 변경
    public void adoptStateUpdate(AdoptDTO adopt) {
		System.out.println("--> AdoptRepository.adoptStateUpdate() 실행");
    	mybatis.update("AdoptDAO.adoptStateUpdate", adopt);
	}
    
	// 좋아요 조회
	public int getHeart(AdoptHeartDTO heart) {
		System.out.println("--> AdoptRepository.getHeart() 실행");
		return mybatis.selectOne("AdoptDAO.getHeart", heart);
 	 }

	// 좋아요 누름
	public void insertHeart(AdoptHeartDTO heart) {
		System.out.println("--> AdoptRepository.insertHeart() 실행");
		mybatis.insert("AdoptDAO.insertHeart", heart);
	}
   
	// 좋아요 취소
	public void deleteHeart(AdoptHeartDTO heart) {
		System.out.println("--> AdoptRepository.deleteHeart() 실행");
		mybatis.delete("AdoptDAO.deleteHeart", heart);
	}

	// 신고 조회
	public int getBlame(AdoptBlameDTO blame) {
		System.out.println("--> AdoptRepository.getBlame() 실행");
		return mybatis.selectOne("AdoptDAO.getBlame", blame);
	}
	
	// 신고 누름
	public void insertBlame(AdoptBlameDTO blame) {
		System.out.println("--> AdoptRepository.insertBlame() 실행");
		mybatis.insert("AdoptDAO.insertBlame", blame);
	}
	
	// 신고 내용 작성
	public void insertblaContent(AdoptBlameDTO blame) {
		System.out.println("--> AdoptRepository.insertblaContent() 실행");
		mybatis.insert("AdoptDAO.insertblaContent", blame);
	}
	
	
	// 신고 삭제 (관리자페이지)
	public void deleteBlame(AdoptBlameDTO blame) {
		System.out.println("--> AdoptRepository.deleteBlame() 실행");
		mybatis.delete("AdoptDAO.deleteBlame", blame);
	}
}
