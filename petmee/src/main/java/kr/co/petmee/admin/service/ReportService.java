package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Report;

@Service
public interface ReportService {
        // 신고 리스트
		List<Report> reportList();
		// 게시글 신고 추가
		void insertReport(Report report);
		// 댓글 신고 추가
		List<Comment> insertComReport(Report report);
		// 추방
		void deleteReport(int no);
		 
}
