package com.yj.yeogiya.common;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.yj.yeogiya.HomeController;
import com.yj.yeogiya.controller.BoardController;
import com.yj.yeogiya.controller.MeController;
import com.yj.yeogiya.controller.MemberController;
import com.yj.yeogiya.controller.ProfileController;
import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.Sort;


@ControllerAdvice(assignableTypes = {BoardController.class, MemberController.class,
									ProfileController.class, MeController.class, HomeController.class})
public class CommonDataAdvice {
	private static final Logger logger = LoggerFactory.getLogger(CommonDataAdvice.class);
	
	@Inject
	private BoardService boardService;
	
	@ModelAttribute("sortLocalList")
	public List<Sort> sortLocal() {
	  return boardService.selectSortLocal();
	}
	@ModelAttribute("sortPlaceList")
	public List<Sort> sortPlace() {
		return boardService.selectSortPlace();
	}
	@ModelAttribute("sortBoardList")
	public List<Sort> sortBoard() {
		return boardService.selectSortBoard();
	}
	
	@ModelAttribute("bs")
	public BoardSearch boardSearch(BoardSearch bs) {
		logger.info("bs");
		System.out.println("bs:" + bs);
		return bs;
	}
	
}
