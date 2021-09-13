package com.yj.yeogiya.model.dao;

import java.util.List;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardPlace;
import com.yj.yeogiya.model.vo.BoardSearch;
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
	public int insertBoardImg (List<BoardImg> imgList);
	// 2. 카테고리 
	
	// 3. 이미지
	

	//************READ************
	// 1. 게시글 상세보기
	// 1-1.board
	public Board selectBoard(String login_id, int board_no);
	// 1-2.tag
	public List<BoardTag> selectBoardTag(int board_no);
	// 1-3. place
	public BoardPlace selectBoardPlace(int board_no);
	
	
	// 2. 글목록
	// 3. 카테고리
	public List<Sort> selectSortLocal();
	public List<Sort> selectSortPlace();
	public List<Sort> selectSortBoard();
	public Sort selectSortLocalPByEngName(String eng_name);
	
	// 4. tag 비동기 자동완성 
	public List<BoardTag> searchTag(String keyword);
	
	
	//************UPDATE************
	// 1. 게시글
	// 1-1.board
	public int updateBoard(Board board);
	// 1-2.tag
	public int deleteBoardTag(List<BoardTag> oldTagList);
	// 1-3. place
	public int updateBoardPlace(BoardPlace boardPlace);
	// 1-4. img
	public List<BoardImg> selectBoardImg(int board_no);
	public int deleteBoardImg(int board_no);
	
	//2.게시글 댓글수,조회수,좋아요수 등 증감
	public int updateCmtCnt(int board_no, int count);
	public int updateViewCnt(int board_no);
	public int updateLikeCnt(int board_no, int count);
	
	
	
	
	//************DELETE************
	// 1. 게시글
	// 1-1.board
	// 1-2.tag
	// 1-3. place
	// 1-4. img
	
	
	//---- 좋아요,북마크-----
	// 좋아요
	public int insertLike(int board_no, String user_id);
	public int deleteLike(int board_no, String user_id);
	// 북마크
	public int insertBookmark(int board_no, String user_id);
	public int deleteBookmark(int board_no, String user_id);
	
}
