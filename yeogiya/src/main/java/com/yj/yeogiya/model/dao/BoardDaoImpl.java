package com.yj.yeogiya.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardPlace;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Member;
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
	public Board selectBoard(String login_id, int board_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("login_id", login_id);
		map.put("board_no", board_no);
		return sqlSession.selectOne(NAMESPACE + "selectBoard", map);
	}

	@Override
	public int insertBoardImg(List<BoardImg> imgList) {
		return sqlSession.insert(NAMESPACE + "insertBoardImg", imgList);
	}

	@Override
	public int insertTag(List<BoardTag> tagList) {
		return sqlSession.insert(NAMESPACE + "insertTag", tagList);
	}

	public int insertBoardTag(List<BoardTag> tagList) {
		return sqlSession.insert(NAMESPACE + "insertBoardTag", tagList);
	}

	@Override
	public int insertPlace(BoardPlace place) {
		return sqlSession.update(NAMESPACE + "insertPlace", place);
	}

	@Override
	public int insertBoardPlace(BoardPlace place) {
		return sqlSession.update(NAMESPACE + "insertBoardPlace", place);
	}

	@Override
	public List<BoardTag> selectBoardTag(int board_no) {
		return sqlSession.selectList(NAMESPACE + "selectBoardTag", board_no);
	}

	@Override
	public BoardPlace selectBoardPlace(int board_no) {
		return sqlSession.selectOne(NAMESPACE + "selectBoardPlace", board_no);
	}

	@Override
	public int deleteBoardTag(List<BoardTag> oldTagList) {
		return sqlSession.delete(NAMESPACE + "deleteBoardTag", oldTagList);
	}

	@Override
	public int updateBoardPlace(BoardPlace boardPlace) {
		return sqlSession.update(NAMESPACE + "updateBoardPlace", boardPlace);
	}

	@Override
	public List<BoardImg> selectBoardImg(int board_no) {
		return sqlSession.selectList(NAMESPACE + "selectBoardImg", board_no);
	}

	@Override
	public int deleteBoardImg(int board_no) {
		return sqlSession.delete(NAMESPACE + "deleteBoardImg", board_no);
	}

	@Override
	public List<BoardTag> searchTag(String keyword) {
		return sqlSession.selectList(NAMESPACE + "searchTag", keyword);
	}

	@Override
	public int updateCmtCnt(int board_no, int count) {
		Map<String, Integer> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("count", count);
		return sqlSession.update(NAMESPACE + "updateCmtCnt", map);
	}

	@Override
	public int updateViewCnt(int board_no) {
		return sqlSession.update(NAMESPACE + "updateViewCnt", board_no);
	}

	@Override
	public int updateLikeCnt(int board_no, int count) {
		Map<String, Integer> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("count", count);
		return sqlSession.update(NAMESPACE + "updateLikeCnt", map);
	}

	@Override
	public int insertLike(int board_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("user_id", user_id);
		return sqlSession.insert(NAMESPACE + "insertLike", map);
	}

	@Override
	public int deleteLike(int board_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("user_id", user_id);
		return sqlSession.delete(NAMESPACE + "deleteLike", map);
	}

	@Override
	public int insertBookmark(int board_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("user_id", user_id);
		return sqlSession.insert(NAMESPACE + "insertBookmark", map);
	}

	@Override
	public int deleteBookmark(int board_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("user_id", user_id);
		return sqlSession.delete(NAMESPACE + "deleteBookmark", map);
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
	public int deleteBoard(int board_no) {
		return sqlSession.update(NAMESPACE + "deleteBoard", board_no);
	}

	@Override
	public List<Board> selectMain(Member member) {
		return sqlSession.selectList(NAMESPACE + "selectMain", member);
	}

	@Override
	public List<Board> selectNoticeList(BoardSearch bs) {
		return sqlSession.selectList(NAMESPACE + "selectNoticeList", bs);
	}

	

}
