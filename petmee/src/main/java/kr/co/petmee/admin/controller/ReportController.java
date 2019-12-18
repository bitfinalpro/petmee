package kr.co.petmee.admin.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.admin.service.ReportService;
import kr.co.petmee.repository.dao.ReportDAO;
import kr.co.petmee.repository.vo.Report;
import kr.co.petmee.repository.vo.User;


@Controller("kr.co.petmee.admin.controller.ReportController")
@RequestMapping("/admin/user")
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	@Autowired
	private ReportDAO dao;
	
	@RequestMapping("/reportlist.do")
	public void List(Model model) {		
		List<Report> rList = service.reportList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		for(Report r : rList ) {
			r.setStringReportDate(sdf.format(r.getReportDate()));
		}
		model.addAttribute("reportList", rList );
	}
	
	@RequestMapping("/insertReport.do")
	public String insertReport(Report report, HttpSession session) {
		User user = (User)session.getAttribute("user");
		report.setEmail(user.getEmail());		
		service.insertReport(report);
		return "aaa";
	}
	
	@RequestMapping("/insertDelete.do")
	public String delete(int no) {
		service.deleteReport(no); 
		return "redirect:reportlist.do";
	}
	
	
     
}
