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
		String regex = "(.*)\\/(insert|update|delete)(.*)";
		if(queryString == null) {
			requestPath = uri;
		} else {
			requestPath = uri + "?" + queryString; 
		}
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(loginMember);
		System.out.println(requestPath);
		if(loginMember == null) {
			if (requestPath.matches(regex)) {
				System.out.println("정규식 맞음");
				session.setAttribute("requestPath", requestPath);
				response.sendRedirect(contextPath + "/member/login");
				return false;
			} 
		} 
		
		
		return true; // 요청 처리를 계속함
	}	
	
	
	private boolean isAjaxRequest(HttpServletRequest request) {
		
		String header = request.getHeader("x-requested-with");
		if ("XMLHttpRequest".contentEquals(header))	{
			return true;
		} else {
			return false;
		}
	}
}