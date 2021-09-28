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
	public boolean checkDupNick(String user_nick);
	//로그인
	public Member loginRun(Member member);
	public Member selectMember(String user_id, boolean all);
	public Member findId(Member member);
	
//************UPDATE************
	
	
	
//************DELETE************
	
	
}
