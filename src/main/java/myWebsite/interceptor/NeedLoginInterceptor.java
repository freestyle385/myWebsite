package myWebsite.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import myWebsite.util.Util;
import myWebsite.vo.LoginStatus;

@Component
public class NeedLoginInterceptor implements HandlerInterceptor{
	private LoginStatus loginStatus;

	public NeedLoginInterceptor(LoginStatus loginStatus) {
		this.loginStatus = loginStatus;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		
		if(!loginStatus.isLogined()) {
			Util.javaHistoryBack(resp, "로그인 후 이용해주세요.");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
