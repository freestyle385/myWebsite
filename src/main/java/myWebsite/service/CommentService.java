package myWebsite.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

	public Map<String, Object> getCommentList(int boardId, int curPage) throws Exception {

		ArrayList<Comment> commentList = commentRepository.getCommentList(boardId);

		Map<String, Object> resultMap = getSubCommList(commentList, curPage);

		return resultMap;
	}

	private Map<String, Object> getSubCommList(ArrayList<Comment> commentList, int curPage) {

		// 페이징을 위한 범위
		// 댓글 5개씩 출력
		int limitStart = (curPage - 1) * 5 > commentList.size() ? commentList.size() : (curPage - 1) * 5;
		int limitRange = limitStart + 5 > commentList.size() ? commentList.size() : limitStart + 5;
		// 총 페이지 개수
		int pagesCount = (int) Math.ceil((double) commentList.size() / 5);

		// 전체 댓글을 subList로 자르기(크기에 알맞은 새로운 list를 생성하여 메모리 누수 줄임)
		ArrayList<Comment> subCommList = new ArrayList<Comment>(commentList.subList(limitStart, limitRange));
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("subCommList", subCommList);
		resultMap.put("pagesCount", pagesCount);
		resultMap.put("curPage", curPage);
		
		return resultMap;
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
