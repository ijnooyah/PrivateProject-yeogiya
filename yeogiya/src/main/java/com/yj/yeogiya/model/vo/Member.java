package com.yj.yeogiya.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class Member {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nick;
	private String user_phone;
	private String user_email;
	private String sort_local;
	private String sub_local;
	private String user_gender;
	private String user_img;
	private String user_intro;
	private int user_grade;
	private int user_warn;
	private String like_alert;
	private String cmt_alert;
	private String msg_alert;
	private String bmk_alert;
	private String open_local;
	private String open_bmk;
	private Timestamp sign_date;
	private String is_quit;
	private Timestamp quit_date;

	private String sortLocalName;
	private String subLocalName;
	private String userGradeName;
	private String saveId;
	private String sortLocalEngName;
	
	private int boardCnt;
	private int cmtCnt;
	
	private List<Board> boardList;
	private List<Comment> commentList;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Member(String user_id, String user_email) {
		super();
		this.user_id = user_id;
		this.user_email = user_email;
	}


	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
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
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getUser_intro() {
		return user_intro;
	}
	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}
	public int getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}
	public int getUser_warn() {
		return user_warn;
	}
	public void setUser_warn(int user_warn) {
		this.user_warn = user_warn;
	}
	public Timestamp getSign_date() {
		return sign_date;
	}
	public void setSign_date(Timestamp sign_date) {
		this.sign_date = sign_date;
	}
	public Timestamp getQuit_date() {
		return quit_date;
	}
	public void setQuit_date(Timestamp quit_date) {
		this.quit_date = quit_date;
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
	public String getUserGradeName() {
		return userGradeName;
	}
	public void setUserGradeName(String userGradeName) {
		this.userGradeName = userGradeName;
	}
	public String getSaveId() {
		return saveId;
	}
	public void setSaveId(String saveId) {
		this.saveId = saveId;
	}
	public String getIs_quit() {
		return is_quit;
	}
	public void setIs_quit(String is_quit) {
		this.is_quit = is_quit;
	}


	public List<Board> getBoardList() {
		return boardList;
	}


	public void setBoardList(List<Board> boardList) {
		this.boardList = boardList;
	}


	public String getSortLocalEngName() {
		return sortLocalEngName;
	}


	public void setSortLocalEngName(String sortLocalEngName) {
		this.sortLocalEngName = sortLocalEngName;
	}


	public List<Comment> getCommentList() {
		return commentList;
	}


	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}


	public int getBoardCnt() {
		return boardCnt;
	}


	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}


	public int getCmtCnt() {
		return cmtCnt;
	}


	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}


	public String getLike_alert() {
		return like_alert;
	}


	public void setLike_alert(String like_alert) {
		this.like_alert = like_alert;
	}


	public String getCmt_alert() {
		return cmt_alert;
	}


	public void setCmt_alert(String cmt_alert) {
		this.cmt_alert = cmt_alert;
	}


	public String getMsg_alert() {
		return msg_alert;
	}


	public void setMsg_alert(String msg_alert) {
		this.msg_alert = msg_alert;
	}


	public String getBmk_alert() {
		return bmk_alert;
	}


	public void setBmk_alert(String bmk_alert) {
		this.bmk_alert = bmk_alert;
	}


	public String getOpen_local() {
		return open_local;
	}


	public void setOpen_local(String open_local) {
		this.open_local = open_local;
	}


	public String getOpen_bmk() {
		return open_bmk;
	}


	public void setOpen_bmk(String open_bmk) {
		this.open_bmk = open_bmk;
	}








	
}
