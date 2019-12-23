package kr.co.petmee.admin.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.admin.service.ChartService;
import kr.co.petmee.repository.vo.Chart;
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
	public Chart monthlyMargin() {
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
		List<Product> pList = service.categoryStatistics();
		double sum = 0;
		for (Product p : pList) {
			sum += p.getProductCnt();
		}
		for (Product p : pList) {
			p.setSellRate(Math.round((p.getProductCnt() / (double)sum) * 100 * 100) / 100.0);
		}
		return pList;
	}
	//검색 통계
	@RequestMapping("/searchStatistics.do")
	@ResponseBody
	public Chart selectTotalById(String id, int categoryNo) {
		Chart c = new Chart();
		if(categoryNo == 1) c = service.selectTotalById(id);
		else c = service.selectTotalByProduct(id);
		return c;
		
	}
}
