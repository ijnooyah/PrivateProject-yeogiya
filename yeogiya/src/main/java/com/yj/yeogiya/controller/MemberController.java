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
@RequestMapping("/member")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Value("#{property['email.username']}") 
	public String from;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private JavaMailSender mailSender;
	
	//회원가입 페이지
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(@RequestParam(value = "serviceCheck", required = false) String serviceCheck, 
			@RequestParam(value = "geoCheck", required = false) String geoCheck,
			@RequestParam(value = "ageCheck", required = false) String ageCheck ) throws Exception {
		if(serviceCheck != null && geoCheck != null && ageCheck != null) {
			return "member/signUp";
		} else {
			return "member/term";
		}
	}
	
	//아이디 중복체크
	@RequestMapping(value = "checkDupId", method = RequestMethod.POST)
	@ResponseBody
	public String checkDupId(@RequestParam("user_id") String user_id) throws Exception {
//		System.out.println(user_id);
		boolean result = memberService.checkDupId(user_id);
		return String.valueOf(result);
	}
	
	//닉네임 중복체크
	@RequestMapping(value = "checkDupNick")
	@ResponseBody
	public String checkDupNick(@RequestParam("user_nick") String user_nick,
			HttpSession session) throws Exception {
		logger.info("checkDupNick");
		System.out.println(user_nick);
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(loginMember);
		boolean result = false;
		if (loginMember != null) { // not signUp
			result  = memberService.checkDupNick(user_nick, loginMember.getUser_nick());
		} else {
			result  = memberService.checkDupNick(user_nick, null);
		}
		return String.valueOf(result);
	}
	
	
	//이메일 중복체크
	@RequestMapping(value = "checkDupEmail")
	@ResponseBody
	public boolean checkDupEmail(@RequestParam("user_email") String user_email) throws Exception {
		logger.info("checkDupEmail");
		System.out.println(user_email);
		boolean result = memberService.checkDupEmail(user_email);
		return result;
	}
	
	//이메일 인증번호
	@RequestMapping(value = "emailAuth")
	@ResponseBody
	public String emailAuth(@RequestParam("user_email") String user_email) throws Exception {
		String to = user_email; // 받는 사람 이메일
		String title = "[여기야!] 회원가입 인증번호";
		int authNum = 0;
		Random random = new Random();
		authNum = random.nextInt(8999) + 1000;
		String content = "인증번호[" + authNum + "]를 입력해 주세요.";

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, false, "UTF-8");

		messageHelper.setFrom(from); 
		messageHelper.setTo(to); 
		messageHelper.setSubject(title); 
		messageHelper.setText(content); 

		mailSender.send(message);
		

		return String.valueOf(authNum);
	}
	
	@RequestMapping(value = "joinRun")
	public String joinResult(Member member, Model model) throws Exception {
//		System.out.println(member);
		int result = memberService.join(member);
		if(result == 1) {
			model.addAttribute("loginMember", member);
		}
		return "member/signUpResult";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		
		return "member/login";
	}
	
	// 로그인 
	@RequestMapping("loginRun")
	public String loginRun(Member member, Model model, HttpSession session,
			HttpServletResponse response, RedirectAttributes ras) throws Exception {
		logger.info("loginRun");
		System.out.println("member : "+member);
		Member loginMember = memberService.loginRun(member);
		System.out.println("loginMember : "+ loginMember); 
		String url = "";
		if (loginMember != null) { // 로그인 성공 시
			model.addAttribute("loginMember", loginMember);
			Cookie cookie = new Cookie("saveId", loginMember.getUser_id());

			if (member.getSaveId() != null) { 
				System.out.println("쿠키 유");
				//한달 유지
				cookie.setMaxAge(60 * 60 * 24 * 30); 

			} else { 
				System.out.println("쿠키 무");
				cookie.setMaxAge(0);
			}

			// 생성된 쿠키 객체를 응답 객체에 담아서 내보냄
			response.addCookie(cookie);
			
			String requestPath = (String) session.getAttribute("requestPath");
			System.out.println("requestPath :" + requestPath);
			url = "/";
				

		} else { // 로그인 실패 시
			ras.addFlashAttribute("msg", "fail");

			url = "login"; 
		}

		return "redirect:" + url;
	}
	
	//비번찾기 가이드
	@RequestMapping(value = "emailGuide")
	@ResponseBody
	public String emailGuide(@RequestBody Member member) throws Exception {
//		System.out.println(member);
		Member existMember = memberService.selectMember(member.getUser_id(), null, true);
		if(existMember == null) {
			return "fail";
		}
//		System.out.println(existMember);
		String to = member.getUser_email(); // 받는 사람 이메일
		String title = "[여기야!] 비밀번호 찾기";
		String content = "비밀번호: " + existMember.getUser_pw();

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, false, "UTF-8");

		messageHelper.setFrom(from); 
		messageHelper.setTo(to); 
		messageHelper.setSubject(title); 
		messageHelper.setText(content); 

		mailSender.send(message);
		

		return "success";
	}

	@RequestMapping(value = "pwFind")
	public String pwFind(@RequestParam(value = "next", required = false) String next,
			HttpSession session, Model model) throws Exception {
//		System.out.println("next" + next);
		Member existMember =(Member) model.asMap().get("existMember");
//		System.out.println("pwFind : " + existMember);
		if(next != null) {
			if(next.equals("auth")) {
				if(existMember != null) {
					return "member/pwFind2";
				} else {
					return "redirect:pwFind";
				}
			}
		}
		return "member/pwFind1";
	}
	@RequestMapping(value = "pwFindRun", method = RequestMethod.POST)
	public String pwFindRun(Model model, RedirectAttributes ras,
			@RequestParam("user_id") String user_id, HttpSession session) throws Exception {
//		System.out.println("user_id : "+user_id);
		Member existMember = memberService.selectMember(user_id, null, false);
//		System.out.println("pwFindRun : "+ existMember); 
		
		if (existMember != null) { // 해당유저존재시 
			ras.addFlashAttribute("existMember", existMember);
			ras.addAttribute("next", "auth");
		} else {
			ras.addFlashAttribute("msg", "fail");
		}
		return "redirect:pwFind";
	}

	@RequestMapping(value = "idFind")
	public String idFind(Member member, RedirectAttributes ras, Model model) throws Exception {
//		System.out.println(member);
		String id = null;
		if(member.getUser_name() != null && member.getUser_email() != null) {
			id = memberService.findId(member);
			System.out.println("id" + id);
			if (id != null) {
				model.addAttribute("id", id);
				return "member/idFindResult";
			} else {
				ras.addFlashAttribute("msg", "fail");
				return "redirect:idFind";
			}
			
		} 
		System.out.println("id" + id);
		return "member/idFind";
	}
	
	@RequestMapping(value = "logout")
	public String logout(SessionStatus status) throws Exception {
		status.setComplete();
		return "redirect:/";
	}
}
