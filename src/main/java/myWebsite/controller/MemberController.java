package myWebsite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myWebsite.dto.ForJoinMember;
import myWebsite.dto.ResultData;
import myWebsite.service.MemberService;
import myWebsite.util.Util;

@Controller
public class MemberController {
	private MemberService memberService;
	
	@Autowired
	public MemberController (MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping("/member/signUp")
	public String showMemberJoin() throws Exception {

		return "member/join";
	}
	
	@RequestMapping("/member/doSignUp")
	@ResponseBody
	public String doMemberJoin(@ModelAttribute ForJoinMember member) throws Exception {
		
		ResultData<String> signUpRd = memberService.doMemberSignUp(member);
		
		if(signUpRd.isFail()) {
			return Util.jsHistoryBack(signUpRd.getMsg());
		}
		
		return Util.jsReplace(signUpRd.getMsg(), "/board/list");
	}
	
	@RequestMapping("/member/login")
	public String showMemberLogin() throws Exception {
		
		return "/member/login";
	}
	
	@RequestMapping("/member/doLogin")
	@ResponseBody
	public String doMemberLogin(@ModelAttribute ForJoinMember member) throws Exception {
		
		ResultData<String> loginRd = memberService.doMemberLogin(member);
		
		if(loginRd.isFail()) {
			return Util.jsHistoryBack(loginRd.getMsg());
		}
		
		return Util.jsReplace(loginRd.getMsg(), "/board/list");
		
	}
	
	@RequestMapping("/member/doLogout")
	@ResponseBody
	public String doMemberLogout() throws Exception {
		ResultData<String> logoutRd = memberService.doMemberLogout();
		return Util.jsReplace(logoutRd.getMsg(), "/board/list");
	}
}
