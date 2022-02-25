package myWebsite.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import myWebsite.vo.LoginStatus;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {
	private LoginStatus loginStatus;

	public BeforeActionInterceptor(LoginStatus loginStatus) {
		this.loginStatus = loginStatus;
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {

		loginStatus.initOnBeforeActionInterceptor();
		// BeforeAction 인터셉터 실행 시마다 loginStatus 호출

		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
