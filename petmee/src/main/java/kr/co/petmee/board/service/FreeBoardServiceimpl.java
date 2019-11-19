package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.FreeBoardDAO;
import kr.co.petmee.repository.dao.CommentDAO;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.FreeBoard;

@Service
public class FreeBoardServiceimpl implements FreeBoardService {
	
	@Autowired
	private FreeBoardDAO dao;
	
	@Autowired
	private CommentDAO dao1;
	
	public List<FreeBoard> listBoard() {
		return dao.selectBoard();
	}
	
	public void insertBoard(FreeBoard board) {
		dao.insertBoard(board);
	}
	
	public FreeBoard detailBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}
	
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
	
	public void updateBoard(FreeBoard board) {
		dao.updateBoard(board);
	}
	
	public FreeBoard updateFormBoard(int no) {
		return dao.selectOneBoard(no);
	}
	
	public List<Comment> commentList(int no) {
		return dao1.selectComment(no);
	}
	
	public List<Comment> commentRegist(Comment comment) {
		dao1.insertComment(comment);
		return dao1.selectComment(comment.getNo());
	}
	/*
	
	public List<Comment> commentDelete(Comment comment) {
		dao.deleteComment(comment.getCommentNo());
		return dao.selectComment(comment.getNo());
	}
	
	public List<Comment> commentUpdate(Comment comment) {
		dao.updateComment(comment);
		return dao.selectComment(comment.getNo());
	}
	
	*/

}
