package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Comment;

public interface CommentDAO {
	
	List<Comment> selectComment(int no);
	
	void insertComment(Comment comment);
	
	void deleteComment(int commentNo);
	void updateComment(Comment comment);
	
	

}
