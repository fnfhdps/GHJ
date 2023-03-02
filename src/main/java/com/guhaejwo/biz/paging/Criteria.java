package com.guhaejwo.biz.paging;

import com.guhaejwo.biz.board.Category;

public class Criteria {
	
	 /* 현재 페이지 */
    private int pageNum;
    
    /* 한 페이지 당 보여질 게시물 갯수 */
    private int amount;
    
    /* 검색어 키워드 */
    private String keyword;
    
    /* 검색어 키워드 */
    private String keyword2;
    
    /* 검색어 키워드 */
    private String keyword3;
    
    
    private String boardCategory;
    
    /* 기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 12 */
    public Criteria() {
        this(1,12);
    }
    
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	public String getKeyword3() {
		return keyword3;
	}

	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", keyword2=" + keyword2
				+ ", keyword3=" + keyword3 + ", boardCategory=" + boardCategory + "]";
	}

}
