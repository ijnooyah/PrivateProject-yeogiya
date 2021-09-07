package com.yj.yeogiya.board.model.vo;

public class BoardSearch {
	private String user_id; //로그인한 아이디
	
	//카테고리
	private String subLocal;
	private String sortBoard;
	private String sortPlace;
	
	private String order; // 최신,조회,댓글 등 order by 정렬
	
	// 검색
	private String searchType;
	private String keyword;
	
	// 현재페이지
	private int page = 1;
	
	private int startRow = 1;
	private int endRow = 10;
	// 게시물 총 갯수
	private int count;
	
	// 다음, 이전 페이지
	private int startPage;
	private int endPage;
	
	// 총 페이지 수(마지막 페이지 출력용)
	private int totalPage;
	
	private int perPage = 10; // 한페이지에 보여줄 게시글 개수 
	private final int PAGE_BLOCK = 10; // 1 2 3 4 5 6 7.. 10 
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSubLocal() {
		return subLocal;
	}
	public void setSubLocal(String subLocal) {
		this.subLocal = subLocal;
	}
	public String getSortBoard() {
		return sortBoard;
	}
	public void setSortBoard(String sortBoard) {
		this.sortBoard = sortBoard;
	}
	public String getSortPlace() {
		return sortPlace;
	}
	public void setSortPlace(String sortPlace) {
		this.sortPlace = sortPlace;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		
		this.endRow = page * this.perPage;
		this.startRow = endRow - (this.perPage - 1);
		this.endPage = ((int)((page - 1) / PAGE_BLOCK) + 1) * PAGE_BLOCK;
		this.startPage = endPage - (PAGE_BLOCK - 1);
		
		this.totalPage = count / perPage;
		if (count % perPage != 0) {
			this.totalPage += 1;
		}
		// 끝 페이지가 최대 페이지를 넘지 않도록 수식설정
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getPAGE_BLOCK() {
		return PAGE_BLOCK;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "BoardSearch [user_id=" + user_id + ", subLocal=" + subLocal + ", sortBoard=" + sortBoard
				+ ", sortPlace=" + sortPlace + ", order=" + order + ", searchType=" + searchType + ", keyword="
				+ keyword + ", page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", perPage="
				+ perPage + ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
	}
	
	
	
}
