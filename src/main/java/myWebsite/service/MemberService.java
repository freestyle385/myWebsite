package myWebsite.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import myWebsite.dto.ForJoinMember;
import myWebsite.dto.ResultData;
import myWebsite.repository.MemberRepository;
import myWebsite.util.MailHandler;
import myWebsite.util.Sha256;
import myWebsite.util.Util;
import myWebsite.vo.LoginStatus;
import myWebsite.vo.Member;
import myWebsite.vo.TempKey;

@Service
public class MemberService {
	@Autowired
	private JavaMailSender mailSender;

	private MemberRepository memberRepository;
	private LoginStatus loginStatus;

	public MemberService(MemberRepository memberRepository, LoginStatus loginStatus) {
		this.memberRepository = memberRepository;
		this.loginStatus = loginStatus;
	}

	public ResultData<String> doMemberSignUp(ForJoinMember member) throws Exception {
		
		// 사용될 닉네임은 이메일의 일부로 지정
		String memberName = member.getLoginId().substring(0, member.getLoginId().indexOf("@"));
		// dto에 비어있는 memberName을 채워줌
		member.setMemberName(memberName);

		// 비밀번호를 암호화하여 다시 저장
		String ecryptPw = Sha256.encrypt(member.getLoginPw());
		member.setLoginPw(ecryptPw);

		// 회원 정보 저장
		memberRepository.doMemberSignUp(member);

		// 인증코드 생성
		String key = new TempKey().getKey(10, false);

		// 인증코드 DB에 저장
		memberRepository.createAuthKey(member.getLoginId(), key);

		// 메일 발송
		MailHandler sendMail = new MailHandler(mailSender);

		sendMail.setSubject("[HYS's Portfolio 회원가입 이메일 인증입니다.]");
		sendMail.setText(new StringBuffer().append("<h1>HYS's Portfolio 이메일 인증 입니다</h1>")
				.append("<a href='http://localhost:8080/member/emailAuth?email=").append(member.getLoginId())
				.append("&key=").append(key).append("' target='_blank'>인증 완료를 위해 여기를 눌러주세요</a>").toString());
		sendMail.setFrom("freestyle4583@gmail.com", "HYS's Portfolio");
		sendMail.setTo(member.getLoginId());
		sendMail.send();

		return new ResultData<String>("S", String.format("%s님, 회원가입이 완료되었습니다. 인증을 위해 이메일을 확인해주세요.", memberName));
	}

	public void updateAuthstatus(String loginId) throws Exception {
		memberRepository.updateAuthstatus(loginId);
	}

	public ResultData<String> doMemberLogin(ForJoinMember member) throws Exception {

		String memberName = member.getLoginId().substring(0, member.getLoginId().indexOf("@"));
		member.setMemberName(memberName);

		ArrayList<String> nullField = Util.fieldChk(member);

		if (nullField.size() > 0) {
			// 입력되지 않은 값 배열
			return new ResultData<String>("F", "입력되지 않은 값이 있습니다.", String.join(",", nullField));
		}

		if (loginIdChk(member.getLoginId()) == 0) {
			return new ResultData<String>("F", String.format("%s 계정은 존재하지 않습니다.", member.getLoginId()));
		}

		if (loginPwChk(member) == 0) {
			return new ResultData<String>("F", "비밀번호가 일치하지 않습니다.");
		}

		Member loginedMember = memberRepository.getMemberInfoByLoginId(member.getLoginId());
		loginStatus.login(loginedMember);

		return new ResultData<String>("S", String.format("%s님, 환영합니다!", memberName));
	}

	public ResultData<String> doMemberLogout() throws Exception {

		String memberName = loginStatus.getLoginedMember().getMemberName();

		loginStatus.logout();

		return new ResultData<String>("S", String.format("%s님, 정상적으로 로그아웃되었습니다.", memberName));
	}

	public int loginIdChk(String loginId) throws Exception {
		// DB에 같은 아이디가 존재하는지 체크
		int result = memberRepository.loginIdChk(loginId);

		return result;
	}

	private int loginPwChk(ForJoinMember member) throws Exception {

		// 비밀번호를 암호화
		String ecryptPw = Sha256.encrypt(member.getLoginPw());

		// 입력된 비밀번호가 DB에 저장된 비밀번호와 일치하는지 체크
		int result = memberRepository.loginPwChk(member.getLoginId(), ecryptPw);

		return result;
	}

}
