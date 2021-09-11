package com.yj.yeogiya.model.service;

import java.util.List;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.Sort;

public interface BoardService {
	//************CREATE************
	// 1. 게시글
	public int insertBoardArticle(Board board);
	// 2. 카테고리
	//************READ************
	// 1. 게시글
	// 1-2. 상세조회
	public Board selectBoardArticle(int board_no);
	// 2. 카테고리
	public List<Sort> selectSortLocal();
	public List<Sort> selectSortPlace();
	public List<Sort> selectSortBoard();
	public Sort selectSortLocalPByEngName(String eng_name);
	//************UPDATE************
	// 1. 게시글
	public int updateBoardArticle(Board board);
	// 2. 카테고리
	//************DELETE************
	// 1. 게시글
	// 2. 카테고리
	
	
	
	
	
}
