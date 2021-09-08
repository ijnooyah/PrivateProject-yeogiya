package com.yj.yeogiya.model.vo;

import java.util.List;

public class TestVo {
	private int test_no;
	private String content;
	
	private List<TestImg> imgs;
	
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
	public List<TestImg> getImgs() {
		return imgs;
	}
	public void setImgs(List<TestImg> imgs) {
		this.imgs = imgs;
	}
	@Override
	public String toString() {
		return "TestVo [test_no=" + test_no + ", content=" + content + ", imgs=" + imgs + "]";
	}
	
	
}
