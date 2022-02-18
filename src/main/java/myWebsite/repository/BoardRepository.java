package myWebsite.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import myWebsite.dto.ForWriteBoard;
import myWebsite.vo.Board;

@Mapper
public interface BoardRepository {
	
	ArrayList<Board> getBoardList(@Param("hashtagArr") List<String> hashtagArr, @Param("searchKeyword") String searchKeyword) throws Exception;

	String getAllHashtag() throws Exception;

	void doBoardWrite(ForWriteBoard board) throws Exception;

	Integer getLastInsertId() throws Exception;

	Board getBoardDetail(@Param("boardId") int boardId) throws Exception;

	void updateHitCnt(int boardId) throws Exception;
}
