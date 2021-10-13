package com.yj.yeogiya.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int insertComment(Comment cmt) {
		return sqlSession.insert(NAMESPACE + "insertComment", cmt);

	}

	@Override
	public int insertRecomment(Comment cmt) {
		return sqlSession.insert(NAMESPACE + "insertRecomment", cmt);
		
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

	@Override
	public int updateChildCnt(int c_no, int count) {
		Map<String, Integer> map = new HashMap<>();
		map.put("c_no", c_no);
		map.put("count", count);
		return sqlSession.update(NAMESPACE + "updateChildCnt", map);
	}

}
