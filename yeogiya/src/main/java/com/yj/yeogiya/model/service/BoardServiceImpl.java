package com.yj.yeogiya.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yj.yeogiya.model.dao.BoardDao;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardPlace;
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
	
	@Transactional
	@Override
	public int insertBoardArticle(Board board) {
		// 1. board
		int board_no = boardDao.insertBoard(board);
		
		// 2. tag 
		String tag = board.getTag(); // "콤마로 연결되어 있는 상태"
		if(tag != null && tag.trim() != "") {
			String[] tags = tag.split(",");
			List<BoardTag> tagList = new ArrayList<BoardTag>();
			for (String splittedTag : tags) {
				BoardTag boardTag = new BoardTag(board_no, splittedTag);
				tagList.add(boardTag);
			}
			boardDao.insertTag(tagList);
			boardDao.insertBoardTag(tagList);
		}
		
		// 3. place 
		BoardPlace place = board.getPlace();
		if (board.getSort_place() != null) {
			place.setBoard_no(board_no);
			place.setSort_place(board.getSort_place());
			place.setSort_local(board.getSort_local());
			place.setSub_local(board.getSub_local());
			boardDao.insertPlace(place);
			boardDao.insertBoardPlace(place);
		}
		
		return board_no;
	}
	
	@Transactional
	@Override
	public Board selectBoardArticle(int board_no) {
		Board board = boardDao.selectBoard(board_no);
		return board;
	}
	
	@Transactional
	@Override
	public int updateBoardArticle(Board board) {
		return boardDao.updateBoard(board);
	}

}
