package com.yj.yeogiya.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;

public interface BoardService {
	
//************CREATE************
	// 1. 게시글
	public int insertBoardArticle(Board board);
	// 2. 카테고리
	
	
//************READ************
	// 1. 게시글
	// 1-2. 상세조회
	public Board selectBoardArticle(String login_id, int board_no, boolean isUpdate);
	// 2. 카테고리
	public List<Sort> selectSortLocal();
	public List<Sort> selectSortPlace();
	public List<Sort> selectSortBoard();
	public Sort selectSortLocalPByEngName(String eng_name);
	// 3. tag 비동기 자동완성 
	public List<BoardTag> searchTag(String keyword);
	// 4. 글목록
	public List<Board> selectBoardList(BoardSearch bs);
	
	
//************UPDATE************
	// 1. 게시글
	public int updateBoardArticle(Board board);
	// 2. 카테고리
	
	
	
	
	
//************DELETE************
	// 1. 게시글
	// 2. 카테고리
	
	
//좋아요
public int likeBoard(String user_id, int board_no);
//북마크
public int bookmarkBoard(String user_id, int board_no);
	
	
}
