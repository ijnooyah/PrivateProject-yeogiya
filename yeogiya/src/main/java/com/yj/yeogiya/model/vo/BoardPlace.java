package com.yj.yeogiya.model.vo;

public class BoardPlace {
	private int board_no;
	private int place_no;
	
	private String place_name;
	private String place_address;
	private double place_lat;
	private double place_long;
	private int place_id;
	private String sort_place;
	private String sort_local;
	private String sub_local;
	
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

	public String getSort_place() {
		return sort_place;
	}

	public void setSort_place(String sort_place) {
		this.sort_place = sort_place;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getPlace_address() {
		return place_address;
	}

	public void setPlace_address(String place_address) {
		this.place_address = place_address;
	}

	public double getPlace_lat() {
		return place_lat;
	}

	public void setPlace_lat(double place_lat) {
		this.place_lat = place_lat;
	}

	public double getPlace_long() {
		return place_long;
	}

	public void setPlace_long(double place_long) {
		this.place_long = place_long;
	}


	public int getPlace_id() {
		return place_id;
	}

	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}

	public String getSort_local() {
		return sort_local;
	}

	public void setSort_local(String sort_local) {
		this.sort_local = sort_local;
	}

	public String getSub_local() {
		return sub_local;
	}

	public void setSub_local(String sub_local) {
		this.sub_local = sub_local;
	}

	@Override
	public String toString() {
		return "BoardPlace [board_no=" + board_no + ", place_no=" + place_no + ", place_name=" + place_name
				+ ", place_address=" + place_address + ", place_lat=" + place_lat + ", place_long=" + place_long
				+ ", place_id=" + place_id + ", sort_place=" + sort_place + ", sort_local=" + sort_local
				+ ", sub_local=" + sub_local + "]";
	}



	
	
	
}
