package myWebsite.repository;

import org.apache.ibatis.annotations.Mapper;

import myWebsite.dto.ForJoinMember;
import myWebsite.vo.Member;

@Mapper
public interface MemberRepository {

	public void doMemberSignUp(ForJoinMember member) throws Exception;

	// DB에 authkey저장
	public void createAuthKey(String loginId, String authKey) throws Exception;

	// 이메일 인증 후 authstatus 1로 변경
	public void updateAuthStatus(String loginId) throws Exception;

	public Member getMemberInfoByLoginId(String loginId) throws Exception;

	public int loginIdChk(String loginId) throws Exception;

	public int loginPwChk(String loginId, String loginPw) throws Exception;

	public void doMemberWithdrawal(int memberId) throws Exception;

	public void updateLoginPw(String loginId, String ecryptPw) throws Exception;

	public int authStatusChk(String loginId) throws Exception;

	public int memberAuthKeyChk(String loginId, String authKey) throws Exception;
}
