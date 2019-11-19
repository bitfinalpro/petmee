package kr.co.petmee.board.notice.controller;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.NoticeBoard;

@Service
public interface NoticeBoardService {
	// 공지사항 리스트 뽑기
	List<NoticeBoard> listBoard();
	
	NoticeBoard detailBoard(int no);
	
	void insertBoard(NoticeBoard board);
}
