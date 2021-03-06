package com.yj.yeogiya.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.BoardDao;
import com.yj.yeogiya.model.dao.CommentDao;
import com.yj.yeogiya.model.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Inject
	private CommentDao commentDao;
	@Inject
	private BoardDao boardDao;
	
	@Override
	public void insertComment(Comment cmt) {
		if (cmt.getParent_c_no() == 0) {
//			System.out.println("일반댓글");
			commentDao.insertComment(cmt);
		} else {
//			System.out.println("답댓글");
			int result = commentDao.insertRecomment(cmt);
			if (result == 1) {
				commentDao.updateChildCnt(cmt.getParent_c_no(), 1);
				if(cmt.getParent_c_no() != cmt.getRe_group()) { // 답댓글의 답댓글들 
					commentDao.updateChildCnt(cmt.getRe_group(), 1);
				}
			}
		}
		boardDao.updateCmtCnt(cmt.getB_no(), 1);
	}

	@Override
	public List<Comment> selectCommentList(int board_no) {
		List<Comment> cmtList = commentDao.selectCommentList(board_no);
		
		for(int i = 0; i < cmtList.size(); i++) {
			Comment cmt = cmtList.get(i);
			if(cmt.getIs_del().equals("Y")) {
				cmtList.remove(i);
				cmtList.add(i, new Comment("Y"));
			} else {
				cmt.setC_content(cmt.getC_content().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
			}
		}
		return cmtList;
	}

	@Override
	public void updateComment(Comment cmt) {
		commentDao.updateComment(cmt);
	}

	@Override
	public int deleteComment(Comment cmt) {
		System.out.println("cmt:" + cmt);
		int result = commentDao.deleteComment(cmt);
		if(result == 1) {
			boardDao.updateCmtCnt(cmt.getB_no(), -1);
			if (cmt.getParent_c_no() != 0) {
				System.out.println("답댓글 -1");
				commentDao.updateChildCnt(cmt.getParent_c_no(), -1);
				if(cmt.getParent_c_no() != cmt.getRe_group()) { // 답댓글의 답댓글들 
					commentDao.updateChildCnt(cmt.getRe_group(), -1);
				}
			} 
		}
		
		return result;
	}

	@Override
	public Comment selectComment(int c_no) {
		return commentDao.selectComment(c_no);
	}

}
