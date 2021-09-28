package com.yj.yeogiya.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yj.yeogiya.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		System.out.println("인터셉터");
		String contextPath = request.getContextPath();
		
		String uri = request.getRequestURI();
		uri = uri.substring(contextPath.length());
		String queryString = request.getQueryString();
		String requestPath = null;
		String regex = "(.*)\\/(insert|update|delete|comment)";
		if(queryString == null) {
			requestPath = uri;
		} else {
			requestPath = uri + "?" + queryString; 
		}
		if (requestPath.matches(regex)) {
			System.out.println("정규식 맞음");
			response.sendRedirect(contextPath + "/member/login");
		} else {
			session.setAttribute("requestPath", requestPath);
		}
				
		return true; // 요청 처리를 계속함
	}	
}