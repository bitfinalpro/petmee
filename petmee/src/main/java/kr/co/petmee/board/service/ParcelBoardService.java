package kr.co.petmee.board.service;

import java.util.List;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Page;

public interface ParcelBoardService {

	List<Board> listBoard(Page page);
	
	int selectBoardCount();

	Board detailBoard(int no);

	Board updateFormBoard(int no);

	void deleteBoard(int no);

	void insertBoard(Board board);

	void updateBoard(Board board);
	
//	파일
	
	List<Filevo> selectSumFiles();
	
	List<Filevo> selectBoardFile(int no);

	void insertFile(Filevo filevo);

//	댓글
	
	List<Comment> commentDelete(Comment comment);

	List<Comment> commentRegist(Comment comment);

	List<Comment> commentUpdate(Comment comment);

	List<Comment> commentList(int no);

}
