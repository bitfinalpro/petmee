package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.FreeBoard;
import kr.co.petmee.repository.vo.Page;

@Service
public interface FreeBoardService {
    List<FreeBoard> listBoard(Page page);
    
    void insertBoard(FreeBoard board);
	
	 FreeBoard detailBoard(int no);

	 void deleteBoard(int no);
	 
	 void updateBoard(FreeBoard board);
	 
	 FreeBoard updateFormBoard(int no);
	 
	 List<Comment> commentList(int no);
	 
	 List<Comment> commentRegist(Comment comment);
	 
	 List<Comment> commentDelete(Comment comment);
		
	 List<Comment> commentUpdate(Comment comment);
	
	
	


}
