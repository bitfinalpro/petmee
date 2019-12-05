package kr.co.petmee.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.admin.service.UserService;
import kr.co.petmee.repository.dao.UserDAO;

@Controller("kr.co.petmee.admin.controller.ReportController")
@RequestMapping("/admin/report")
public class ReportController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private UserDAO dao;
	/**
	@RequestMapping("/reportlist.do")
	public void List(Model model) {
		model.addAttribute("reportList", service.reportList());
	}
     */
}
