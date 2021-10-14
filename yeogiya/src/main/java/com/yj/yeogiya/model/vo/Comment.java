package com.yj.yeogiya.model.vo;

import java.sql.Timestamp;

public class Comment {
	private int c_no;
	private String user_id;
	private int b_no;
	private int re_group;
	private int parent_c_no;
	private String c_content;
	private int c_depth;
	private String is_del;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;
	private int rp_cnt;
	private String is_blind;
	private int child_cnt;
	
	//not db column
	private String user_nick;
	private String user_img;
	private String parent_user_id;
	private String parent_user_nick;
	
	private String boardTitle;
	private String boardQuery;
	private String boardDel;
	private String sortLocalEngName;
	private Board board;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Comment(String is_del) {
		super();
		this.is_del = is_del;
	}



	public int getC_no() {
		return c_no;
	}



	public void setC_no(int c_no) {
		this.c_no = c_no;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public int getB_no() {
		return b_no;
	}



	public void setB_no(int b_no) {
		this.b_no = b_no;
	}



	public int getRe_group() {
		return re_group;
	}



	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}



	public int getParent_c_no() {
		return parent_c_no;
	}



	public void setParent_c_no(int parent_c_no) {
		this.parent_c_no = parent_c_no;
	}



	public String getC_content() {
		return c_content;
	}



	public void setC_content(String c_content) {
		this.c_content = c_content;
	}



	public int getC_depth() {
		return c_depth;
	}



	public void setC_depth(int c_depth) {
		this.c_depth = c_depth;
	}



	public String getIs_del() {
		return is_del;
	}



	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}






	public int getRp_cnt() {
		return rp_cnt;
	}



	public void setRp_cnt(int rp_cnt) {
		this.rp_cnt = rp_cnt;
	}



	public String getIs_blind() {
		return is_blind;
	}



	public void setIs_blind(String is_blind) {
		this.is_blind = is_blind;
	}



	public String getUser_nick() {
		return user_nick;
	}



	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}



	public String getUser_img() {
		return user_img;
	}



	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}



	public String getParent_user_id() {
		return parent_user_id;
	}



	public void setParent_user_id(String parent_user_id) {
		this.parent_user_id = parent_user_id;
	}



	public String getParent_user_nick() {
		return parent_user_nick;
	}



	public void setParent_user_nick(String parent_user_nick) {
		this.parent_user_nick = parent_user_nick;
	}




	public Board getBoard() {
		return board;
	}



	public void setBoard(Board board) {
		this.board = board;
	}



	public String getBoardTitle() {
		return boardTitle;
	}



	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}



	public String getBoardQuery() {
		return boardQuery;
	}



	public void setBoardQuery(String boardQuery) {
		this.boardQuery = boardQuery;
	}



	public String getSortLocalEngName() {
		return sortLocalEngName;
	}



	public void setSortLocalEngName(String sortLocalEngName) {
		this.sortLocalEngName = sortLocalEngName;
	}



	public Timestamp getReg_date() {
		return reg_date;
	}



	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}



	public Timestamp getMod_date() {
		return mod_date;
	}



	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}



	public Timestamp getDel_date() {
		return del_date;
	}



	public void setDel_date(Timestamp del_date) {
		this.del_date = del_date;
	}



	public int getChild_cnt() {
		return child_cnt;
	}



	public void setChild_cnt(int child_cnt) {
		this.child_cnt = child_cnt;
	}



	public String getBoardDel() {
		return boardDel;
	}



	public void setBoardDel(String boardDel) {
		this.boardDel = boardDel;
	}



	@Override
	public String toString() {
		return "Comment [c_no=" + c_no + ", user_id=" + user_id + ", b_no=" + b_no + ", re_group=" + re_group
				+ ", parent_c_no=" + parent_c_no + ", c_content=" + c_content + ", c_depth=" + c_depth + ", is_del="
				+ is_del + ", reg_date=" + reg_date + ", mod_date=" + mod_date + ", del_date=" + del_date + ", rp_cnt="
				+ rp_cnt + ", is_blind=" + is_blind + ", child_cnt=" + child_cnt + ", user_nick=" + user_nick
				+ ", user_img=" + user_img + ", parent_user_id=" + parent_user_id + ", parent_user_nick="
				+ parent_user_nick + ", boardTitle=" + boardTitle + ", boardQuery=" + boardQuery + ", boardDel="
				+ boardDel + ", sortLocalEngName=" + sortLocalEngName + ", board=" + board + "]";
	}











	
	
}
