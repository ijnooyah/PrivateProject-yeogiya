package com.yj.yeogiya.model.vo;

public class BoardImg {
	private int img_no;
	private int board_no;
	private String img_path;
	private String img_name;
	
	public BoardImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardImg(int board_no, String img_path, String img_name) {
		super();
		this.board_no = board_no;
		this.img_path = img_path;
		this.img_name = img_name;
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	@Override
	public String toString() {
		return "BoardImg [img_no=" + img_no + ", board_no=" + board_no + ", img_path=" + img_path + ", img_name="
				+ img_name + "]";
	}


}
