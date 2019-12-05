package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.FreeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.repository.vo.VolunteerReviewBoard;

public interface FreeBoardDAO {

	List<FreeBoard> selectBoard(Page page);
	
	int selectBoardCount();
	
	FreeBoard selectOneBoard(int no);
	
	void insertBoard(FreeBoard board);
	
	void updateViewCnt(int no);
	
	void updateBoard(FreeBoard board);
	
	int deleteBoard(int no);
	
	List<FreeBoard> selectSearchWriter(Search search);
	List<FreeBoard> selectSearchTitle(Search search);
	List<FreeBoard> selectSearchBoth(Search search);
	
}
