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
@RequestMapping("/me")
@Controller
public class MeController {
	
	private static final Logger logger = LoggerFactory.getLogger(MeController.class);
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "")
	public String me(@ModelAttribute("loginMember") Member loginMember, Model model, RedirectAttributes ras) throws Exception {
		logger.info("me");
		
		String user_id = null;
		if(loginMember != null) {
			user_id = loginMember.getUser_id();
		}
		Member member = memberService.selectMember(user_id, null, true);
		System.out.println("member:" + member);
		
		model.addAttribute("member", member);
		
		return "myInfo/myInfoView";
	}
	
	@RequestMapping(value = "update")
	public String update(@ModelAttribute("bs") BoardSearch bs,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "chkPw", required = false) String chkPw,
			RedirectAttributes ras) throws Exception {
		logger.info("update");
		
		System.out.println("chkPw:" + chkPw);
		System.out.println("loginMember:" + loginMember);
		String act = bs.getAct();
		
		if(act.equals("pw")) {
			return "myInfo/myInfoChange";
		}
		
		if (loginMember != null) {
			if(chkPw != null) {
				if(chkPw.equals(loginMember.getUser_pw())) {
					System.out.println("같음");
					switch (act) {
					case "info":
						return "myInfo/myInfoChange";
					case "email":
						return "myInfo/emailChange";
					}
				} else {
					ras.addFlashAttribute("msg", "fail");
					System.out.println("다름");
				}
			}
		}
		return "myInfo/pwCheck";
	}
	@RequestMapping(value = "updateEmail")
	public String updateEmail(@ModelAttribute("loginMember") Member loginMember,
			Model model) throws Exception {
		logger.info("updateEmail");
		
		return "myInfo/myInfoChange";
	}
	@RequestMapping(value = "myInfoChange", method = RequestMethod.GET)
	public String myInfoChange(Model model) throws Exception {
		
		return "myInfo/myInfoChange";
	}
	
	@RequestMapping(value = "myInfoChangePw", method = RequestMethod.GET)
	public String myInfoChangePw(Model model) throws Exception {
		
		return "myInfo/myInfoChangePw";
	}
	
	@RequestMapping(value = "emailChangePw", method = RequestMethod.GET)
	public String emailChangePw(Model model) throws Exception {
		
		return "myInfo/emailChangePw";
	}
	@RequestMapping(value = "emailChange", method = RequestMethod.GET)
	public String emailChange(Model model) throws Exception {
		
		return "myInfo/emailChange";
	}
	@RequestMapping(value = "deleteAccountResult", method = RequestMethod.GET)
	public String deleteAccountResult(Model model) throws Exception {
		
		return "myInfo/deleteAccountResult";
	}
	@RequestMapping(value = "deleteAccountPw", method = RequestMethod.GET)
	public String deleteAccountPw(Model model) throws Exception {
		
		return "myInfo/deleteAccountPw";
	}
	@RequestMapping(value = "pwChange", method = RequestMethod.GET)
	public String pwChange(Model model) throws Exception {
		
		return "myInfo/pwChange";
	}
	
}
