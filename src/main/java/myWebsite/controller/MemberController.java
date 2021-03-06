package myWebsite.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import myWebsite.dto.ForJoinMember;
import myWebsite.dto.ResultData;
import myWebsite.service.MemberService;
import myWebsite.util.Util;

@Controller
public class MemberController {
	private MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping("/member/signUp")
	public String showMemberSignUp() throws Exception {

		return "member/signUp";
	}

	@RequestMapping("/member/doSignUp")
	@ResponseBody
	public String doMemberSignUp(@ModelAttribute ForJoinMember member) throws Exception {

		ResultData<String> signUpRd = memberService.doMemberSignUp(member);

		if (signUpRd.isFail()) {
			return Util.jsHistoryBack(signUpRd.getMsg());
		}

		return Util.jsReplace(signUpRd.getMsg(), "/");
	}
	
	// 이메일 중복 체크
	@RequestMapping("/member/emailDuplChk")
	@ResponseBody
	public int emailDuplChk(String loginId) throws Exception {
		int result = memberService.loginIdChk(loginId);
		
		return result;
	}

	// 이메일에서 인증 클릭하면 나오는 경로
	@RequestMapping(value = "/member/emailAuth", method = RequestMethod.GET)
	public String emailAuth(String email, String key, Model md, HttpServletResponse resp) throws Exception {
		
		// authKey가 일치하지 않으면 0, 일치하면 1 
		if (memberService.memberAuthKeyChk(email, key) == 0) {
			Util.javaHistoryBack(resp, "해당 이메일로는 계정을 인증할 수 없습니다.");
			return null;
		}
		
		// authStatus 권한 상태 1로 변경
		memberService.updateAuthStatus(email);

		md.addAttribute("loginId", email);

		return "/member/emailConfirm";
	}

	@RequestMapping("/member/login")
	public String showMemberLogin() throws Exception {

		return "/member/login";
	}

	@RequestMapping("/member/doLogin")
	@ResponseBody
	public String doMemberLogin(@ModelAttribute ForJoinMember member) throws Exception {

		ResultData<String> loginRd = memberService.doMemberLogin(member);

		if (loginRd.isFail()) {
			return Util.jsHistoryBack(loginRd.getMsg());
		}

		return Util.jsReplace(loginRd.getMsg(), "/");

	}

	@RequestMapping("/member/doLogout")
	@ResponseBody
	public String doMemberLogout() throws Exception {
		
		ResultData<String> logoutRd = memberService.doMemberLogout();
		
		if (logoutRd.isFail()) {
			return Util.jsHistoryBack(logoutRd.getMsg());
		}
		
		return Util.jsReplace(logoutRd.getMsg(), "/");
	}
	
	@RequestMapping("/member/withdraw")
	public String showMemberWithdrawal() throws Exception {
		
		return "/member/withdraw";
	}
	
	@RequestMapping("/member/doWithdrawal")
	@ResponseBody
	public String doMemberWithdrawal(@ModelAttribute ForJoinMember member) throws Exception {
		
		ResultData<String> withdrawRd = memberService.doMemberWithdrawal(member);
		
		if (withdrawRd.isFail()) {
			return Util.jsHistoryBack(withdrawRd.getMsg());
		}
		
		return Util.jsReplace(withdrawRd.getMsg(), "/");
	}
	
	@RequestMapping("/member/forgotLoginPw")
	public String forgotLoginPw() throws Exception {

		return "/member/forgotLoginPw";
	}
	
	@RequestMapping("/member/findLoginPw")
	@ResponseBody
	public String findLoginPw(String loginId) throws Exception {

		ResultData<String> findRd = memberService.findLoginPw(loginId);

		if (findRd.isFail()) {
			return Util.jsHistoryBack(findRd.getMsg());
		}

		return Util.jsReplace(findRd.getMsg(), "/");
	}
	
	@RequestMapping("/member/changeLoginPw")
	public String changeLoginPw() throws Exception {

		return "/member/changeLoginPw";
	}
	
	@RequestMapping("/member/updateLoginPw")
	@ResponseBody
	public String updateLoginPw(@ModelAttribute ForJoinMember member, String newLoginPw) throws Exception {

		ResultData<String> updateRd = memberService.updateLoginPw(member, newLoginPw);

		if (updateRd.isFail()) {
			return Util.jsHistoryBack(updateRd.getMsg());
		}

		return Util.jsReplace(updateRd.getMsg(), "/");
	}
	
	@RequestMapping("/member/needAuth")
	public String needAuth() throws Exception {

		return "/member/needAuth";
	}
	
	@RequestMapping("/member/resendEmail")
	@ResponseBody
	public String resendEmail(String loginId) throws Exception {

		ResultData<String> resendRd = memberService.sendAuthEmail(loginId);

		if (resendRd.isFail()) {
			return Util.jsHistoryBack(resendRd.getMsg());
		}

		return Util.jsReplace(resendRd.getMsg(), "/");
	}
	
}
