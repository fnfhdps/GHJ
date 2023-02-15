package com.guhaejwo.biz.adopt;

import java.util.List;

import com.guhaejwo.biz.paging.Criteria;

public interface AdoptService {
	
	// 입양 관련 board 입력
	public void insertBoard(AdoptDTO adopt);

	// 입양 글 입력
	public void insertAdopt(AdoptDTO adopt);
	
	// 입양 관련 board 수정
	public void updateBoard(AdoptDTO adopt);
	
	// 입양 글 수정
	public void updateAdopt(AdoptDTO adopt);
	
	// 입양 글 삭제
	public void deleteBoard(AdoptDTO adopt);
	
	// 입양 목록 상세 조회
	public AdoptDTO getAdoptDetail(AdoptDTO adopt);

	// 입양 목록 조회
	public List<AdoptDTO> getAdoptList(AdoptDTO adopt);
	
	// 입양 목록 조회(페이징 적용)
    public List<AdoptDTO> getAdoptListPaging(Criteria cri);
	
	// 입양 목록 게시판 총 갯수
    public int getAdoptTotalCount(Criteria cri);
	
	// 입양 희망자 입력
	public void insertAdoptReq(AdoptReqDTO adopt);
	
	// 입양 희망자 중복 체크
	public AdoptReqDTO hopeCheck(AdoptReqDTO adopt);
	
	// 입양 상태 변경
	public void adoptStateUpdate(AdoptDTO adopt);
	
	// 좋아요 조회
	public int getHeart(AdoptHeartDTO heart);
   
    // 좋아요 누름
    public void insertHeart(AdoptHeartDTO heart);
    
    // 좋아요 취소
    public void deleteHeart(AdoptHeartDTO heart);
   
    // 신고 조회
    public int getBlame(AdoptBlameDTO blame);
      
    // 신고 누름
    public void insertBlame(AdoptBlameDTO blame);
      
    // 신고 삭제 (관리자페이지)
    public void deleteBlame(AdoptBlameDTO blame);

}
