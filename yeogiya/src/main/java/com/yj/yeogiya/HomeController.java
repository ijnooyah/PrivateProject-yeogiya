package com.yj.yeogiya;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.Member;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Model model, BoardSearch bs, HttpSession session) {
		logger.info("home");
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println("loginMember:" + loginMember);
		List<Board> boardList = null;
		if(loginMember != null) {
			if(loginMember.getSort_local() != null) {
				boardList = boardService.selectMain(loginMember);
			}
		}
		System.out.println(boardList);
		
		model.addAttribute("boardList", boardList);
		
		return "board/boardMain";
	}
	
	
	
	
}
