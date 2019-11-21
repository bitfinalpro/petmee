package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.ReviewBoard;

@Service
public interface ReviewBoardService {
	List<ReviewBoard> listBoard();
	ReviewBoard detailBoard(int no);
	ReviewBoard updateFormBoard(int no);
	void insertBoard(ReviewBoard review);
	void deleteBoard(int no);
	void updateBoard(ReviewBoard upboard);
	
	List<Comment> commentDelete(Comment comment);
	List<Comment> commentRegist(Comment comment);
	List<Comment> commentUpdate(Comment comment);
	List<Comment> commentList(int no);
}















