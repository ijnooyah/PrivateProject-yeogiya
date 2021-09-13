package com.yj.yeogiya.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;


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
		Board board = boardService.selectBoardArticle(null, board_no, true);
		model.addAttribute("board", board);
		return "board/boardUpdate";
	}
	
	//글상세보기페이지
	@RequestMapping(value = "content/{board_no}")
	public String content(Model model, @PathVariable("board_no") int board_no) throws Exception {
		logger.info("content");
		String login_id = "mimi";
		Board board = boardService.selectBoardArticle(login_id, board_no, false);
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
//		System.out.println(board);
		int board_no = boardService.insertBoardArticle(board);
//		System.out.println("board_no: " + board_no);
		
		String sortBoard = "sortBoard=" + board.getSort_board();
		String subLocal = "&subLocal=" + board.getSub_local();
		String url = "redirect:content/" + board_no + "?" + sortBoard + subLocal;
		if (board.getSort_place() != null) {
			url += "&sortPlace=" + board.getSort_place();
		} 
		
		return url;
	}
	
	//글수정작업
	@RequestMapping(value = "updateRun", method = RequestMethod.POST)
	public String updateRun(Board board) throws Exception {
		logger.info("updateRun");
//		System.out.println(board);
		int result = boardService.updateBoardArticle(board);
		int board_no = board.getBoard_no();
		String sortBoard = "sortBoard=" + board.getSort_board();
		String subLocal = "&subLocal=" + board.getSub_local();
		String url = "redirect:content/" + board_no + "?" + sortBoard + subLocal;
		if (board.getSort_place() != null) {
			url += "&sortPlace=" + board.getSort_place();
		} 
		
		return url;
	}
	
	//태그
	@RequestMapping(value = "searchTag", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searchTag(String keyword) {    
		logger.info("searchTag");
//		System.out.println("keyword" + keyword);
		List<BoardTag> tagList = boardService.searchTag(keyword);
	    
	    Gson gson = new Gson();
	    return gson.toJson(tagList); 
	}
	
	//좋아요
	@RequestMapping(value = "like", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String like(@RequestParam int board_no) {    
		logger.info("like");
	    int result = boardService.likeBoard("mimi", board_no);
	    
	    if (result == 0) {
	    	return "cancel";
	    }
	    return "like"; 
	}
	
	//좋아요
	@RequestMapping(value = "bookmark", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String bookmark(@RequestParam int board_no) {    
		logger.info("bookmark");
	    int result = boardService.bookmarkBoard("mimi", board_no);
	    
	    if (result == 0) {
	    	return "cancel";
	    }
	    return "bookmark"; 
	}
}
