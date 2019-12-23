package kr.co.petmee.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ChartDAO;
import kr.co.petmee.repository.vo.Chart;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.Profit;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	private ChartDAO dao;
	
	//월별 매출액 리스트
	@Override
	public Chart selectMarginList() {
		Calendar cal = Calendar.getInstance();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		cal.setTime(date);
		cal.add(Calendar.MONTH, -12);
		List<String> newlist = new ArrayList<>();
		newlist.add(sdf.format(cal.getTime()));
		for(int i = 1; i < 13; i++) {
			cal.add(Calendar.MONTH, + 1);
			newlist.add(sdf.format(cal.getTime()));
		}
		Chart chart = new Chart();
		List<Integer> priceList = new ArrayList<>();
		for(int i = 0; i < newlist.size(); i++) {
			priceList.add(dao.selectMarginList(newlist.get(i)));
		}
		chart.setPriceList(priceList);
		chart.setDateList(newlist);
		return chart;
	}
	//아이디 검색
	//월 주문 top 5
	@Override
	public List<Profit> selectMonthTop() {
		return dao.selectMonthTop();
	}
	//카테고리 별 통계
	@Override
	public List<Product> categoryStatistics() {
		return dao.categoryStatistics();
	}
	//아이디 검색 통계
	@Override
	public Chart selectTotalById(String userId) {	
		Calendar c = Calendar.getInstance();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		c.setTime(date);
		c.add(Calendar.MONTH, -12);
		List<String> list = new ArrayList<>();
		list.add(sdf.format(c.getTime()));
		for(int i = 1; i < 13; i++) {
			c.add(Calendar.MONTH, + 1);
			list.add(sdf.format(c.getTime()));
		}
		Chart chart = new Chart();
		List<Integer> cList = new ArrayList<>();
		List<Integer> pList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			Map<String, String> parameterMap = new HashMap<String, String>();
			parameterMap.put("sDate", list.get(i));
			parameterMap.put("userId", userId);
			cList.add(dao.selectTotalCount(parameterMap));
			pList.add(dao.selectTotalPrice(parameterMap));
		}
		chart.setCountList(cList);
		chart.setPriceList(pList);
		chart.setDateList(list);
		chart.setUser(dao.selectUser(userId));
		chart.setOrderList(dao.selectOrderList(userId));
		return chart;
	}
	//제품번호 검색 통계
	@Override
	public Chart selectTotalByProduct(String productId) {	
		Calendar c = Calendar.getInstance();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		c.setTime(date);
		c.add(Calendar.MONTH, -12);
		List<String> list = new ArrayList<>();
		list.add(sdf.format(c.getTime()));
		for(int i = 1; i < 13; i++) {
			c.add(Calendar.MONTH, + 1);
			list.add(sdf.format(c.getTime()));
		}
		Chart chart = new Chart();
		List<Integer> cList = new ArrayList<>();
		List<Integer> pList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			Map<String, String> parameterMap = new HashMap<String, String>();
			parameterMap.put("sDate", list.get(i));
			parameterMap.put("productId", productId);
			cList.add(dao.selectSumCnt(parameterMap));
			pList.add(dao.selectSumPrice(parameterMap));
		}
		chart.setCountList(cList);
		chart.setPriceList(pList);
		chart.setDateList(list);
		chart.setProduct(dao.selectProduct(productId));
		return chart;
	}
}
