package com.yj.yeogiya.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.TestDao;
import com.yj.yeogiya.model.vo.TestImg;
import com.yj.yeogiya.model.vo.TestVo;


@Service
public class TestServiceImpl implements TestService {
	
	@Inject
	private TestDao testDao;
	
	@Override
	public int insertTest(TestVo testVo) {
		
		int test_no = testDao.insert(testVo);
		List<TestImg> imgs = testVo.getImgs();
		for(TestImg img : imgs) {
			img.setTest_no(test_no);
		}
		int result = testDao.insertImg(imgs);
		
		return result;
	}

	@Override
	public TestVo selectTest(int test_no) {
		TestVo test = testDao.select(test_no);
		List<TestImg> imgs = testDao.selectImg(test_no);
		test.setImgs(imgs);
		return test;
	}

}
