package com.yj.yeogiya.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yj.yeogiya.model.dao.TestDao;
import com.yj.yeogiya.model.vo.Tag;
import com.yj.yeogiya.model.vo.TestImg;
import com.yj.yeogiya.model.vo.TestTag;
import com.yj.yeogiya.model.vo.TestVo;


@Service
public class TestServiceImpl implements TestService {
	
	@Inject
	private TestDao testDao;
	
	@Override
	public int insertTest(TestVo testVo) {
		
		int test_no = testDao.insert(testVo);
//		List<TestImg> imgs = testVo.getImgs();
//		for(TestImg img : imgs) {
//			img.setTest_no(test_no);
//		}
//		int result = testDao.insertImg(imgs);
		
		// tag 테이블 insert
		String tag = testVo.getTag(); // "콤마로 연결되어 있는 상태"
		String[] tags = tag.split(",");
		List<TestTag> tagList = new ArrayList<TestTag>();
		for (String splittedTag : tags) {
			TestTag tagItem = new TestTag(splittedTag);
			tagItem.setTest_no(test_no);
			tagList.add(tagItem);
		}
		testDao.insertTag(tagList);
		
		testDao.insertBoardTag(tagList);
		return test_no;
	}

	@Override
	public TestVo selectTest(int test_no) {
		TestVo test = testDao.select(test_no);
//		List<TestImg> imgs = testDao.selectImg(test_no);
//		test.setImgs(imgs);
		return test;
	}

	@Override
	public int updateTest(TestVo testVo) {
		return testDao.updateTest(testVo);
	}

}
