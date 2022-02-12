package myWebsite.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ForUploadImg {
	// img 업로드 시 필요한 데이터
	private int boardId;
	private String originalName;
	private String storePath;
	private int size;
}
