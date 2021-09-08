package com.yj.yeogiya.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.model.vo.TestImg;
import com.yj.yeogiya.model.vo.TestVo;


@Repository
public class TestDaoImpl implements TestDao {

	private static final String NAMESPACE = "com.yj.yeogiya.test.";

	@Inject
	private SqlSession sqlSession;

	@Override
	public int insert(TestVo testVo) {
		return sqlSession.insert(NAMESPACE + "insert", testVo);
	}

	@Override
	public TestVo select(int test_no) {
		return sqlSession.selectOne(NAMESPACE + "select", test_no);
	}

	@Override
	public int insertImg(List<TestImg> imgs) {
		return sqlSession.insert(NAMESPACE + "insertImg", imgs);
	}

	@Override
	public List<TestImg> selectImg(int test_no) {
		return sqlSession.selectList(NAMESPACE + "selectImg", test_no);
	}

}
