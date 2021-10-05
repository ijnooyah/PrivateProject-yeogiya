package com.yj.yeogiya.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.Comment;
import com.yj.yeogiya.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	private static final String NAMESPACE = "com.yj.yeogiya.member.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int checkDupId(String user_id) {
		return sqlSession.selectOne(NAMESPACE + "checkDupId", user_id);
	}

	@Override
	public int checkDupNick(String user_nick) {
		return sqlSession.selectOne(NAMESPACE + "checkDupNick", user_nick);
	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert(NAMESPACE + "insertMember", member);
	}

	@Override
	public Member login(Member member) {
		return sqlSession.selectOne(NAMESPACE + "login", member);
	}

	@Override
	public Member selectMember(String user_id) {
		return sqlSession.selectOne(NAMESPACE + "selectMember", user_id);
	}

	@Override
	public Member findId(Member member) {
		return sqlSession.selectOne(NAMESPACE + "findId", member);
	}

	@Override
	public int checkDupEmail(String user_email) {
		return sqlSession.selectOne(NAMESPACE + "checkDupEmail", user_email);
	}

	@Override
	public List<Board> selectBoardList(BoardSearch bs) {
		return sqlSession.selectList(NAMESPACE + "selectBoardList", bs);
	}

	@Override
	public int getBoardListCount(BoardSearch bs) {
		return sqlSession.selectOne(NAMESPACE + "getBoardListCount", bs);
	}

	@Override
	public int deleteBoardList(List<Board> boardList) {
		int result = sqlSession.update(NAMESPACE + "deleteBoardList", boardList);
		System.out.println(result);
		return result;
	}

	@Override
	public List<Comment> selectCommentList(BoardSearch bs) {
		return sqlSession.selectList(NAMESPACE + "selectCommentList", bs);
	}

	@Override
	public int getCommentListCount(BoardSearch bs) {
		return sqlSession.selectOne(NAMESPACE + "getCommentListCount", bs);
	}

	@Override
	public int deleteCommentList(List<Comment> commentList) {
		return sqlSession.update(NAMESPACE + "deleteCommentList", commentList);
	}

	@Override
	public List<Board> selectBookmarkList(BoardSearch bs) {
		return sqlSession.selectList(NAMESPACE + "selectBookmarkList", bs);
	}

	@Override
	public int getBookmarkListCount(BoardSearch bs) {
		return sqlSession.selectOne(NAMESPACE + "getBookmarkListCount", bs);
	}

	@Override
	public int deleteBookmarkList(List<Board> bookmarkList) {
		return sqlSession.delete(NAMESPACE + "deleteBookmarkList", bookmarkList);
	}

	@Override
	public int updateProfile(Member member) {
		return sqlSession.update(NAMESPACE + "updateProfile", member);
	}

	@Override
	public int updateInfo(Member member) {
		return sqlSession.update(NAMESPACE + "updateInfo", member);
	}

	@Override
	public int updateEmail(Member member) {
		return sqlSession.update(NAMESPACE + "updateEmail", member);
	}

	@Override
	public int deleteMember(Member member) {
		return sqlSession.update(NAMESPACE + "deleteMember", member);
	}

}
