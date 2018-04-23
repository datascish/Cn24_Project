package com.cn24.interceptors;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	private Map<String, Integer> failIdMap; 	
	
	public LoginCheckInterceptor() {
		failIdMap = new HashMap<String, Integer>();
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {
		
		if (request.getMethod().equalsIgnoreCase("post")) { // 이 코드가 없으면 null로 전달됨
			String userId = request.getParameter("email");
			String password = request.getParameter("password");
			
		}
		return true;
	}

	
}
