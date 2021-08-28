package com.yj.yeogiya.test.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.test.model.vo.TestVo;

@Repository
public class TestDaoImpl implements TestDao {

	private static final String NAMESPACE = "com.yj.yeogiya.test.";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert(TestVo testVo) {
		sqlSession.insert(NAMESPACE + "insert", testVo);
	}

	@Override
	public TestVo select(int test_no) {
		return sqlSession.selectOne(NAMESPACE + "select", test_no);
	}

}
