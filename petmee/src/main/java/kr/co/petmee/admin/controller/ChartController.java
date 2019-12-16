package kr.co.petmee.admin.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.admin.service.ChartService;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.Profit;

@Controller("kr.co.petmee.admin.controller.ChartController")
@RequestMapping("/admin/chart")
public class ChartController {
	
	@Autowired
	private ChartService service;
	//메인
	@RequestMapping("/chart.do")
	public void chartMain() {
		Calendar c = Calendar.getInstance();		
		String yearNmonth = Integer.toString(c.get(Calendar.YEAR)) + Integer.toString(c.get(Calendar.MONTH) + 1);
	}
	//월별 매출 리스트
	@RequestMapping("/monthlyMargin.do")
	@ResponseBody
	public List<Profit> monthlyMargin() {
		return service.selectMarginList();
	}
	//이번달 매출 top5 리스트
	@RequestMapping("/monthtop.do")
	@ResponseBody
	public List<Profit> selectMonthTop() {
		return service.selectMonthTop();
	}
	//카테고리별 통계
	@RequestMapping("/categorystatistics.do")
	@ResponseBody
	public List<Product> categoryStatistics() {
		return service.categoryStatistics();
	}
}
