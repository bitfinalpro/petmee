package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;

public interface BoardDAO {
	
List<Board> selectBoard(Page page);
	
    // 신고 
	Comment selectReportedMember(int CommentNo);
	// 마미손울어
	int selectBoardCount();
	// 상세정보
	Board selectOneBoard(int no);
	// 글등록
	void insertBoard(Board board);
	// 공지등록..이었던가
	void insertBoard2(Board board);
    // 조회수	
	void updateViewCnt(int no);
	// 수정
	void updateBoard(Board board);
	// 삭제
	int deleteBoard(int no);
	// 검색
	List<Board> selectSearchWriter(Search search);
	List<Board> selectSearchTitle(Search search);
	List<Board> selectSearchBoth(Search search);

	
//	/* 파일 파트 시작 ========================================= */

	List<Filevo> selectSumFiles();
	
	List<Filevo> selectBoardFile(int no);

	void insertFile(Filevo filevo);
}
