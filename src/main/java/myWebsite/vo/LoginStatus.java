package myWebsite.vo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import lombok.Getter;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class LoginStatus {
	// 로그인 여부와 로그인 중인 아이디를 가져오는 클래스
	@Getter
	private boolean isLogined;
	@Getter
	private int loginedMemberId;
	@Getter
	private Member loginedMember;
	@Getter
	private int authLv;

	private HttpServletRequest req;
	private HttpSession session;

	public LoginStatus(HttpServletRequest req) {

		this.session = req.getSession();
		this.req = req;
		
		Member member = (Member) session.getAttribute("loginedMember");
		
		if (member != null) {
			this.isLogined = true;
			this.loginedMember = member;
			this.loginedMemberId = loginedMember.getMemberId();
			this.authLv = loginedMember.getAuthLv();
		}

		this.req.setAttribute("loginStatus", this);

	}
	
	public void login(Member loginedMember) {
		session.setAttribute("loginedMember", loginedMember);
	}

	public void logout() {
		session.invalidate();

	}

	public void initOnBeforeActionInterceptor() {
		// BeforeAction 인터셉터 실행 시 해당 메소드를 통해 LoginStatus 최신화
	}
}
