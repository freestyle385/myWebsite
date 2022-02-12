package myWebsite.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImgFile {
	// imgFile 테이블과 매칭되는 모든 데이터
	private int imgId;
	private int boardId;
	private String originalName;
	private String storePath;
	private int size;
	private String regDate;
}
