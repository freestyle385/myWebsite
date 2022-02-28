package myWebsite.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import myWebsite.dto.ForWriteComment;
import myWebsite.service.CommentService;

@Controller
public class CommentController {
	private CommentService commentService;

	public CommentController(CommentService commentService) {
		this.commentService = commentService;
	}

	@RequestMapping("/comment/list")
	@ResponseBody
	private Map<String, Object> showCommentList(@RequestParam("boardId") int boardId, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		
		Map<String, Object> resultMap = commentService.getCommentList(boardId, curPage);
				
		return resultMap;
	}
	
	@RequestMapping("/comment/getCommentsCount")
	@ResponseBody
	private int showCommentsCount(@RequestParam("boardId") int boardId) throws Exception {
		
		return commentService.getCommentsCount(boardId);
	}
	
	@RequestMapping("/comment/doWrite")
	@ResponseBody
	public int doCommentWrite(@ModelAttribute ForWriteComment comment) throws Exception {
		
		return commentService.doCommentWrite(comment);
	}
	
	@RequestMapping("/comment/doModify")
	@ResponseBody
	public int doCommentModify(@RequestParam("commBody") String commBody, @RequestParam("commId") int commId) throws Exception {
		
		return commentService.doCommentModify(commBody, commId);
	}
	
	@RequestMapping("/comment/doDelete")  
    @ResponseBody
    private int doCommentDelete(@RequestParam("commId") int commId) throws Exception{
        
        return commentService.doCommentDelete(commId);
    }
}
