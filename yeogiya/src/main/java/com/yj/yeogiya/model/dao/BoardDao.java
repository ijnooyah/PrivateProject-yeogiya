package com.yj.yeogiya.model.dao;

import java.util.List;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardPlace;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;


public interface BoardDao {
	
	//************CREATE************
	// 1. 게시글
	// 1-1.board
	public int insertBoard(Board board);
	// 1-2.tag
	public int insertTag (List<BoardTag> tagList);
	public int insertBoardTag (List<BoardTag> tagList);
	// 1-3. place
	public int insertPlace (BoardPlace place);
	public int insertBoardPlace (BoardPlace place);
	// 1-4. img
	public int insertImg (List<BoardImg> imgList);
	//************READ************
	// 1. 게시글
	// 1-1.board
	// 1-2.tag
	// 1-3. place
	// 1-4. img
	// 2. 카테고리
	public Board selectBoard(int board_no);
	public List<Sort> selectSortLocal();
	public List<Sort> selectSortPlace();
	public List<Sort> selectSortBoard();
	public Sort selectSortLocalPByEngName(String eng_name);
	//************UPDATE************
	// 1. 게시글
	// 1-1.board
	public int updateBoard(Board board);
	// 1-2.tag
	// 1-3. place
	// 1-4. img
	//************DELETE************
	// 1. 게시글
	// 1-1.board
	// 1-2.tag
	// 1-3. place
	// 1-4. img
}