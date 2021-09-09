package com.yj.yeogiya.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardTag;
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

	@Override
	public int insertBoard(Board board) {
		sqlSession.insert(NAMESPACE + "insertBoard", board);
		return board.getBoard_no();
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update(NAMESPACE + "updateBoard", board);
	}

	@Override
	public Board selectBoard(int board_no) {
		return sqlSession.selectOne(NAMESPACE + "selectBoard", board_no);
	}

	@Override
	public int insertImg(List<BoardImg> imgList) {
		return sqlSession.insert(NAMESPACE + "insertImg", imgList);
	}

	@Override
	public int insertTag(List<BoardTag> tagList) {
		return sqlSession.insert(NAMESPACE + "insertTag", tagList);
	}

	public int insertBoardTag(List<BoardTag> tagList) {
		return sqlSession.insert(NAMESPACE + "insertBoardTag", tagList);
	}
	

}
