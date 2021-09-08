package com.yj.yeogiya.model.vo;

import java.util.List;

public class Tag {
	private int tag_no;
	private String tag_name;
	
	// has a
	private List<BoardTag> boards;
	
	public Tag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getTag_no() {
		return tag_no;
	}

	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}

	public String getTag_name() {
		return tag_name;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	public List<BoardTag> getBoards() {
		return boards;
	}

	public void setBoards(List<BoardTag> boards) {
		this.boards = boards;
	}

	@Override
	public String toString() {
		return "Tag [tag_no=" + tag_no + ", tag_name=" + tag_name + ", boards=" + boards + "]";
	}

	

	
	
	
}
