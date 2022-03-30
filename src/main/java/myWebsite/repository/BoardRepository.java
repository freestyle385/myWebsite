package myWebsite.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import myWebsite.dto.ForWriteBoard;
import myWebsite.vo.Board;

@Mapper
public interface BoardRepository {
	
	ArrayList<Board> getBoardList(@Param("hashtag") String hashtag, @Param("searchKeyword") String searchKeyword) throws Exception;

	String getAllHashtag() throws Exception;

	void doBoardWrite(ForWriteBoard board) throws Exception;

	Integer getLastInsertId() throws Exception;

	Board getBoardDetail(@Param("boardId") int boardId) throws Exception;

	void updateHitCnt(@Param("boardId") int boardId) throws Exception;

	void doBoardModify(ForWriteBoard board, @Param("boardId") int boardId) throws Exception;

	void doBoardDelete(@Param("boardId") int boardId) throws Exception;

	int getMemberIdByBoardId(@Param("boardId") int boardId) throws Exception;
}
