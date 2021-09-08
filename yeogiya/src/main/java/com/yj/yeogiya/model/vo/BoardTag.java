package com.yj.yeogiya.model.vo;

public class BoardTag {
	private int board_no;
	private int tag_no;
	private int seq;
	private String is_del;
	
	public BoardTag() {
		super();
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "BoardTag [board_no=" + board_no + ", tag_no=" + tag_no + ", seq=" + seq + ", is_del=" + is_del + "]";
	}



}
