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
import org.springframework.web.bind.support.SessionStatus;
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
	public String me(@ModelAttribute("loginMember") Member loginMember, Model model) throws Exception {
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
	
	//닉네임 중복체크
	@RequestMapping(value = "checkPw")
	@ResponseBody
	public String checkPw(@RequestParam("currPw") String currPw,
		@ModelAttribute("loginMember") Member loginMember) throws Exception {
		logger.info("checkPw");
		System.out.println(currPw);
		System.out.println(loginMember);
		boolean result = false;
		if (loginMember != null) { 
			if(currPw.equals(loginMember.getUser_pw())) {
				result = true;
			}
		} 
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "update")
	public String update(@ModelAttribute("bs") BoardSearch bs,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "chkPw", required = false) String chkPw,
			RedirectAttributes ras, Model model) throws Exception {
		logger.info("update");
		
		System.out.println("chkPw:" + chkPw);
		System.out.println("loginMember:" + loginMember);
		String act = bs.getAct();
		
//		String user_id = null;
//		if(loginMember != null) {
//			user_id = loginMember.getUser_id();
//		}
//		Member member = memberService.selectMember(user_id, null, true);
//		System.out.println("member:" + member);
		
//		model.addAttribute("member", member);
		
		if(act.equals("pw")) {
			return "myInfo/pwChange";
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
					System.out.println("다름");
					ras.addFlashAttribute("msg", "fail");
					switch (act) {
					case "info":
						ras.addAttribute("act", "info");
						break;
					case "email":
						ras.addAttribute("act", "email");
						break;
					}
					return "redirect:update";
				}
			}
		}
		return "myInfo/pwCheck";
	}
	
	@RequestMapping(value = "updateRun", method = RequestMethod.POST)
	public String updateRun(@ModelAttribute("loginMember") Member loginMember,
			Member member, @RequestParam(value = "act", required = false) String act) throws Exception {
		logger.info("updateRun");
		System.out.println("member:" + member);
		System.out.println("act" + act);
		int result = 0;
		
		if(loginMember != null) {
			member.setUser_id(loginMember.getUser_id());
		}
		switch (act) {
		case "info":
			result = memberService.updateInfo(member);
		case "email":
			result = memberService.updateEmail(member);
			break;
		case "pw":
			result = memberService.updatePw(member);
			break;
		}
		return "redirect:/me";
	}
	
	@RequestMapping(value = "delete")
	public String delete() throws Exception {
		return "myInfo/deleteAccountPw";
	}
	
	@RequestMapping(value = "deleteRun")
	public String deleteRun(@ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "chkPw") String chkPw,
			SessionStatus status, RedirectAttributes ras) throws Exception {
		logger.info("deleteRun");
		
		System.out.println("chkPw:" + chkPw);
		System.out.println("loginMember:" + loginMember);
		
		int result = 0;
		if (loginMember != null) {
			if(chkPw != null) {
				if(chkPw.equals(loginMember.getUser_pw())) {
					System.out.println("같음");
					result = memberService.deleteMember(loginMember);
					status.setComplete();
					return "myInfo/deleteAccountResult";
				} else {
					System.out.println("다름");
					ras.addFlashAttribute("msg", "fail");
				}
			}
		}
		return "redirect:delete";
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
