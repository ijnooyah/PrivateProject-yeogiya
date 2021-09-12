package com.yj.yeogiya.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.Sort;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/{sortLocalPEngName}")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@ModelAttribute("sortLocalP")
	public Sort sortLocalP(@PathVariable("sortLocalPEngName") String sortLocalPEngName) {
		return boardService.selectSortLocalPByEngName(sortLocalPEngName);
	}
	
	//지역별페이지
	@RequestMapping(value = "main")
	public String main() throws Exception {
		return "board/boardMain";
	}
	
	//글작성페이지
	@RequestMapping(value = "insert")
	public String insert() throws Exception {
		return "board/boardInsert";
	}
	
	//글수정페이지
	@RequestMapping(value = "update/{board_no}")
	public String update(Model model, @PathVariable("board_no") int board_no) throws Exception {
		logger.info("update");
		Board board = boardService.selectBoardArticle(board_no);
		model.addAttribute("board", board);
		model.addAttribute("tagList", JSONArray.fromObject(board.getTagList()));
		return "board/boardUpdate";
	}
	
	//글상세보기페이지
	@RequestMapping(value = "content/{board_no}")
	public String content(Model model, @PathVariable("board_no") int board_no) throws Exception {
		logger.info("content");
		Board board = boardService.selectBoardArticle(board_no);
		model.addAttribute("board", board);
		return "board/boardView";
	}
	
	//글목록페이지
	@RequestMapping(value = "list")
	public String list() throws Exception {
		logger.info("list");
		return "board/boardList";
	}
	
	
	
	//글작성작업
	@RequestMapping(value = "insertRun", method = RequestMethod.POST)
	public String insertRun(Board board) throws Exception {
		logger.info("insertRun");
		System.out.println(board);
		int board_no = boardService.insertBoardArticle(board);
		System.out.println("board_no: " + board_no);
		return "redirect:content/" + board_no;
	}
	
	//글수정작업
	@RequestMapping(value = "updateRun", method = RequestMethod.POST)
	public String updateRun(Board board) throws Exception {
		logger.info("updateRun");
		System.out.println(board);
		int result = boardService.updateBoardArticle(board);
		
		return "redirect:content/" + board.getBoard_no();
	}
	
	
}
