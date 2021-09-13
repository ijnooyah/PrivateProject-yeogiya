package com.yj.yeogiya.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yj.yeogiya.model.service.CommentService;
import com.yj.yeogiya.model.vo.Comment;


@RestController
@RequestMapping("/comment")
public class CommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Inject
	private CommentService commentService;
	
	//댓글 목록
	@RequestMapping(value="list", method=RequestMethod.GET)
	public List<Comment> list(@RequestParam int board_no) throws Exception {
		logger.info("list");
		List<Comment> list = commentService.selectCommentList(board_no);
		System.out.println(list);
		return list;
	}
	
	//댓글 조회
	@RequestMapping(value="select", method=RequestMethod.GET)
	public Comment select(@RequestParam int c_no) throws Exception {
		logger.info("select");
		Comment cmt = commentService.selectComment(c_no);
		return cmt;
	}
	
	//댓글 쓰기 
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertComment(@RequestBody Comment cmt) throws Exception {
		logger.info("insert");
		System.out.println(cmt);
		commentService.insertComment(cmt);
		return "success";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@RequestBody Comment cmt) throws Exception {
		logger.info("update");
		System.out.println(cmt);
		commentService.updateComment(cmt);
		return "success";
	}
		
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public int delete(@RequestBody Comment cmt) throws Exception {
		logger.info("delete");
		System.out.println(cmt);
		return commentService.deleteComment(cmt);
	}
}
