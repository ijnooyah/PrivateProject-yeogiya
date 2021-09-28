package com.yj.yeogiya.model.dao;

import java.util.List;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardPlace;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Member;
import com.yj.yeogiya.model.vo.Sort;


public interface MemberDao {

	//************CREATE************
	//회원가입
	public int insertMember(Member member);

	//************READ************
	//아이디 중복체크
	public int checkDupId(String user_id);
	//닉네임 중복체크
	public int checkDupNick(String user_nick);
	//,
	public Member login(Member member);
	
	//************UPDATE************
	
	
	
	//************DELETE************
	
}
