package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Report;

@Service
public interface ReportService {
		List<Report> reportList();	   // 모든 신고당한 회원

}
