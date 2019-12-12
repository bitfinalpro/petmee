package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.CommentDAO;
import kr.co.petmee.repository.dao.QnaBoardDAO;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.FreeBoard;
import kr.co.petmee.repository.vo.QnaBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaBoardDAO dao;
	
	@Autowired
	private CommentDAO dao1;
	
	@Override
	public List<QnaBoard> listQnaBoard(Page page) {
		return dao.selectQnaBoard(page);
	}
	
	@Override
	   public int selectQnaCount() {   
	      return dao.selectQnaCount();
	   }
	
	@Override
	public void insertQnaBoard(QnaBoard board) {
		dao.insertQnaBoard(board);
	}
	
	public QnaBoard detailQnaBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}
	
	public void deleteQnaBoard(int no) {
		dao.deleteQnaBoard(no);
	}
	
	public void updateQnaBoard(QnaBoard board) {
		dao.updateQnaBoard(board);
	}
	
	public QnaBoard updateFormBoard(int no) {
		return dao.selectOneBoard(no);
	}
	
	public List<Comment> commentList(int no) {
		return dao1.selectComment(no);
	}
	
	public List<Comment> commentRegist(Comment comment) {
		dao1.insertComment(comment);
		return dao1.selectComment(comment.getNo());
	}
	
	
	public List<Comment> commentDelete(Comment comment) {
		dao1.deleteComment(comment.getCommentNo());
		return dao1.selectComment(comment.getNo());
	}
	
	public List<Comment> commentUpdate(Comment comment) {
		dao1.updateComment(comment);
		return dao1.selectComment(comment.getNo());
	}

}
