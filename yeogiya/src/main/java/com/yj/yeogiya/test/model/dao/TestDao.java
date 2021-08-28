package com.yj.yeogiya.test.model.dao;

import com.yj.yeogiya.test.model.vo.TestVo;

public interface TestDao {

	public void insert(TestVo testVo);
	public TestVo select(int test_no);
}
