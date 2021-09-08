package com.yj.yeogiya.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yj.yeogiya.model.service.BoardService;
import com.yj.yeogiya.model.service.TestService;
import com.yj.yeogiya.model.vo.Sort;
import com.yj.yeogiya.model.vo.TestVo;

@RequestMapping("/{sortLocalPEngName}")
@Controller
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	@ModelAttribute("sortLocalP")
	public Sort sortLocalP(@PathVariable("sortLocalPEngName") String sortLocalPEngName) {
		return boardService.selectSortLocalPByEngName(sortLocalPEngName);
	}
	@Inject
	private BoardService boardService;
	@Inject
	private TestService testService;
	
	@RequestMapping(value = "/test")
	public String test() throws Exception {
		System.out.println();
		return "board/boardInsert";
	}
	

	@RequestMapping(value = "/testRun", method = RequestMethod.POST)
	public String testRun(TestVo testVo) throws Exception {
		System.out.println(testVo);
		int test_no = testService.insertTest(testVo);
//		return "redirect:content/" + test_no;
		return "board/boardInsert";
	}
	@RequestMapping(value = "/update/{test_no}")
	public String update(Model model, @PathVariable("test_no") int test_no) throws Exception {
		TestVo test = testService.selectTest(test_no);
		model.addAttribute("test", test);
		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "/updateRun", method = RequestMethod.POST)
	public String updateRun(TestVo testVo) throws Exception {
		System.out.println("======update=========");
		System.out.println(testVo);
		testService.updateTest(testVo);
		return "redirect:content/" + testVo.getTest_no();
	}
	@RequestMapping(value = "/content/{test_no}")
	public String content(Model model, @PathVariable("test_no") int test_no) {
		TestVo test = testService.selectTest(test_no);
		model.addAttribute("test", test);
		return "board/boardView";
	}
}
