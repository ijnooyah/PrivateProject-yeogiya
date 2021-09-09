package com.yj.yeogiya.model.vo;

import java.util.List;

public class Place {
	private int place_no;
	private String place_name;
	private String place_address;
	private double place_lat;
	private double place_long;
	private int place_id;
	private String sort_place;
	private String sort_local;
	private String sub_local;
	private int ment_cnt;
	private int rp_cnt;
	
	
	// has a
	private List<BoardPlace> boards;
	
	public Place() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPlace_no() {
		return place_no;
	}

	public void setPlace_no(int place_no) {
		this.place_no = place_no;
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

	public int getMent_cnt() {
		return ment_cnt;
	}

	public void setMent_cnt(int ment_cnt) {
		this.ment_cnt = ment_cnt;
	}

	public int getRp_cnt() {
		return rp_cnt;
	}

	public void setRp_cnt(int rp_cnt) {
		this.rp_cnt = rp_cnt;
	}

	public List<BoardPlace> getBoards() {
		return boards;
	}

	public void setBoards(List<BoardPlace> boards) {
		this.boards = boards;
	}

	public String getSort_place() {
		return sort_place;
	}

	public void setSort_place(String sort_place) {
		this.sort_place = sort_place;
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

	
	
	
}
