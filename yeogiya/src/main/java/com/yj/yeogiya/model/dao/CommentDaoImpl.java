package com.yj.yeogiya.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.model.vo.Comment;


@Repository
public class CommentDaoImpl implements CommentDao {
	
	private static final String NAMESPACE = "com.yj.yeogiya.comment.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertComment(Comment cmt) {
		sqlSession.insert(NAMESPACE + "insertComment", cmt);

	}

	@Override
	public void insertRecomment(Comment cmt) {
		sqlSession.insert(NAMESPACE + "insertRecomment", cmt);
		
	}

	@Override
	public List<Comment> selectCommentList(int board_no) {
		return sqlSession.selectList(NAMESPACE + "selectCommentList", board_no);
	}

	@Override
	public void updateComment(Comment cmt) {
		sqlSession.update(NAMESPACE + "updateComment", cmt);
	}

	@Override
	public int deleteComment(Comment cmt) {
		return sqlSession.update(NAMESPACE + "deleteComment", cmt);
	}

	@Override
	public Comment selectComment(int c_no) {
		return sqlSession.selectOne(NAMESPACE + "selectComment", c_no);
	}

}
