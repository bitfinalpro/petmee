package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ParcelBoardDao;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.ParcelBoard;

@Service
public class ParcelBoardServiceImpl implements ParcelBoardService {

	@Autowired
	private ParcelBoardDao dao;

	public List<ParcelBoard> listBoard() {
		return dao.selectBoard();
	}

	public ParcelBoard detailBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}

	public ParcelBoard updateFormBoard(int no) {
		return dao.selectOneBoard(no);
	}

	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}

	public void insertBoard(ParcelBoard board) {
		dao.insertBoard(board);
	}

	public void updateBoard(ParcelBoard board) {
		dao.updateBoard(board);
	}

//	파일

	public List<Filevo> selectSumFiles() {
		return dao.selectSumFiles();
	}
	
	public List<Filevo> selectBaordFile(int no) {
		return dao.selectBaordFile(no);
	}

	public void insertFile(Filevo filevo) {
		dao.insertFile(filevo);
	}


//	댓글
	
//	public List<Comment> commentDelete(Comment comment) {
//		dao.deleteComment(comment.getCommentNo());
//		return dao.selectComment(comment.getNo());
//	}
//
//	public List<Comment> commentRegist(Comment comment) {
//		dao.insertComment(comment);
//		return dao.selectComment(comment.getNo());
//	}
//
//	public List<Comment> commentUpdate(Comment comment) {
//		dao.updateComment(comment);
//		return dao.selectComment(comment.getNo());
//	}
//
//	public List<Comment> commentList(int no) {
//		return dao.selectComment(no);
//	}

}
