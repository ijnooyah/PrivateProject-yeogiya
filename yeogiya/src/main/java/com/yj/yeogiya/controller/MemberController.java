package com.yj.yeogiya.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원가입 페이지
	@RequestMapping(value = "term", method = RequestMethod.GET)
	public String term(Model model) {
		
		return "member/term";
	}
	
	//회원가입 페이지
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Model model) {
		
		return "member/signUp";
	}
	
	@RequestMapping(value = "joinRun", method = RequestMethod.GET)
	public String joinRun(Model model) {
		
		return "redirect:/login";
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
