package com.yj.yeogiya.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yj.yeogiya.board.model.service.BoardService;
import com.yj.yeogiya.board.model.vo.BoardSearch;
import com.yj.yeogiya.board.model.vo.Sort;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/{sortLocalPEngName}")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Value("#{property['file.rootPath']}") 
	private String rootPath;
	
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
	@ModelAttribute("sortLocalP")
	public Sort sortLocalP(@PathVariable("sortLocalPEngName") String sortLocalPEngName) {
		return boardService.selectSortLocalPByEngName(sortLocalPEngName);
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String boardMain(Model model) {
//		Sort sortLocalP = boardService.selectSortLocalByEngName(sortLocalPEngName);
//		model.addAttribute("sortLocalP", sortLocalP );
		
		return "board/boardMain";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("bs") BoardSearch bs) {
//		System.out.println(bs);
		return "board/boardList";
	}
	
	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView() {
		
		return "board/boardView";
	}
	
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(Model model) {
		
		return "board/boardInsert";
	}
	
	@RequestMapping(value = "insertRun", method = RequestMethod.GET)
	public String insertRun() {
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value = "content/{test_no}", method = RequestMethod.GET)
	public String content(Model model) {
		return "board/boardView";
	}
	
}
