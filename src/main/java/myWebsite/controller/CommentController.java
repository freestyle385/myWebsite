package myWebsite.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import myWebsite.dto.ForWriteComment;
import myWebsite.service.CommentService;
import myWebsite.vo.Comment;

@Controller
public class CommentController {
	CommentService commentService;

	public CommentController(CommentService commentService) {
		this.commentService = commentService;
	}

	@RequestMapping("/comment/list")
	@ResponseBody
	private ArrayList<Comment> showCommentList(@RequestParam("boardId") int boardId) throws Exception {
		
		return commentService.getCommentList(boardId);
	}
	
	@RequestMapping("/comment/getCommentsCount")
	@ResponseBody
	private int showCommentsCount(@RequestParam("boardId") int boardId) throws Exception {
		
		return commentService.getCommentsCount(boardId);
	}
	
	@RequestMapping("/comment/doWrite")
	@ResponseBody
	public int doCommentWrite(@RequestParam("boardId") int boardId, @RequestParam("commBody") String commBody) throws Exception {
		
		ForWriteComment comment = new ForWriteComment();
		comment.setBoardId(boardId);
		comment.setCommBody(commBody);
		comment.setMemberId(1);
		
		return commentService.doCommentWrite(comment);
	}
	
	@RequestMapping("/comment/doModify")
	@ResponseBody
	public int doCommentModify(@RequestParam("commId") int commId, @RequestParam("commBody") String commBody) throws Exception {
		
		return commentService.doCommentModify(commId, commBody);
	}
	
	@RequestMapping("/comment/doDelete")  
    @ResponseBody
    private int doCommentDelete(@RequestParam("commId") int commId) throws Exception{
        
        return commentService.doCommentDelete(commId);
    }
}
