package com.yj.yeogiya;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yj.yeogiya.test.model.dao.TestDao;
import com.yj.yeogiya.test.model.vo.TestVo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Value("#{property['file.rootPath']}") 
	private String rootPath;
	
	@Inject
	private TestDao testDao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("rootPath", rootPath );
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("rootPath", rootPath );
		
		return "board/boardInsert";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(TestVo testVo) {
		testDao.insert(testVo);
		
		return "home";
	}
	
	@RequestMapping(value = "/test/{test_no}", method = RequestMethod.GET)
	public String report(Model model, @PathVariable("test_no") int test_no) {
		TestVo testVo = testDao.select(test_no);
		System.out.println(testVo);
		model.addAttribute("testVo", testVo);
		return "home";
	}
	
}
