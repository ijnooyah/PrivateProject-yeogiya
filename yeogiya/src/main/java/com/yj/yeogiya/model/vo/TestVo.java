package com.yj.yeogiya.model.vo;

import java.util.List;

public class TestVo {
	private int test_no;
	private String content;
	
	private List<TestImg> testImgs;
	
	private List<TestTag> testTags;
	private String tag;
	
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
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public List<TestImg> getTestImgs() {
		return testImgs;
	}
	public void setTestImgs(List<TestImg> testImgs) {
		this.testImgs = testImgs;
	}
	public List<TestTag> getTestTags() {
		return testTags;
	}
	public void setTestTags(List<TestTag> testTags) {
		this.testTags = testTags;
	}
	@Override
	public String toString() {
		return "TestVo [test_no=" + test_no + ", content=" + content + ", testImgs=" + testImgs + ", testTags="
				+ testTags + ", tag=" + tag + "]";
	}
	
	
}
