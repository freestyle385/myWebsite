package myWebsite.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ForJoinMember {
	// 회원 가입 시 필요한 데이터
	private String loginId;
	private String loginPw;
}
