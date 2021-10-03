package com.yj.yeogiya.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.service.MemberService;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Member;
import com.yj.yeogiya.model.vo.Sort;


@SessionAttributes({"loginMember"})
@RequestMapping("/profile")
@Controller
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "{user_id}", method = RequestMethod.GET)
	public String profile(@ModelAttribute("bs") BoardSearch bs, Model model, RedirectAttributes ras) throws Exception {
		logger.info("profile");
//		System.out.println(bs);
		
		if(bs.getTab() == null) {
			ras.addAttribute("tab", "board");
			return "redirect:";
		}
		
		Member member = memberService.selectMember(bs.getUser_id(), bs, true);
//		System.out.println(member);
		
		if (member == null) {
			return "common/404";
		}
		
		model.addAttribute("member", member);
		
		return "mypage/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public int profileDelete(@ModelAttribute("loginMember") Member loginMember, 
			@RequestParam(value = "tab") String tab,
			@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		logger.info("delete");
		System.out.println("chArr:" + chArr);
		System.out.println("tab:" + tab);
		int result = 0;
		if(loginMember != null) {
			String user_id = loginMember.getUser_id();
			result = memberService.deleteList(tab, chArr, user_id);
		}  
		System.out.println("result:" + result); 
		return result;
	}
	
	@RequestMapping(value = "update")
	public String profileEdit(Model model, @ModelAttribute("loginMember") Member loginMember) throws Exception {
		Member member = memberService.selectMember(loginMember.getUser_id(), null, true);
		model.addAttribute("member", member);
		return "mypage/mypageChange";
	}
	
	@RequestMapping(value = "updateRun")
	public String profileEditRun(@ModelAttribute("loginMember") Member loginMember,
			Member member) throws Exception {
		logger.info("profileEditRun");
		System.out.println("member:" + member);
		member.setUser_id(loginMember.getUser_id());
		int result = memberService.updateProfile(member);
		return "redirect:" + loginMember.getUser_id();
	}
	
	
}
