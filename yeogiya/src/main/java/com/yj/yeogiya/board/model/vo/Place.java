package com.yj.yeogiya.board.model.vo;

import java.util.List;

public class Place {
	private int place_no;
	private String place_name;
	private String place_address;
	private double place_lat;
	private double place_long;
	private int kakao_id;
	private int parent_local;
	private int local;
	private int place_sort;
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

	public int getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(int kakao_id) {
		this.kakao_id = kakao_id;
	}

	public int getParent_local() {
		return parent_local;
	}

	public void setParent_local(int parent_local) {
		this.parent_local = parent_local;
	}

	public int getLocal() {
		return local;
	}

	public void setLocal(int local) {
		this.local = local;
	}

	public int getPlace_sort() {
		return place_sort;
	}

	public void setPlace_sort(int place_sort) {
		this.place_sort = place_sort;
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

	
	
	
}
