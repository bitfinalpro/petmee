package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.FreeBoard;
import kr.co.petmee.repository.vo.Page;

public interface FreeBoardDAO {

	List<FreeBoard> selectBoard(Page page);
	
	int selectBoardCount();
	
	FreeBoard selectOneBoard(int no);
	
	void insertBoard(FreeBoard board);
	
	void updateViewCnt(int no);
	
	void updateBoard(FreeBoard board);
	
	int deleteBoard(int no);
	
}
