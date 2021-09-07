package com.yj.yeogiya.board.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class Board {
	private int board_no;
	private String user_id;
	private String board_title;
	private String board_content;
	private int parent_local;
	private int local;
	private int board_sort;
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
	
	// has a
	private BoardPlace place;
	private List<BoardTag> tags;
	private List<BoardImg> imgs;
	
	private String like_board; // 좋아요: 로그인한 사용자가 좋아요 했으면 값있고(값=글고유번호) 없으면 null (jstl에서는 empty)
	private String bm_board; // 북마크 : 로그인한 사용자가 좋아요 했으면 값있고(값=글고유번호) 없으면 null (jstl에서는 empty)
	
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

	public int getParent_local() {
		return parent_local;
	}

	public void setParent_local(int parent_local) {
		this.parent_local = parent_local;
	}

	public int getLocal() {
		return local;
	}

	public void setLocal(int local) {
		this.local = local;
	}

	public int getBoard_sort() {
		return board_sort;
	}

	public void setBoard_sort(int board_sort) {
		this.board_sort = board_sort;
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

	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}

	public BoardPlace getPlace() {
		return place;
	}

	public void setPlace(BoardPlace place) {
		this.place = place;
	}

	public List<BoardTag> getTags() {
		return tags;
	}

	public void setTags(List<BoardTag> tags) {
		this.tags = tags;
	}

	public List<BoardImg> getImgs() {
		return imgs;
	}

	public void setImgs(List<BoardImg> imgs) {
		this.imgs = imgs;
	}

	public String getLike_board() {
		return like_board;
	}

	public void setLike_board(String like_board) {
		this.like_board = like_board;
	}

	public String getBm_board() {
		return bm_board;
	}

	public void setBm_board(String bm_board) {
		this.bm_board = bm_board;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", user_id=" + user_id + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", parent_local=" + parent_local + ", local=" + local
				+ ", board_sort=" + board_sort + ", cmt_cnt=" + cmt_cnt + ", like_cnt=" + like_cnt + ", bmk_cnt="
				+ bmk_cnt + ", view_cnt=" + view_cnt + ", rp_cnt=" + rp_cnt + ", is_notice=" + is_notice + ", reg_date="
				+ reg_date + ", is_del=" + is_del + ", del_date=" + del_date + ", mod_date=" + mod_date + ", place="
				+ place + ", tags=" + tags + ", imgs=" + imgs + ", like_board=" + like_board + ", bm_board=" + bm_board
				+ "]";
	}

	
	

	
}
