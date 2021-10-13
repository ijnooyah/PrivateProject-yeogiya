package com.yj.yeogiya.model.dao;

import java.util.List;

import com.yj.yeogiya.model.vo.Comment;


public interface CommentDao {
	//댓글 삽입
	public int insertComment(Comment cmt);
	
	//대댓글 삽입
	public int insertRecomment(Comment cmt);
	
	//답댓글수 업데이트
	public int updateChildCnt(int c_no, int count);
	
	//댓글 조회
	public Comment selectComment(int c_no);
	
	//댓글 목록 조회
	public List<Comment> selectCommentList(int board_no);
	
	//댓글 수정
	public void updateComment(Comment cmt);
	
	//댓글 삭제 
	public int deleteComment(Comment cmt); 
}