package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;

@Service
public interface NoticeBoardService {
	// 공지사항 리스트 뽑기
	List<NoticeBoard> listBoard(Page page);
	
	int selectBoardCount();
	
	NoticeBoard detailBoard(int no);
	
	NoticeBoard updateFormBoard(int no);
	
	void insertBoard(NoticeBoard board);
	
	void updateBoard(NoticeBoard board);
	
	void deleteBoard(int no);



}