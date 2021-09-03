package com.yj.yeogiya;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	private TestDao testDao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("rootPath", rootPath );
		
		return "home";
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("rootPath", rootPath );
		
		return "board/boardList";
	}
	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView(Model model) {
		model.addAttribute("rootPath", rootPath );
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(Model model) {
		
		return "board/boardInsert";
	}
	
	@RequestMapping(value = "insertRun", method = RequestMethod.GET)
	public String insertRun(TestVo testVo) {
		testDao.insert(testVo);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value = "content/{test_no}", method = RequestMethod.GET)
	public String content(Model model, @PathVariable("test_no") int test_no) {
		TestVo testVo = testDao.select(test_no);
		System.out.println(testVo);
		model.addAttribute("testVo", testVo);
		return "board/boardView";
	}
	
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String signUp(Model model) {
		
		return "member/signUp";
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
	
}
