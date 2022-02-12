package myWebsite.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ForWriteComment {
	// 댓글 생성 시 필요한 데이터
	private int boardId;
	private int memberId;
	private String commBody;
}
