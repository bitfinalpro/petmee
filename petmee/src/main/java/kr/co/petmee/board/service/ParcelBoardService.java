package kr.co.petmee.board.service;

import java.util.List;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.ParcelBoard;

public interface ParcelBoardService {

	List<ParcelBoard> listBoard(Page page);
	
	int selectBoardCount();

	ParcelBoard detailBoard(int no);

	ParcelBoard updateFormBoard(int no);

	void deleteBoard(int no);

	void insertBoard(ParcelBoard board);

	void updateBoard(ParcelBoard board);
	
//	파일
	
	List<Filevo> selectSumFiles();
	
	List<Filevo> selectBaordFile(int no);

	void insertFile(Filevo filevo);

//	댓글
	
	List<Comment> commentDelete(Comment comment);

	List<Comment> commentRegist(Comment comment);

	List<Comment> commentUpdate(Comment comment);

	List<Comment> commentList(int no);

}
