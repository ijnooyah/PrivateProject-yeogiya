package com.yj.yeogiya.model.vo;

public class TestImg {
	private int img_no;
	private int test_no;
	private String img_path;
	
	public TestImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public int getTest_no() {
		return test_no;
	}

	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	@Override
	public String toString() {
		return "TestImg [img_no=" + img_no + ", test_no=" + test_no + ", img_path=" + img_path + "]";
	}

	
	
}
