package com.yj.yeogiya.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.service.TestService;


@Controller
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Inject
	private BoardService boardService;
	@Inject
	private TestService testService;
	
	@RequestMapping(value = "/test")
	public String test() throws Exception {
		System.out.println();
		return "mypage/mypage";
	}
	
	
}
