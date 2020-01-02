package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ReviewBoard;

public interface ReviewBoardDAO {
	List<ReviewBoard> selectBoard();
	void updateViewCnt(int no);
	ReviewBoard selectOneBoard(int no);
	void insertBoard(ReviewBoard review);
	void updateBoard(ReviewBoard board);
	int deleteBoard(int no);
	
	// 이미지
	List<Image> ProductListImg(int categoryNo);
	
	//	/* 파일 파트 시작 ========================================= */
	List<Filevo> selectSumFiles();
	List<Filevo> selectBaordFile(int no);
	void insertFile(Filevo filevo);
	
	
	/* 댓글 파트 시작 ========================================= */
	List<Comment> selectComment(int no);
	void insertComment(Comment comment);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);
	List<Image> selectProductImage(String productId);
	Product shoppingDetail(String productId);
}
	 














