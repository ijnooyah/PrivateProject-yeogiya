package com.yj.yeogiya.model.service;

import java.util.List;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.Sort;

public interface BoardService {
	public List<Sort> selectSortLocal();
	public List<Sort> selectSortPlace();
	public List<Sort> selectSortBoard();
	public Sort selectSortLocalPByEngName(String eng_name);
	
	public int insertBoardArticle(Board board);
	public Board selectBoardArticle(int board_no);
	public int updateBoardArticle(Board board);
}
