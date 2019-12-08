package kr.co.petmee.admin.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.admin.service.ChartService;
import kr.co.petmee.repository.vo.Profit;

@Controller("kr.co.petmee.admin.controller.ChartController")
@RequestMapping("/admin/chart")
public class ChartController {
	
	@Autowired
	private ChartService service;
	
	@RequestMapping("/chart.do")
	public Model chartMain(Model model) {
		Calendar c = Calendar.getInstance();		
		Profit p = new Profit();
		String yearNmonth = Integer.toString(c.get(Calendar.YEAR)) + Integer.toString(c.get(Calendar.MONTH) + 1); 
		p.setYearNmonth(Integer.parseInt(yearNmonth));
		model.addAttribute("marginList", service.selectMarginList(p));
		
		return model;
	}
}
