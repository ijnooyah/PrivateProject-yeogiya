package com.yj.yeogiya.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.MemberDao;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.Comment;
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
	public boolean checkDupNick(String user_nick, String orgUserNick) {
		int result = memberDao.checkDupNick(user_nick);
		
		System.out.println("orgUserNick:" + orgUserNick); 
		System.out.println("user_nick:" + user_nick); 
		if(orgUserNick != null) { //not signUp
			if(orgUserNick.equals(user_nick)) {
				return false;
			} 
		} 
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
				int boardCnt = memberDao.getBoardListCount(bs);
				int cmtCnt = memberDao.getCommentListCount(bs);
				member.setBoardCnt(boardCnt);
				member.setCmtCnt(cmtCnt);
				if(bs.getTab().equals("board")) {
					bs.setCount(boardCnt); // 페이징관련된 필드 세팅 
					List<Board> boardList = memberDao.selectBoardList(bs);
					member.setBoardList(boardList);
				} else if(bs.getTab().equals("comment")) {
					bs.setCount(cmtCnt); // 페이징관련된 필드 세팅 
					List<Comment> commentList = memberDao.selectCommentList(bs);
					member.setCommentList(commentList);
				} else {
					int count = memberDao.getBookmarkListCount(bs);
					bs.setCount(count); // 페이징관련된 필드 세팅 
					List<Board> bookmarkList = memberDao.selectBookmarkList(bs);
					member.setBoardList(bookmarkList);
				}
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
	public int deleteList(String tab, List<String> chArr, String user_id) {
		List<Board> boardList = new ArrayList<>();
		List<Comment> commentList = new ArrayList<Comment>();
		if(tab.equals("board")) {
			  for(String i : chArr) {   
			   Board board = new Board();
			   board.setBoard_no(Integer.parseInt(i));
			   board.setUser_id(user_id);
			   boardList.add(board);
			  }   
			  System.out.println(boardList);
			  return memberDao.deleteBoardList(boardList);
		} else if(tab.equals("comment")) {
			for(String i : chArr) {   
			   Comment comment = new Comment();
			   comment.setC_no(Integer.parseInt(i));
			   comment.setUser_id(user_id);
			   commentList.add(comment);
			  }   
			  System.out.println(commentList);
			  return memberDao.deleteCommentList(commentList);
		} else {
			for(String i : chArr) {   
			   Board bookmark = new Board();
			   bookmark.setBoard_no(Integer.parseInt(i));
			   bookmark.setUser_id(user_id);
			   boardList.add(bookmark);
			  }   
			  System.out.println(boardList);
			  return memberDao.deleteBookmarkList(boardList);
		}
		
	}

	@Override
	public int updateProfile(Member member) {
		return memberDao.updateProfile(member);
	}

	@Override
	public int updateInfo(Member member) {
		System.out.println("service");
		System.out.println(member);
		return memberDao.updateInfo(member);
	}

	@Override
	public int updateEmail(Member member) {
		return memberDao.updateEmail(member);
	}

	@Override
	public int deleteMember(Member member) {
		return memberDao.deleteMember(member);
	}

	@Override
	public int updatePw(Member member) {
		return memberDao.updatePw(member);
	}



}
