package com.yj.yeogiya.model.dao;

import java.util.List;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;


public interface BoardDao {
	
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public Board selectBoard(int board_no);
	public int insertImg (List<BoardImg> imgList);
	public int insertTag (List<BoardTag> tagList);
	public int insertBoardTag (List<BoardTag> tagList);
	public List<Sort> selectSortLocal();
	public List<Sort> selectSortPlace();
	public List<Sort> selectSortBoard();
	public Sort selectSortLocalPByEngName(String eng_name);
}
