package com.yj.yeogiya;

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
import com.yj.yeogiya.board.model.vo.Sort;
import com.yj.yeogiya.test.model.dao.TestDao;
import com.yj.yeogiya.test.model.vo.TestVo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Value("#{property['file.rootPath']}") 
	private String rootPath;
	
	
	@Inject
	private BoardService boardService;
	
	@ModelAttribute("sortLocal")
	public List<Sort> sortLocal() {
	  return boardService.selectSortLocal();
	}
	@ModelAttribute("sortPlace")
	public List<Sort> sortPlace() {
		return boardService.selectSortPlace();
	}
	@ModelAttribute("sortBoard")
	public List<Sort> sortBoard() {
		return boardService.selectSortBoard();
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("rootPath", rootPath );
		
		return "home";
	}
	
	//약관동의
	@RequestMapping(value = "term", method = RequestMethod.GET)
	public String term(Model model) {
		
		return "member/term";
	}
	
	@RequestMapping(value = "signUpRun", method = RequestMethod.GET)
	public String signUpRun(Model model) {
		
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "member/login";
	}
	
	@RequestMapping(value = "loginRun", method = RequestMethod.GET)
	public String loginRun(Model model) {
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value = "idFind", method = RequestMethod.GET)
	public String idFind(Model model) {
		
		return "member/idFind";
	}
	
	@RequestMapping(value = "pwFind", method = RequestMethod.GET)
	public String pwFind(Model model) {
		
		return "member/pwFind";
	}
	@RequestMapping(value = "pwFindResult", method = RequestMethod.GET)
	public String pwFindResult(Model model) {
		
		return "member/pwFindResult";
	}
	
	@RequestMapping(value = "idFindResult", method = RequestMethod.GET)
	public String idFindResult(Model model) {
		
		return "member/idFindResult";
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(Model model) {
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "mypageChange", method = RequestMethod.GET)
	public String mypageChange(Model model) {
		
		return "mypage/mypageChange";
	}
	
	@RequestMapping(value = "myInfoView", method = RequestMethod.GET)
	public String myInfoView(Model model) {
		
		return "myInfo/myInfoView";
	}
	
	@RequestMapping(value = "myInfoChange", method = RequestMethod.GET)
	public String myInfoChange(Model model) {
		
		return "myInfo/myInfoChange";
	}
	
	@RequestMapping(value = "myInfoChangePw", method = RequestMethod.GET)
	public String myInfoChangePw(Model model) {
		
		return "myInfo/myInfoChangePw";
	}
	
	@RequestMapping(value = "emailChangePw", method = RequestMethod.GET)
	public String emailChangePw(Model model) {
		
		return "myInfo/emailChangePw";
	}
	@RequestMapping(value = "emailChange", method = RequestMethod.GET)
	public String emailChange(Model model) {
		
		return "myInfo/emailChange";
	}
	@RequestMapping(value = "deleteAccountResult", method = RequestMethod.GET)
	public String deleteAccountResult(Model model) {
		
		return "myInfo/deleteAccountResult";
	}
	@RequestMapping(value = "deleteAccountPw", method = RequestMethod.GET)
	public String deleteAccountPw(Model model) {
		
		return "myInfo/deleteAccountPw";
	}
	@RequestMapping(value = "pwChange", method = RequestMethod.GET)
	public String pwChange(Model model) {
		
		return "myInfo/pwChange";
	}
	
}
