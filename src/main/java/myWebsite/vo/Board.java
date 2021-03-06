package myWebsite.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	// board 테이블과 매칭되는 모든 데이터
	private int boardId;
	private int memberId;
	private String title;
	private String body;
	private String hashtag;
	private String regDate;
	private String updateDate;
	private int hitCnt;
	private int delStatus;
	
}
