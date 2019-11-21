package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;

public interface NoticeBoardDAO {
	List<NoticeBoard> selectBoard(Page page);
	int selectBoardCount();
	NoticeBoard selectOneBoard(int no);
	void updateViewCnt(int no);
	void insertBoard(NoticeBoard board);
	void updateBoard(NoticeBoard board);
	int deleteBoard(int no);

}
