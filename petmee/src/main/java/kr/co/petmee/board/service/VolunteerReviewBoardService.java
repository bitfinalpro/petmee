package kr.co.petmee.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.repository.vo.VolunteerReviewBoard;

@Service
public interface VolunteerReviewBoardService {
	//봉사후기게시물 목록  추출
	List<Board> listBoard(Page page);
	//봉사후기 상세페이지
	Board detailBoard(int no);
	//봉사후기 페이지 삭제
	void deleteBoard(int no);
	//봉사후기 게시물 등록
	void insertBoard(Board board);
	//봉사후기 게시물 수정
	void updateBoard(Board board);
	//댓글목록
	List<Comment> commentList(int no);
	//댓글 등록
	List<Comment> commentRegist(Comment comment);
	//댓글 삭제
	List<Comment> commentDelete(Comment comment);
	//댓글 수정
	List<Comment> commentUpdate(Comment comment);
	
	List<Board> searchlistBoard(Page page, Search search);
	
}
