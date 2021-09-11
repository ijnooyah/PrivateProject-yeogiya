package com.yj.yeogiya.model.vo;

public class BoardImg {
	private int img_no;
	private int board_no;
	private String img_path;
	private String org_name;
	private String saved_name;
	
	public BoardImg() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getSaved_name() {
		return saved_name;
	}

	public void setSaved_name(String saved_name) {
		this.saved_name = saved_name;
	}

	@Override
	public String toString() {
		return "BoardImg [img_no=" + img_no + ", board_no=" + board_no + ", img_path=" + img_path + ", org_name="
				+ org_name + ", saved_name=" + saved_name + "]";
	}

}
