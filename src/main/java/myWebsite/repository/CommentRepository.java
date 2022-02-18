package myWebsite.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import myWebsite.dto.ForWriteComment;
import myWebsite.vo.Comment;

@Mapper
public interface CommentRepository {
	
	ArrayList<Comment> getCommentList(@Param("boardId") int boardId) throws Exception;

	int doCommentWrite(ForWriteComment comment) throws Exception;

	int doCommentModify(@Param("commId") int commId, @Param("commBody") String commBody) throws Exception;
}
