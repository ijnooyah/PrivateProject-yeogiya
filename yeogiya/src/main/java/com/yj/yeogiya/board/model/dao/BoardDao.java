package com.yj.yeogiya.board.model.dao;

import java.util.List;

import com.yj.yeogiya.board.model.vo.Sort;

public interface BoardDao {
	public List<Sort> selectSortLocal();
	public List<Sort> selectSortPlace();
	public List<Sort> selectSortBoard();
	public Sort selectSortLocalPByEngName(String eng_name);
}
