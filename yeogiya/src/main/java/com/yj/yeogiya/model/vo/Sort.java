package com.yj.yeogiya.model.vo;


public class Sort {
	private String sort_no;
	private String sort_name;
	private int sort_level;
	private String parent_sort;
	private String eng_name;
	private String has_sort_place;
	private String is_del;
	
	
	public Sort() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Sort(String sort_no, String sort_name, int sort_level, String parent_sort) {
		super();
		this.sort_no = sort_no;
		this.sort_name = sort_name;
		this.sort_level = sort_level;
		this.parent_sort = parent_sort;
	}

	public String getSort_no() {
		return sort_no;
	}
	public void setSort_no(String sort_no) {
		this.sort_no = sort_no;
	}
	public String getSort_name() {
		return sort_name;
	}
	public void setSort_name(String sort_name) {
		this.sort_name = sort_name;
	}
	public int getSort_level() {
		return sort_level;
	}
	public void setSort_level(int sort_level) {
		this.sort_level = sort_level;
	}
	public String getParent_sort() {
		return parent_sort;
	}
	public void setParent_sort(String parent_sort) {
		this.parent_sort = parent_sort;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getHas_sort_place() {
		return has_sort_place;
	}
	public void setHas_sort_place(String has_sort_place) {
		this.has_sort_place = has_sort_place;
	}

	public String getIs_del() {
		return is_del;
	}

	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}

	@Override
	public String toString() {
		return "Sort [sort_no=" + sort_no + ", sort_name=" + sort_name + ", sort_level=" + sort_level + ", parent_sort="
				+ parent_sort + ", eng_name=" + eng_name + ", has_sort_place=" + has_sort_place + ", is_del=" + is_del
				+ "]";
	}

	
}
