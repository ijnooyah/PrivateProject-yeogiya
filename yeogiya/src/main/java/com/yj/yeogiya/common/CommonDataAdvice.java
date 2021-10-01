package com.yj.yeogiya.common;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yj.yeogiya.controller.BoardController;
import com.yj.yeogiya.controller.MemberController;
import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.Member;
import com.yj.yeogiya.model.vo.Sort;


@ControllerAdvice(assignableTypes = {BoardController.class, MemberController.class})
public class CommonDataAdvice {
	
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
	public BoardSearch boardSearch(BoardSearch bs, Model model) {
		return bs;
	}
	
}
