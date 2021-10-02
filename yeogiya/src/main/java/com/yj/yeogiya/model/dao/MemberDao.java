package com.yj.yeogiya.model.dao;

import java.util.List;

import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardPlace;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Comment;
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
	public int checkDupEmail(String user_email);
	public Member login(Member member);
	public Member selectMember(String user_id);
	public Member findId(Member member);
	
	//프로필 글목록
	public List<Board> selectBoardList(BoardSearch bs);
	public int getBoardListCount(BoardSearch bs);
	//프로필 댓글목록
	public List<Comment> selectCommentList(BoardSearch bs);
	public int getCommentListCount(BoardSearch bs);
	//프로필 글목록
	public List<Board> selectBookmarkList(BoardSearch bs);
	public int getBookmarkListCount(BoardSearch bs);
	//************UPDATE************
	
	
	
	//************DELETE************
	public int deleteBoardList(List<Board> boardList);
	public int deleteCommentList(List<Comment> commentList);
	public int deleteBookmarkList(List<Board> bookmarkList);
}
