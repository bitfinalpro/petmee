package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.NoticeBoard;

public interface NoticeBoardDAO {
	List<NoticeBoard> selectBoard();
	NoticeBoard selectOneBoard(int no);
	void updateViewCnt(int no);
	void insertBoard(NoticeBoard board);
}
