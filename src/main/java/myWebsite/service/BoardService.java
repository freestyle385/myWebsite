package myWebsite.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.stereotype.Service;

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

	public ResultData<ArrayList<Board>> getBoardList(String hashtag, String searchKeyword, int curPage) {

		// 넘겨받은 hashtag 문자열을 분할해 list에 추가
		List<String> hashtagArr = new ArrayList<>();
		if (!Util.emptyChk(hashtag)) {
			hashtagArr = Arrays.asList(hashtag.split(","));
		}

		ArrayList<Board> boardList = boardRepository.getBoardList(hashtagArr, searchKeyword);
		// int limitStart = (curPage - 1) * 4 > allCardList.size() ? allCardList.size()
		// : (curPage - 1) * 4;
		// int limitRange = limitStart + 4 > allCardList.size() ? allCardList.size() :
		// limitStart + 4;

		// 전체 게시물에서 subList를 통한 Limit
		// ArrayList<Card> subCardList = new
		// ArrayList<Card>(allCardList.subList(limitStart, limitRange));

		ResultData<ArrayList<Board>> listRd = new ResultData<>("S", "boardList, ExtraDataInfo: boardListSize",
				boardList, boardList.size() + "");

		return listRd;
	}

	public SortedSet<String> getAllHashtag() {
		String foundHashtag = boardRepository.getAllHashtag();

		// Set 특성에 따라 foundHashtag의 중복 태그 제거 및 정렬
		if (!Util.emptyChk(foundHashtag)) {
			SortedSet<String> allHashtag = new TreeSet<>(Arrays.asList(foundHashtag.split(",")));
			return allHashtag;
		}

		return null;
	}

}
