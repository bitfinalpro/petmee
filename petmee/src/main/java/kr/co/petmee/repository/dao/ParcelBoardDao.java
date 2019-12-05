package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.ParcelBoard;

public interface ParcelBoardDao {

	List<ParcelBoard> selectBoard(Page page);
	int selectBoardCount();
	
	ParcelBoard selectOneBoard(int no);

	void updateViewCnt(int no);

	void insertBoard(ParcelBoard board);

	void updateBoard(ParcelBoard board);

	int deleteBoard(int no);
//	/* 파일 파트 시작 ========================================= */

	List<Filevo> selectSumFiles();
	
	List<Filevo> selectBaordFile(int no);

	void insertFile(Filevo filevo);
	
//	/* 댓글 파트 시작 ========================================= */
	List<Comment> selectComment(int no);
	void insertComment(Comment comment);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);

}
