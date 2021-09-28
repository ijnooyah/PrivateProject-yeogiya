package com.yj.yeogiya.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
