package com.yj.yeogiya.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.model.vo.Tag;
import com.yj.yeogiya.model.vo.TestImg;
import com.yj.yeogiya.model.vo.TestTag;
import com.yj.yeogiya.model.vo.TestVo;


@Repository
public class TestDaoImpl implements TestDao {

	private static final String NAMESPACE = "com.yj.yeogiya.test.";

	@Inject
	private SqlSession sqlSession;

	@Override
	public int insert(TestVo testVo) {
		sqlSession.insert(NAMESPACE + "insert", testVo);
		return testVo.getTest_no();
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

	@Override
	public int updateTest(TestVo testVo) {
		return sqlSession.update(NAMESPACE + "updateTest", testVo);
	}

	@Override
	public int insertTag(List<TestTag> tagList) {
		return sqlSession.insert(NAMESPACE + "insertTag", tagList);
	}

	@Override
	public int insertBoardTag(List<TestTag> tagList) {
		return sqlSession.insert(NAMESPACE + "insertBoardTag", tagList);
	}

}
