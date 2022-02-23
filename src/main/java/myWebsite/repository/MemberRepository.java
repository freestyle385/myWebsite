package myWebsite.repository;

import org.apache.ibatis.annotations.Mapper;

import myWebsite.dto.ForJoinMember;
import myWebsite.vo.Member;

@Mapper
public interface MemberRepository {

	public void doMemberSignUp(ForJoinMember member) throws Exception;

	public Member getMemberInfoByLoginId(String loginId) throws Exception;

	public int loginIdChk(String loginId) throws Exception;

	public int loginPwChk(String loginId, String loginPw) throws Exception;
}
