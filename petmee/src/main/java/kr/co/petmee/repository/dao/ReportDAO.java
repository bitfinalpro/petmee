package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Report;

public interface ReportDAO {
	
	List<Report> reportUser();
	
	void insertReport(Report report);
	
	void deleteReport(int no);

	void insertComReport(Report report);
}
