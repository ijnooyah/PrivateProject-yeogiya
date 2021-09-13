package com.yj.yeogiya.model.service;

import java.util.List;

import com.yj.yeogiya.model.vo.Comment;

public interface CommentService {
	//댓글 삽입
	public void insertComment(Comment cmt);
	
	//댓글 목록 조회
	public List<Comment> selectCommentList(int board_no);
	
	//댓글 수정
	public void updateComment(Comment cmt);
	
	//댓글 삭제 
	public int deleteComment(Comment cmt); 
	
	//댓글 조회
	public Comment selectComment(int c_no);
}
