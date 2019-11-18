package kr.co.petmee.board.notice.controller;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.NoticeBoard;

@Service
public interface NoticeBoardService {
	
	List<NoticeBoard> listBoard();
}
