package kr.co.petmee.board.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.NoticeBoardDAO;
import kr.co.petmee.repository.vo.NoticeBoard;

@Service
public class NoticeBoardServicempl implements NoticeBoardService{

	@Autowired
	private NoticeBoardDAO dao;
	
	public List<NoticeBoard> listBoard() {
		return dao.selectBoard();
	}


	
}
