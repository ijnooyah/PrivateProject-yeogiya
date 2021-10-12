package com.yj.yeogiya.model.vo;

public class BoardSearch {
	private String login_id; //로그인한 아이디
	private String user_id; //just 아이디
	
	
	private String tab;
	
	private String act;
	
	private int board_no;
	
	//지역명
	private String sortLocal;
	private String sortLocalEngName;
	//카테고리
	private String subLocal;
	private String sortBoard;
	private String sortPlace;
	
	private String order; // 최신,조회,댓글 등 order by 정렬
	
	// 검색
	private String searchType;
	private String keyword;
	
	private String tag;
	
	// 현재페이지
	private int page = 1;
	
	private int startRow = 1;
	private int endRow = 15;
	// 게시물 총 갯수
	private int count;
	
	// 다음, 이전 페이지
	private int startPage;
	private int endPage;
	
	// 총 페이지 수(마지막 페이지 출력용)
	private int totalPage;
	
	private int perPage = 15; // 한페이지에 보여줄 게시글 개수 
	private final int PAGE_BLOCK = 10; // 1 2 3 4 5 6 7.. 10 
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
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getSortLocalEngName() {
		return sortLocalEngName;
	}
	public void setSortLocalEngName(String sortLocalEngName) {
		this.sortLocalEngName = sortLocalEngName;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTab() {
		return tab;
	}
	public void setTab(String tab) {
		this.tab = tab;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
	public String getSortLocal() {
		return sortLocal;
	}
	public void setSortLocal(String sortLocal) {
		this.sortLocal = sortLocal;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "BoardSearch [login_id=" + login_id + ", user_id=" + user_id + ", tab=" + tab + ", act=" + act
				+ ", board_no=" + board_no + ", sortLocal=" + sortLocal + ", sortLocalEngName=" + sortLocalEngName
				+ ", subLocal=" + subLocal + ", sortBoard=" + sortBoard + ", sortPlace=" + sortPlace + ", order="
				+ order + ", searchType=" + searchType + ", keyword=" + keyword + ", tag=" + tag + ", page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", perPage="
				+ perPage + ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
	}
	
	

	
}
