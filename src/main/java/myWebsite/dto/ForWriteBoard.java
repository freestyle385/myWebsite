package myWebsite.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ForWriteBoard {
	// 게시물 생성 시 필요한 데이터
	private Integer memberId;
	private String title;
	private String body;
	private String hashtag = ""; // default value
}
