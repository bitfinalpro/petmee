package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;

public interface BoardDAO {
	
List<Board> selectBoard(Page page);
	
	int selectBoardCount();
	
	Board selectOneBoard(int no);
	
	void insertBoard(Board board);
	
	void insertBoard2(Board board);
	
	
	void updateViewCnt(int no);
	
	void updateBoard(Board board);
	
	int deleteBoard(int no);
	
	List<Board> selectSearchWriter(Search search);
	List<Board> selectSearchTitle(Search search);
	List<Board> selectSearchBoth(Search search);

}
