package com.yj.yeogiya.model.service;

import com.yj.yeogiya.model.vo.TestVo;

public interface TestService {

	public int insertTest(TestVo testVo);
	public TestVo selectTest(int test_no);
	public int updateTest(TestVo testVo);
}
