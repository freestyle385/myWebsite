package myWebsite.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import myWebsite.dto.ForWriteBoard;
import myWebsite.vo.Board;

@Mapper
public interface BoardRepository {
	
	ArrayList<Board> getBoardList(@Param("hashtagArr") List<String> hashtagArr, @Param("searchKeyword") String searchKeyword);

	String getAllHashtag();

	void doBoardWrite(ForWriteBoard board);

	Integer getLastInsertId();

	Board getBoardDetail(@Param("boardId") int boardId);

	void updateHitCnt(int boardId);
}
