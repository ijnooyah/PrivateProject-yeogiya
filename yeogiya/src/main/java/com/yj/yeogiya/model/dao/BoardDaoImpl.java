package com.yj.yeogiya.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.model.vo.Sort;


@Repository
public class BoardDaoImpl implements BoardDao {
	private static final String NAMESPACE = "com.yj.yeogiya.board.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<Sort> selectSortLocal() {
		return sqlSession.selectList(NAMESPACE + "selectSortLocal");
	}

	@Override
	public List<Sort> selectSortPlace() {
		return sqlSession.selectList(NAMESPACE + "selectSortPlace");
	}

	@Override
	public List<Sort> selectSortBoard() {
		return sqlSession.selectList(NAMESPACE + "selectSortBoard");
	}

	@Override
	public Sort selectSortLocalPByEngName(String eng_name) {
		return sqlSession.selectOne(NAMESPACE + "selectSortLocalPByEngName", eng_name);
	}
	

}
