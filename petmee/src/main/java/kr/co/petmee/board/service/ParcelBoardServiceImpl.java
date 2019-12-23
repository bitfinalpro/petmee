package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.BoardDAO;
import kr.co.petmee.repository.dao.CommentDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Page;

@Service
public class ParcelBoardServiceImpl implements ParcelBoardService {

	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private CommentDAO dao1;

	public List<Board> listBoard(Page page) {
		return dao.selectBoard(page);
	}
	
	@Override
	public int selectBoardCount() {	
		return dao.selectBoardCount();
	}

	public Board detailBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}

	public Board updateFormBoard(int no) {
		return dao.selectOneBoard(no);
	}

	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}

	public void insertBoard(Board board) {
		dao.insertBoard(board);
	}

	public void updateBoard(Board board) {
		dao.updateBoard(board);
	}

//	파일

	public List<Filevo> selectSumFiles() {
		return dao.selectSumFiles();
	}
	
	public List<Filevo> selectBoardFile(int no) {
		return dao.selectBoardFile(no);
	}

	public void insertFile(Filevo filevo) {
		dao.insertFile(filevo);
	}


//	댓글
	
	public List<Comment> commentDelete(Comment comment) {
		dao1.deleteComment(comment.getCommentNo());
		return dao1.selectComment(comment.getNo());
	}
	
	public List<Comment> commentRegist(Comment comment) {
		dao1.insertComment(comment);
		return dao1.selectComment(comment.getNo());
	}
	
	public List<Comment> commentUpdate(Comment comment) {
		dao1.updateComment(comment);
		return dao1.selectComment(comment.getNo());
	}
	
	public List<Comment> commentList(int no) {
		return dao1.selectComment(no);
	}

}
