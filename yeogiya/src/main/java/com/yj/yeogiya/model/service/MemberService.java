package com.yj.yeogiya.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Member;
import com.yj.yeogiya.model.vo.Sort;

public interface MemberService {
	
//************CREATE************
	public int join(Member member); 
	//************READ************
	//아이디 중복체크
	public boolean checkDupId(String user_id);
	//아이디 중복체크
	public boolean checkDupNick(String user_nick, String orgUserNick);
	public boolean checkDupEmail(String user_email);
	//로그인
	public Member loginRun(Member member);
	public Member selectMember(String user_id, BoardSearch bs, boolean getAll);
	//아이디 뒤에 두글자 자르고 ** 추가해서 리턴
	public String findId(Member member);
	
//************UPDATE************
	public int updateProfile(Member member);
	public int updateInfo(Member member);
	public int updateEmail(Member member);
	public int updatePw(Member member);
	
//************DELETE************
	public int deleteList(String tab, List<String> chArr, String user_id);
	public int deleteMember(Member member);
	
}
