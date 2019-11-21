package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.QnaBoard;
import kr.co.petmee.repository.vo.Page;

@Service
public interface QnaBoardService {
    List<QnaBoard> listQnaBoard(Page page);
    
    void insertQnaBoard(QnaBoard board);
	
	 QnaBoard detailQnaBoard(int no);

	 void deleteQnaBoard(int no);
	 
	 void updateQnaBoard(QnaBoard board);
	 
	 QnaBoard updateFormBoard(int no);
	 
	 List<Comment> commentList(int no);
	 
	 List<Comment> commentRegist(Comment comment);
	 
	 List<Comment> commentDelete(Comment comment);
		
	 List<Comment> commentUpdate(Comment comment);
	
	
	


}
