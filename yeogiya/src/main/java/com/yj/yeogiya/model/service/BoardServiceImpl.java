package com.yj.yeogiya.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.BoardDao;
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

}
