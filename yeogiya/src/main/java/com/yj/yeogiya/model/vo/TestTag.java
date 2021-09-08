package com.yj.yeogiya.model.vo;

public class TestTag {
	private int test_no;
	private int tag_no;
	private int seq;
	private String is_del;
	
	private String tag_name;
	
	public TestTag() {
		super();
		// TODO Auto-generated constructor stub
	}


	public TestTag(String tag_name) {
		super();
		this.tag_name = tag_name;
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


	public int getTest_no() {
		return test_no;
	}


	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}


	public String getTag_name() {
		return tag_name;
	}


	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}


	@Override
	public String toString() {
		return "TestTag [test_no=" + test_no + ", tag_no=" + tag_no + ", seq=" + seq + ", is_del=" + is_del
				+ ", tag_name=" + tag_name + "]";
	}






}
