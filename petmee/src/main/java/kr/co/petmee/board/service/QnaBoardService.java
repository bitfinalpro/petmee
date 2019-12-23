package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;


@Service
public interface QnaBoardService {
    
	List<Board> listBoard(Page page);
	
	 
    Comment selectReportedMember(int commentNo);
	
	int selectBoardCount();
    	
	Board detailBoard(int no);
	 
	void insertBoard(Board board);

	void deleteBoard(int no);
	 
	void updateBoard(Board board);
	 
	Board updateFormBoard(int no);
	 
	List<Comment> commentList(int no);
	 
	List<Comment> commentRegist(Comment comment);
	 
	List<Comment> commentDelete(Comment comment);
		
	List<Comment> commentUpdate(Comment comment);
	 
	List<Board> searchlistBoard(Page page, Search search);
	
	
	


}
