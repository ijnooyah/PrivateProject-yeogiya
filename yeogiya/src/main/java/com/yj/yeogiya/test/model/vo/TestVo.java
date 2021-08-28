package com.yj.yeogiya.test.model.vo;

public class TestVo {
	private int test_no;
	private String content;
	public TestVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTest_no() {
		return test_no;
	}
	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "TestVo [test_no=" + test_no + ", content=" + content + "]";
	}
	
	
}
