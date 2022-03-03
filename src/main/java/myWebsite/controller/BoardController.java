package myWebsite.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.SortedSet;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import myWebsite.dto.ForWriteBoard;
import myWebsite.dto.ResultData;
import myWebsite.service.BoardService;
import myWebsite.util.Util;
import myWebsite.vo.Board;
import myWebsite.vo.LoginStatus;

@Controller
public class BoardController {
	private BoardService boardService;
	private LoginStatus loginStatus;

	public BoardController(BoardService boardService, LoginStatus loginStatus) {
		this.boardService = boardService;
		this.loginStatus = loginStatus;
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
	public String showBoardWrite(HttpServletResponse resp) throws Exception {
		int authLv = loginStatus.getAuthLv();
		if (authLv == 0) {
			Util.javaHistoryBack(resp, "관리자만 게시물 작성이 가능합니다.");
			return null;
		}

		return "/board/write";

	}

	@RequestMapping("/board/doWrite")
	@ResponseBody
	public String doBoardWrite(@ModelAttribute ForWriteBoard board) throws Exception {

		ResultData<Integer> writeRd = boardService.doBoardWrite(board);

		if (writeRd.isFail()) {
			return Util.jsHistoryBack(writeRd.getMsg());
		}

		return Util.jsReplace("", String.format("/board/detail?boardId=%d", writeRd.getData()));
	}

	@PostMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		JsonObject jsonObject = new JsonObject();

		// 저장될 외부 파일 경로
		String fileRoot = "C:\\summernote_image\\";
		// 오리지널 파일명
		String originalFileName = multipartFile.getOriginalFilename();
		// 파일 확장자
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

		// 저장될 파일 명
		String savedFileName = UUID.randomUUID() + extension;

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			// 파일 저장
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/summernoteImage/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			// 저장된 파일 삭제
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}

		return jsonObject;
	}

	@RequestMapping("/board/detail")
	public String showBoardDetail(int boardId, Model md, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		boardService.updateHitCnt(boardId, req, resp);
		
		ResultData<Board> detailRd = boardService.getBoardDetail(boardId);

		if (detailRd.isFail()) {
			try {
				Util.javaHistoryBack(resp, detailRd.getMsg());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		md.addAttribute("detailRd", detailRd);

		return "/board/detail";
	}

	@RequestMapping("/board/modify")
	public String showModify(int boardId, Model md, HttpServletResponse resp) throws Exception {
		
		if (!boardService.memberAuthChk(boardId)) {
			Util.javaHistoryBack(resp, "수정할 권한이 없습니다.");
			return null;
		}
		
		ResultData<Board> detailRd = boardService.getBoardDetail(boardId);
		
		if(detailRd.isFail()) {
			try {
				Util.javaHistoryBack(resp, detailRd.getMsg());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// 수정하려는 게시물의 기존 내용
		md.addAttribute("detailRd", detailRd);
		
		return "/board/modify";
	}

	@RequestMapping("/board/doModify")
	@ResponseBody
	public String doBoardModify(@ModelAttribute ForWriteBoard board, int boardId) throws Exception {

		ResultData<Integer> modifyRd = boardService.doBoardModify(board, boardId);

		if (modifyRd.isFail()) {
			return Util.jsHistoryBack(modifyRd.getMsg());
		}

		// 카드 수정 후 수정된 카드의 detail 페이지로 이동
		return Util.jsReplace("", String.format("/board/detail?boardId=%d", modifyRd.getData()));
	}

	@RequestMapping("/board/doDelete")
	@ResponseBody
	public String doBoardDelete(int boardId, Model md) throws Exception {
		
		if (!boardService.memberAuthChk(boardId)) {
			return Util.jsHistoryBack("삭제할 권한이 없습니다.");
		}
		
		ResultData<String> deleteRd = boardService.doBoardDelete(boardId);
		
		if (deleteRd.isFail()) {
			return Util.jsHistoryBack(deleteRd.getMsg());
		}

		return Util.jsReplace("", String.format("/board/list"));
	}
}
