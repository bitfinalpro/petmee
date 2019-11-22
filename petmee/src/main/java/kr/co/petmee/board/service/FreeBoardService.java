package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.FreeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.repository.vo.VolunteerReviewBoard;

@Service
public interface FreeBoardService {
	
	//자유게시판 리스트, 페이징
    List<FreeBoard> listBoard(Page page);
    
    void insertBoard(FreeBoard board);
	
    int selectBoardCount();
    
	 FreeBoard detailBoard(int no);

	 void deleteBoard(int no);
	 
	 void updateBoard(FreeBoard board);
	 
	 FreeBoard updateFormBoard(int no);
	 
	 List<Comment> commentList(int no);
	 
	 List<Comment> commentRegist(Comment comment);
	 
	 List<Comment> commentDelete(Comment comment);
		
	 List<Comment> commentUpdate(Comment comment);
	 
	 List<FreeBoard> searchlistBoard(Page page, Search search);
	
	
	


}
