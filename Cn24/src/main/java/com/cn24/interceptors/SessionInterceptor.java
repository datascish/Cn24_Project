package com.cn24.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cn24.member.constants.Member;

public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	private final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {
		
		String contextPath = request.getContextPath();
			
		if (request.getSession().getAttribute(Member.USER) == null) {
			logger.info(request.getRequestURI() + " 접근 사절!!! ");
			response.sendRedirect(contextPath + "/login");
			return false; // 원래 가려던 controller로 가지 않고 browser에 다시 돌려주기 위함
		}
		return true; // controller는 return 값이 true 일 때만 요청에 응함
	}
}
