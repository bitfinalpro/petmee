package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.repository.vo.VolunteerReviewBoard;

public interface VolunteerReviewBoardDAO {
	//봉사후기 전체게시물목록
	List<VolunteerReviewBoard> selectBoard(Page page);
	//봉사후기 상세
	VolunteerReviewBoard selectOneBoard(int no);
	//봉사후기 삭제
	void deleteBoard(int no);
	//봉사후기 글등록
	void insertBoard(VolunteerReviewBoard board);
	//봉사후기 글 수정
	void updateBoard(VolunteerReviewBoard board);
	//게시물 조회수 증가
	void updateViewCnt(int no);
	//댓글 목록 
	List<Comment> selectComment(int no);
	//댓글 추가
	void insertComment(Comment comment);
	//댓글 삭제
	void deleteComment(int commentNo);
	//댓글 수정
	void updateComment(Comment comment);
	//게시물갯수
	int selectBoardCount();
	//봉사후기 게시물 검색 목록
	List<VolunteerReviewBoard> selectSearchWriter(Search search);
	List<VolunteerReviewBoard> selectSearchTitle(Search search);
	List<VolunteerReviewBoard> selectSearchBoth(Search search);
}
