package myWebsite.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	// comment 테이블과 매칭되는 모든 데이터
	private int commId;
	private int boardId;
	private int memberId;
	private String commBody;
	private String regDate;
	private String updateDate;
	private int delStatus;
}
