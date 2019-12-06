package kr.co.petmee.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.admin.service.ReportService;
import kr.co.petmee.repository.dao.ReportDAO;


@Controller("kr.co.petmee.admin.controller.ReportController")
@RequestMapping("/admin/user")
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	@Autowired
	private ReportDAO dao;
	
	@RequestMapping("/reportlist.do")
	public void List(Model model) {
		model.addAttribute("reportList", service.reportList());
	}
     
}
