package myWebsite.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import myWebsite.dto.ForWriteComment;
import myWebsite.repository.CommentRepository;
import myWebsite.vo.Comment;

@Service
public class CommentService {
	private CommentRepository commentRepository;

	public CommentService(CommentRepository commentRepository) {
		this.commentRepository = commentRepository;
	}
	
	public ArrayList<Comment> getCommentList(int boardId) throws Exception {
		
		return commentRepository.getCommentList(boardId);
	}
	
	public int getCommentsCount(int boardId) throws Exception {
		
		return commentRepository.getCommentsCount(boardId);
	}

	public int doCommentWrite(ForWriteComment comment) throws Exception {
		
		return commentRepository.doCommentWrite(comment);
	}

	public int doCommentModify(String commBody, int commId) throws Exception {
				
		return commentRepository.doCommentModify(commBody, commId);
	}

	public int doCommentDelete(int commId) {
		
		return commentRepository.doCommentDelete(commId);
	}
	
	
}
