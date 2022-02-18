package myWebsite.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import myWebsite.dto.ForWriteComment;
import myWebsite.repository.CommentRepository;
import myWebsite.vo.Comment;

@Service
public class CommentService {
	CommentRepository commentRepository;

	public CommentService(CommentRepository commentRepository) {
		this.commentRepository = commentRepository;
	}

	public ArrayList<Comment> getCommentList(int boardId) throws Exception {
		
		return commentRepository.getCommentList(boardId);
	}

	public int doCommentWrite(ForWriteComment comment) throws Exception {

		return commentRepository.doCommentWrite(comment);
	}

	public int doCommentModify(int commId, String commBody) throws Exception {
		
		return commentRepository.doCommentModify(commId, commBody);
	}
	
	
}
