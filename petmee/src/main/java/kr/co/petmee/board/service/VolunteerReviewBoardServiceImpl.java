package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.VolunteerReviewBoardDAO;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.repository.vo.VolunteerReviewBoard;

@Service
public class VolunteerReviewBoardServiceImpl implements VolunteerReviewBoardService{
	
	@Autowired
	private VolunteerReviewBoardDAO dao;
	
	//전체 게시물 추출
	@Override
	public List<VolunteerReviewBoard> listBoard(Page page) {
		return dao.selectBoard(page);
	}
	
	//봉사후기 상세
	@Override
	public VolunteerReviewBoard detailBoard(int no) {
		dao.updateViewCnt(no);
		return dao.selectOneBoard(no);
	}
	//봉사후기 삭제
	@Override
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
	//봉사후기 등록
	@Override
	public void insertBoard(VolunteerReviewBoard board) {
		dao.insertBoard(board);
	}
	//봉사후기 글 수정
	@Override
	public void updateBoard(VolunteerReviewBoard board) {
		dao.updateBoard(board);
	}
	//봉사후기 댓글 목록
	@Override
	public List<Comment> commentList(int no) {
		return dao.selectComment(no);
	}
	//봉사후기 댓글 등록
	@Override
	public List<Comment> commentRegist(Comment comment) {
		dao.insertComment(comment);
		return dao.selectComment(comment.getNo());
	}
	//봉사후기 댓글 삭제
	@Override
	public List<Comment> commentDelete(Comment comment) {
		dao.deleteComment(comment.getCommentNo());
		return dao.selectComment(comment.getNo());
	}
	//봉사후기 댓글 삭제
	@Override
	public List<Comment> commentUpdate(Comment comment) {
		dao.updateComment(comment);
		return dao.selectComment(comment.getNo());
	}
	
	@Override
	public List<VolunteerReviewBoard> searchlistBoard(Page page, Search search){
		switch(search.getKeyword()) {
		case 0: System.out.println(0);return dao.selectBoard(page);
		case 1: System.out.println(1);return dao.selectSearchWriter(search);
		case 2: System.out.println(2);return dao.selectSearchTitle(search);
		case 3: System.out.println(3);return dao.selectSearchBoth(search);
		default: return null;
		}
	}
}
