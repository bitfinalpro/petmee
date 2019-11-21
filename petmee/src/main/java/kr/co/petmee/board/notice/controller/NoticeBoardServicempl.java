package kr.co.petmee.board.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.NoticeBoardDAO;
import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;

@Service
public class NoticeBoardServicempl implements NoticeBoardService{

	@Autowired
	private NoticeBoardDAO dao;
	
	@Override
	public List<NoticeBoard> listBoard(Page page) {
		return dao.selectBoard(page);
	}
	
	@Override
	public int selectBoardCount() {	
		return dao.selectBoardCount();
	}
	
	public NoticeBoard detailBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}
	public void insertBoard(NoticeBoard board) {
		dao.insertBoard(board);
	}
	
	public NoticeBoard updateFormBoard(int no) {
		return dao.selectOneBoard(no);
	}
	
	public void updateBoard(NoticeBoard board) {
		dao.updateBoard(board);
	}
	
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}













}
