package com.yj.yeogiya.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.MemberDao;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;
	@Override
	public boolean checkDupId(String user_id) {
		int result = memberDao.checkDupId(user_id);
		if (result != 0) { // 중복
			return true;
		}
		return false;
	}
	
	@Override
	public boolean checkDupNick(String user_nick) {
		int result = memberDao.checkDupNick(user_nick);
		if (result != 0) { // 중복
			return true;
		}
		return false;
	}

	@Override
	public int join(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public Member loginRun(Member member) {
		return memberDao.login(member);
	}

	@Override
	public Member selectMember(String user_id, BoardSearch bs, boolean getAll) {
		Member member = memberDao.selectMember(user_id);
		
		if (member != null) {
			
			if (bs == null) { //탈퇴회원 조회 x
				if(member.getIs_quit().equals("Y")) {
					return null;
				} else if(!getAll) {
					return new Member(member.getUser_id(), member.getUser_email());
				}
			} else {
				int count = memberDao.getBoardListCount(bs);
				bs.setCount(count); // 페이징관련된 필드 세팅 
				List<Board> boardList = memberDao.selectBoardList(bs);
				member.setBoardList(boardList);
			}
			
		}
		return member;
	}

	@Override
	public String findId(Member member) {
		Member m = memberDao.findId(member);
		String id = null;
		if (m != null) {
			String user_id = m.getUser_id();
			id = user_id.substring(0, user_id.length() - 2) + "**";
		}
		return id;
	}

	@Override
	public boolean checkDupEmail(String user_email) {
		int result = memberDao.checkDupEmail(user_email);
		if (result != 0) { // 중복
			return true;
		}
		return false;
	}

	@Override
	public int deleteBoardList(List<Board> boardList) {
		return memberDao.deleteBoardList(boardList);
	}


}
