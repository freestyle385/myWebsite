package myWebsite.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	// member 테이블과 매칭되는 모든 데이터
	private int memberId;
	private String loginId;
	private String loginPw;
	private String memberName;
	private int authLv;
	private String regDate;
	private int delStatus;
}
