package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.BoardDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Page;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{

	@Autowired
	private BoardDAO dao;
	
	@Override
	public List<Board> listBoard(Page page) {
		return dao.selectBoard(page);
	}
	
	@Override
	public int selectBoardCount(String type) {	
		return dao.selectBoardCount(type);
	}
	
	public Board detailBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}
	public void insertBoard(Board board) {
		dao.insertBoard(board);
	}
	
	public Board updateFormBoard(int no) {
		return dao.selectOneBoard(no);
	}
	
	public void updateBoard(Board board) {
		dao.updateBoard(board);
	}
	
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}













}
