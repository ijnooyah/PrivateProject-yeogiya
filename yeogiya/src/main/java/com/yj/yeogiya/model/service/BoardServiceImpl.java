package com.yj.yeogiya.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.BoardDao;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;



@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDao boardDao;

	@Override
	public List<Sort> selectSortLocal() {
		return boardDao.selectSortLocal();
	}

	@Override
	public List<Sort> selectSortPlace() {
		return boardDao.selectSortPlace();
	}

	@Override
	public List<Sort> selectSortBoard() {
		return boardDao.selectSortBoard();
	}

	@Override
	public Sort selectSortLocalPByEngName(String eng_name) {
		return boardDao.selectSortLocalPByEngName(eng_name);
	}

	@Override
	public int insertBoardArticle(Board board) {
		int board_no = boardDao.insertBoard(board);
		// tag 테이블 insert
		String tag = board.getTag(); // "콤마로 연결되어 있는 상태"
		String[] tags = tag.split(",");
		List<BoardTag> tagList = new ArrayList<BoardTag>();
		for (String splittedTag : tags) {
			BoardTag boardTag = new BoardTag(board_no, splittedTag);
			tagList.add(boardTag);
		}
		boardDao.insertTag(tagList);
		boardDao.insertBoardTag(tagList);
		return board_no;
	}

	@Override
	public Board selectBoardArticle(int board_no) {
		Board board = boardDao.selectBoard(board_no);
		return board;
	}

	@Override
	public int updateBoardArticle(Board board) {
		return boardDao.updateBoard(board);
	}

}
