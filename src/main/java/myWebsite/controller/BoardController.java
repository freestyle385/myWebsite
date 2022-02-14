package myWebsite.controller;

import java.util.ArrayList;
import java.util.SortedSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myWebsite.dto.ResultData;
import myWebsite.service.BoardService;
import myWebsite.vo.Board;

@Controller
public class BoardController {
	BoardService boardService;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("/board")
	public String showBoardList(String hashtag, String searchKeyword, @RequestParam(defaultValue = "1") int curPage,
			Model md) throws Exception {

		ResultData<ArrayList<Board>> listRd = boardService.getBoardList(hashtag, searchKeyword, curPage);
		SortedSet<String> allHashtag = boardService.getAllHashtag();
		
		md.addAttribute("listRd", listRd);
		md.addAttribute("allHashtag", allHashtag);
		
		// 검색한 태그 및 키워드를 그대로 전달
		md.addAttribute("searchedTag", hashtag);
		if (searchKeyword != null) {
			md.addAttribute("searchedKeyword", searchKeyword);
		}
		
		return "/board/list";
	}

}
