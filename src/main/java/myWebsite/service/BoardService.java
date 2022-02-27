package myWebsite.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import myWebsite.dto.ForWriteBoard;
import myWebsite.dto.ResultData;
import myWebsite.repository.BoardRepository;
import myWebsite.util.Util;
import myWebsite.vo.Board;
import myWebsite.vo.LoginStatus;

@Service
@Transactional(rollbackFor = Exception.class)
public class BoardService {
	private BoardRepository boardRepository;
	private LoginStatus loginStatus;

	public BoardService(BoardRepository boardRepository, LoginStatus loginStatus) {
		this.boardRepository = boardRepository;
		this.loginStatus = loginStatus;
	}

	public ResultData<ArrayList<Board>> getBoardList(String hashtag, String searchKeyword) throws Exception {

		// 넘겨받은 hashtag 문자열을 분할해 list에 추가
		List<String> hashtagArr = new ArrayList<>();
		if (!Util.emptyChk(hashtag)) {
			hashtagArr = Arrays.asList(hashtag.split(","));
		}

		ArrayList<Board> boardList = boardRepository.getBoardList(hashtagArr, searchKeyword);

		ResultData<ArrayList<Board>> listRd = new ResultData<>("S", "boardList", boardList);
		return listRd;
	}

	public ResultData<ArrayList<Board>> getSubBoardList(ResultData<ArrayList<Board>> listRd, int curPage)
			throws Exception {

		// 페이징을 위한 범위
		// 게시물 10개씩 출력
		int limitStart = (curPage - 1) * 10 > listRd.getData().size() ? listRd.getData().size() : (curPage - 1) * 10;
		int limitRange = limitStart + 10 > listRd.getData().size() ? listRd.getData().size() : limitStart + 10;
		// 총 페이지 개수
		int pagesCount = (int) Math.ceil((double) listRd.getData().size() / 10);

		// 전체 게시물을 subList로 자르기(크기에 알맞은 새로운 list를 생성하여 메모리 누수 줄임)
		ArrayList<Board> subBoardList = new ArrayList<Board>(listRd.getData().subList(limitStart, limitRange));

		ResultData<ArrayList<Board>> subListRd = new ResultData<>("S", "subBoardList, ExtraDataInfo: pagesCount",
				subBoardList, pagesCount);
		return subListRd;
	}

	public SortedSet<String> getAllHashtag() throws Exception {
		String foundHashtag = boardRepository.getAllHashtag();

		// Set 특성에 따라 foundHashtag의 중복 태그 제거 및 정렬
		if (!Util.emptyChk(foundHashtag)) {
			SortedSet<String> allHashtag = new TreeSet<>(Arrays.asList(foundHashtag.split(",")));
			return allHashtag;
		}

		return null;
	}
	
	
	public ResultData<Integer> doBoardWrite(ForWriteBoard board) throws Exception {
		// 현재 로그인된 계정의 memberId를 추가 
		board.setMemberId(loginStatus.getLoginedMemberId());
		
		ArrayList<String> nullField = Util.fieldChk(board);

		if (nullField.size() > 0) {
			// 입력되지 않은 값 배열
			return new ResultData<Integer>("F", "입력되지 않은 값이 있습니다.", nullField.size(), String.join(",", nullField));
		}

		boardRepository.doBoardWrite(board);
		Integer lastInsertId = boardRepository.getLastInsertId();

		return new ResultData<Integer>("S", lastInsertId + "번 게시물 생성", lastInsertId);
	}

	public ResultData<Board> getBoardDetail(int boardId) throws Exception {

		Board board = boardRepository.getBoardDetail(boardId);

		if (Util.emptyChk(board)) {
			return new ResultData<Board>("F", "해당 글은 존재하지 않습니다.");
		}
				
		return new ResultData<Board>("S", boardId + "번 글 조회", board);
	}

	public void updateHitCnt(int boardId, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Cookie[] cookies = req.getCookies();
		int visitor = 0;
		
		for (Cookie cookie : cookies) {
			
			// visit 쿠키가 있는지(방문이력이 있는지) 확인
			if (cookie.getName().equals("visit")) {
				visitor = 1;
				
				if (cookie.getValue().contains(req.getParameter("boardId"))) {
					System.out.println("게시물 id 정보 있음");
				} else {
					// visit 쿠키에 게시물 id 정보가 없다면 추가 후 조회수 증가
					cookie.setValue(cookie.getValue() + "_" + req.getParameter("boardId"));
					
					// 만료기간은 24시간으로 설정
					cookie.setMaxAge(60*60*24);
					resp.addCookie(cookie);
					boardRepository.updateHitCnt(boardId);
				}
				
				// visit 쿠키 발견 즉시 for문 종료
				break;
			}
		}
		
		// visit 쿠키가 없다면 쿠키를 만들고 조회수 증가
		if (visitor == 0) {
			Cookie cookie1 = new Cookie("visit", req.getParameter("boardId"));
			// 만료기간은 24시간으로 설정
			cookie1.setMaxAge(60*60*24);
			resp.addCookie(cookie1);
			boardRepository.updateHitCnt(boardId);
		}
	}

	public ResultData<Integer> doBoardModify(ForWriteBoard board, int boardId) throws Exception {
		// 현재 로그인된 계정의 memberId를 추가 
		board.setMemberId(loginStatus.getLoginedMemberId());
		
		ArrayList<String> nullField = Util.fieldChk(board);

		if (nullField.size() > 0) {
			// 입력되지 않은 값 배열
			return new ResultData<Integer>("F", "입력되지 않은 값이 있습니다.", nullField.size(), String.join(",", nullField));
		}
		
		boardRepository.doBoardModify(board, boardId);
		
		return new ResultData<Integer>("S", boardId + "번 글 수정", boardId);
	}

	public ResultData<String> doBoardDelete(int boardId) throws Exception {
		
		Board board = boardRepository.getBoardDetail(boardId);
		
		if (Util.emptyChk(board)) {
			return new ResultData<String>("F", "해당 글은 존재하지 않습니다.");
		}
		
		boardRepository.doBoardDelete(boardId);
		
		return new ResultData<String>("S", boardId + "번 글 삭제");
	}

	public boolean isMemberAuthorized(int boardId) throws Exception {
		
		int result = boardRepository.getMemberIdByBoardId(boardId);
		
		if (loginStatus.getLoginedMemberId() == result) {
			return true;
		}
		
		return false;
	}

}
