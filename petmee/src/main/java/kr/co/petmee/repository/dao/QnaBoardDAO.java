package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.QnaBoard;
import kr.co.petmee.repository.vo.Page;

public interface QnaBoardDAO {

	List<QnaBoard> selectQnaBoard(Page page);
	
	int selectQnaCount();
	
	QnaBoard selectOneBoard(int no);
	
	void insertQnaBoard(QnaBoard board);
	
	void updateViewCnt(int no);
	
	void updateQnaBoard(QnaBoard board);
	
	int deleteQnaBoard(int no);
	
}
