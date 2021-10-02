package com.yj.yeogiya.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class Board {
	private int board_no;
	private String user_id;
	private String board_title;
	private String board_content;
	private String sort_local;
	private String sub_local;
	private String sort_board;
	private String sort_place;
	private String has_img;
	private int cmt_cnt;
	private int like_cnt;
	private int bmk_cnt;
	private int view_cnt;
	private int rp_cnt;
	private String is_notice;
	private Timestamp reg_date;
	private String is_del;
	private Timestamp del_date;
	private Timestamp mod_date;
	private String query;
	// has a
	private BoardPlace place;
	private List<BoardTag> tagList;
	private List<BoardImg> imgList;
	
	private String likeBoard; // 좋아요: 로그인한 사용자가 좋아요 했으면 값있고(값=글고유번호) 없으면 null (jstl에서는 empty)
	private String bmBoard; // 북마크 : 로그인한 사용자가 좋아요 했으면 값있고(값=글고유번호) 없으면 null (jstl에서는 empty)
	private String sortLocalName;
	private String sortLocalEngName;
	private String subLocalName;
	private String sortBoardName;
	private String sortPlaceName;
	private String userNick;
	private String userImg;
	private String jsonTagList;
	private int nextNo;
	private int prevNo;
	private String placeName;
	private String placeAddress;
	
	private String tag;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}



	public int getCmt_cnt() {
		return cmt_cnt;
	}

	public void setCmt_cnt(int cmt_cnt) {
		this.cmt_cnt = cmt_cnt;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public int getBmk_cnt() {
		return bmk_cnt;
	}

	public void setBmk_cnt(int bmk_cnt) {
		this.bmk_cnt = bmk_cnt;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public int getRp_cnt() {
		return rp_cnt;
	}

	public void setRp_cnt(int rp_cnt) {
		this.rp_cnt = rp_cnt;
	}

	public String getIs_notice() {
		return is_notice;
	}

	public void setIs_notice(String is_notice) {
		this.is_notice = is_notice;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public String getIs_del() {
		return is_del;
	}

	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}

	public Timestamp getDel_date() {
		return del_date;
	}

	public void setDel_date(Timestamp del_date) {
		this.del_date = del_date;
	}

	public Timestamp getMod_date() {
		return mod_date;
	}

	public String getSort_local() {
		return sort_local;
	}

	public void setSort_local(String sort_local) {
		this.sort_local = sort_local;
	}

	public String getSub_local() {
		return sub_local;
	}

	public void setSub_local(String sub_local) {
		this.sub_local = sub_local;
	}

	public String getSort_board() {
		return sort_board;
	}

	public void setSort_board(String sort_board) {
		this.sort_board = sort_board;
	}

	public BoardPlace getPlace() {
		return place;
	}

	public void setPlace(BoardPlace place) {
		this.place = place;
	}

	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getHas_img() {
		return has_img;
	}

	public void setHas_img(String has_img) {
		this.has_img = has_img;
	}

	public String getSort_place() {
		return sort_place;
	}

	public void setSort_place(String sort_place) {
		this.sort_place = sort_place;
	}

	public List<BoardTag> getTagList() {
		return tagList;
	}

	public void setTagList(List<BoardTag> tagList) {
		this.tagList = tagList;
	}

	public List<BoardImg> getImgList() {
		return imgList;
	}

	public void setImgList(List<BoardImg> imgList) {
		this.imgList = imgList;
	}

	public String getLikeBoard() {
		return likeBoard;
	}

	public void setLikeBoard(String likeBoard) {
		this.likeBoard = likeBoard;
	}

	public String getBmBoard() {
		return bmBoard;
	}

	public void setBmBoard(String bmBoard) {
		this.bmBoard = bmBoard;
	}

	public String getSortLocalName() {
		return sortLocalName;
	}

	public void setSortLocalName(String sortLocalName) {
		this.sortLocalName = sortLocalName;
	}

	public String getSubLocalName() {
		return subLocalName;
	}

	public void setSubLocalName(String subLocalName) {
		this.subLocalName = subLocalName;
	}

	public String getSortBoardName() {
		return sortBoardName;
	}

	public void setSortBoardName(String sortBoardName) {
		this.sortBoardName = sortBoardName;
	}

	public String getSortPlaceName() {
		return sortPlaceName;
	}

	public void setSortPlaceName(String sortPlaceName) {
		this.sortPlaceName = sortPlaceName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getJsonTagList() {
		return jsonTagList;
	}

	public void setJsonTagList(String jsonTagList) {
		this.jsonTagList = jsonTagList;
	}

	public int getNextNo() {
		return nextNo;
	}

	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}

	public int getPrevNo() {
		return prevNo;
	}

	public void setPrevNo(int prevNo) {
		this.prevNo = prevNo;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlaceAddress() {
		return placeAddress;
	}

	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}

	public String getSortLocalEngName() {
		return sortLocalEngName;
	}

	public void setSortLocalEngName(String sortLocalEngName) {
		this.sortLocalEngName = sortLocalEngName;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", user_id=" + user_id + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", sort_local=" + sort_local + ", sub_local=" + sub_local
				+ ", sort_board=" + sort_board + ", sort_place=" + sort_place + ", has_img=" + has_img + ", cmt_cnt="
				+ cmt_cnt + ", like_cnt=" + like_cnt + ", bmk_cnt=" + bmk_cnt + ", view_cnt=" + view_cnt + ", rp_cnt="
				+ rp_cnt + ", is_notice=" + is_notice + ", reg_date=" + reg_date + ", is_del=" + is_del + ", del_date="
				+ del_date + ", mod_date=" + mod_date + ", place=" + place + ", tagList=" + tagList + ", imgList="
				+ imgList + ", likeBoard=" + likeBoard + ", bmBoard=" + bmBoard + ", sortLocalName=" + sortLocalName
				+ ", sortLocalEngName=" + sortLocalEngName + ", subLocalName=" + subLocalName + ", sortBoardName="
				+ sortBoardName + ", sortPlaceName=" + sortPlaceName + ", userNick=" + userNick + ", userImg=" + userImg
				+ ", jsonTagList=" + jsonTagList + ", nextNo=" + nextNo + ", prevNo=" + prevNo + ", placeName="
				+ placeName + ", placeAddress=" + placeAddress + ", tag=" + tag + "]";
	}


	

	
}
