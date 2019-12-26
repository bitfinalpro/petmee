package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Page;

@Service
public interface NoticeBoardService {
	// 공지사항 리스트 뽑기
	List<Board> listBoard(Page page);
	
	int selectBoardCount(String type);
	
	Board detailBoard(int no);
	
	Board updateFormBoard(int no);
	
	void insertBoard(Board board);
	
	void updateBoard(Board board);
	
	void deleteBoard(int no);



}
