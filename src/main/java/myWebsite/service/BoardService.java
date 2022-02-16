package myWebsite.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import myWebsite.dto.ForWriteBoard;
import myWebsite.dto.ResultData;
import myWebsite.repository.BoardRepository;
import myWebsite.util.Util;
import myWebsite.vo.Board;

@Service
public class BoardService {
	BoardRepository boardRepository;

	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	public ResultData<ArrayList<Board>> getBoardList(String hashtag, String searchKeyword) throws Exception {

		// 넘겨받은 hashtag 문자열을 분할해 list에 추가
		List<String> hashtagArr = new ArrayList<>();
		if (!Util.emptyChk(hashtag)) {
			hashtagArr = Arrays.asList(hashtag.split(","));
		}

		ArrayList<Board> boardList = boardRepository.getBoardList(hashtagArr, searchKeyword);

		ResultData<ArrayList<Board>> listRd = new ResultData<>("S", "boardList",
				boardList);
		return listRd;
	}
	
	public ResultData<ArrayList<Board>> getSubBoardList(ResultData<ArrayList<Board>> listRd, int curPage) throws Exception {
		
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
		
		ArrayList<String> nullField = Util.fieldChk(board);
		
		if(nullField.size() > 0) {
			// 입력되지 않은 값 배열
			return new ResultData<Integer>("F", "입력되지 않은 값이 있습니다.", nullField.size(), String.join(",", nullField));
		}
		
		boardRepository.doBoardWrite(board);
		Integer lastInsertId = boardRepository.getLastInsertId();
		
		return new ResultData<Integer>("S", lastInsertId + "번 게시물 생성 완료", lastInsertId);
	}
	
	@Transactional(rollbackFor=Exception.class)
	public ResultData<Board> getBoardDetail(int boardId) throws Exception {
		boardRepository.updateHitCnt(boardId);
		
		Board board = boardRepository.getBoardDetail(boardId);
		
		if(Util.emptyChk(board)) {
			return new ResultData<Board>("F", "해당 글은 존재하지 않습니다.");
		}
		
		return new ResultData<Board>("S", boardId + "번 글 조회 완료", board);
	}

}
