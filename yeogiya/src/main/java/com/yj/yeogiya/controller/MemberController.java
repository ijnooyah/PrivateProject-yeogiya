package com.yj.yeogiya.controller;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value = "term", method = RequestMethod.GET)
	public String term(Model model) throws Exception {
		
		return "member/term";
	}
	
	//회원가입 페이지
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Model model) throws Exception {
		
		return "member/signUp";
	}
	
	//아이디 중복체크
	@RequestMapping(value = "checkDupId", method = RequestMethod.POST)
	@ResponseBody
	public String checkDupId(@RequestParam("user_id") String user_id) throws Exception {
		System.out.println(user_id);
		boolean result = memberService.checkDupId(user_id);
		return String.valueOf(result);
	}
	
	//닉네임 중복체크
	@RequestMapping(value = "checkDupNick")
	@ResponseBody
	public String checkDupNick(@RequestParam("user_nick") String user_nick) throws Exception {
		System.out.println(user_nick);
		boolean result = memberService.checkDupNick(user_nick);
		return String.valueOf(result);
	}
	
	//이메일 인증번호
	@RequestMapping(value = "emailAuth")
	@ResponseBody
	public int emailAuth(@RequestParam("user_email") String user_email) throws Exception {
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
		

		return authNum;
	}
	
	@RequestMapping(value = "joinRun", method = RequestMethod.POST)
	public String joinRun(Member member) throws Exception {
		System.out.println(member);
		int result = memberService.join(member);
		return "member/signUpResult";
	}
	
	@RequestMapping(value = "signUpResult", method = RequestMethod.GET)
	public String signUpResult(Member member) throws Exception {
		System.out.println(member);
		return "member/signUpResult";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		
		return "member/login";
	}
	
	// 로그인 
	@RequestMapping("loginRun")
	public String loginRun(Member member, Model model,
			HttpServletResponse response, RedirectAttributes ras) throws Exception {

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

			url = "/"; // 성공 시 메인페이지

		} else { // 로그인 실패 시
			ras.addFlashAttribute("msg", "fail");

			url = "login"; // 로그인 실패 시 로그인 전환 화면으로 재요청하는 주소를 작성.
		}

		return "redirect:" + url;
	}
	
	
	@RequestMapping(value = "idFind", method = RequestMethod.GET)
	public String idFind(Model model) throws Exception {
		
		return "member/idFind";
	}
	
	@RequestMapping(value = "pwFind", method = RequestMethod.GET)
	public String pwFind(Model model) throws Exception {
		
		return "member/pwFind";
	}
	@RequestMapping(value = "pwFindResult", method = RequestMethod.GET)
	public String pwFindResult(Model model) throws Exception {
		
		return "member/pwFindResult";
	}
	
	@RequestMapping(value = "idFindResult", method = RequestMethod.GET)
	public String idFindResult(Model model) throws Exception {
		
		return "member/idFindResult";
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(Model model) throws Exception {
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "mypageChange", method = RequestMethod.GET)
	public String mypageChange(Model model) throws Exception {
		
		return "mypage/mypageChange";
	}
	
	@RequestMapping(value = "myInfoView", method = RequestMethod.GET)
	public String myInfoView(Model model) throws Exception {
		
		return "myInfo/myInfoView";
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
