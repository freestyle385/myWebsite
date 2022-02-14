package myWebsite.controller;

import java.util.ArrayList;
import java.util.SortedSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import myWebsite.dto.ForWriteBoard;
import myWebsite.dto.ResultData;
import myWebsite.service.BoardService;
import myWebsite.util.Util;
import myWebsite.vo.Board;

@Controller
public class BoardController {
	BoardService boardService;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("/board/list")
	public String showBoardList(String hashtag, String searchKeyword, @RequestParam(defaultValue = "1") int curPage,
			Model md) throws Exception {

		ResultData<ArrayList<Board>> listRd = boardService.getBoardList(hashtag, searchKeyword);
		ResultData<ArrayList<Board>> subListRd = boardService.getSubBoardList(listRd, curPage);
		SortedSet<String> allHashtag = boardService.getAllHashtag();
		
		md.addAttribute("listRd", listRd);
		md.addAttribute("subListRd", subListRd);
		md.addAttribute("allHashtag", allHashtag);
		md.addAttribute("curPage", curPage);
		
		// 검색한 태그 및 키워드를 그대로 전달
		md.addAttribute("searchedTag", hashtag);
		if (searchKeyword != null) {
			md.addAttribute("searchedKeyword", searchKeyword);
		}
		
		return "/board/list";
	}
	
	@RequestMapping("/board/write")
	public String showBoardWrite() {
		
		return "/board/write";
		
	}
	
	@RequestMapping("/board/doWrite")
	@ResponseBody
	public String doBoardWrite(@ModelAttribute ForWriteBoard board){
		
		ResultData<Integer> writeRd = boardService.doBoardWrite(board);
		
		if(writeRd.isFail()) {
			return Util.jsHistoryBack(writeRd.getMsg());
		}
		
		return Util.jsReplace("", String.format("/board/detail?boardId=%d", writeRd.getData()));
	}

}
