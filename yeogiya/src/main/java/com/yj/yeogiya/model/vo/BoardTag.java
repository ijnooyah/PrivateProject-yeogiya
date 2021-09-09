package com.yj.yeogiya.model.vo;

public class BoardTag {
	private int board_no;
	private int tag_no;
	private int seq;
	private String is_del;
	
	private String tag_name;
	
	public BoardTag() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardTag(int board_no, String tag_name) {
		super();
		this.board_no = board_no;
		this.tag_name = tag_name;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getTag_no() {
		return tag_no;
	}

	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getIs_del() {
		return is_del;
	}

	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}

	public String getTag_name() {
		return tag_name;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	@Override
	public String toString() {
		return "BoardTag [board_no=" + board_no + ", tag_no=" + tag_no + ", seq=" + seq + ", is_del=" + is_del
				+ ", tag_name=" + tag_name + "]";
	}



}
