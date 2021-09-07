package com.yj.yeogiya.board.model.vo;

public class BoardPlace {
	private int board_no;
	private int place_no;
	private int place_sort;
	
	public BoardPlace() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getPlace_no() {
		return place_no;
	}

	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}

	public int getPlace_sort() {
		return place_sort;
	}

	public void setPlace_sort(int place_sort) {
		this.place_sort = place_sort;
	}

	@Override
	public String toString() {
		return "BoardPlace [board_no=" + board_no + ", place_no=" + place_no + ", place_sort=" + place_sort + "]";
	}


	
	
	
}
