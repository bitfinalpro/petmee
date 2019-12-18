package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.CommentDAO;
import kr.co.petmee.repository.dao.BoardDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private CommentDAO dao1;
	
	
	@Override
	public List<Board> listBoard(Page page) {
		return dao.selectBoard(page);
	}
	
	 @Override
	   public int selectBoardCount() {   
	      return dao.selectBoardCount();
	   }

	
	public void insertBoard(Board board) {
		dao.insertBoard(board);
	}
	
	public Board detailBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}
	
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
	
	public void updateBoard(Board board) {
		dao.updateBoard(board);
	}
	
	public Board updateFormBoard(int no) {
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
	@Override
	public List<Board> searchlistBoard(Page page, Search search){
		switch(search.getKeyword()) {
		case 0: System.out.println(0);return dao.selectBoard(page);
		case 1: System.out.println(1);return dao.selectSearchWriter(search);
		case 2: System.out.println(2);return dao.selectSearchTitle(search);
		case 3: System.out.println(3);return dao.selectSearchBoth(search);
		default: return null;
		}
	}
	
	

}
