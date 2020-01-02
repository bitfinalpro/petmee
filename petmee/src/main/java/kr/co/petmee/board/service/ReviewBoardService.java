package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ReviewBoard;

@Service
public interface ReviewBoardService {
	List<ReviewBoard> listBoard();
	ReviewBoard detailBoard(int no);
	ReviewBoard updateFormBoard(int no);
	void insertBoard(ReviewBoard review);
	void deleteBoard(int no);
	void updateBoard(ReviewBoard upboard);
	
	//	파일
	List<Filevo> selectSumFiles();
	List<Filevo> selectBaordFile(int no);
	void insertFile(Filevo filevo);
	
	List<Comment> commentDelete(Comment comment);
	List<Comment> commentRegist(Comment comment);
	List<Comment> commentUpdate(Comment comment);
	List<Comment> commentList(int no);
	//상품 이미지
	List<Image> SelectProductImage(String productId);
	/*상품 디테일*/
	Product ShoppingDetail(String productId);
}















