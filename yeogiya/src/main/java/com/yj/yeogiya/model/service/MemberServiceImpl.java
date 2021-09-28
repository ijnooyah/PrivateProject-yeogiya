package com.yj.yeogiya.model.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.MemberDao;
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
	public Member selectMember(String user_id, boolean all) {
		Member member = memberDao.selectMember(user_id);
		if (!all) {
			return new Member(member.getUser_id(), member.getUser_email());
		}
		return member;
	}

	@Override
	public Member findId(Member member) {
		return memberDao.findId(member);
	}


}
