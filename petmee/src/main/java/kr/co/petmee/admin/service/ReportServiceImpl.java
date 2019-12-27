package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ReportDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDAO dao;
	
	public List<Report> reportList(){
		return dao.reportUser();
	}
	
	public void insertReport(Report report) {
		dao.insertReport(report);
	}
	
	public void deleteReport(int reportNo) {
		dao.deleteReport(reportNo);
	}
	public List<Comment> insertComReport(Report report) {
		dao.insertComReport(report);
		return null;
	}

}
