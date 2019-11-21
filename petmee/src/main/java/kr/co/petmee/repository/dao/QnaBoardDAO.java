package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.QnaBoard;
import kr.co.petmee.repository.vo.Page;

public interface QnaBoardDAO {

	List<QnaBoard> selectBoard(Page page);
	
	int selectBoardCount();
	
	QnaBoard selectOneBoard(int no);
	
	void insertBoard(QnaBoard board);
	
	void updateViewCnt(int no);
	
	void updateBoard(QnaBoard board);
	
	int deleteBoard(int no);
	
}
