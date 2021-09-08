package com.yj.yeogiya.model.dao;

import java.util.List;

import com.yj.yeogiya.model.vo.TestImg;
import com.yj.yeogiya.model.vo.TestVo;


public interface TestDao {

	public int insert(TestVo testVo);
	public TestVo select(int test_no);
	public int insertImg (List<TestImg> imgs);
	public List<TestImg> selectImg (int test_no);
}
