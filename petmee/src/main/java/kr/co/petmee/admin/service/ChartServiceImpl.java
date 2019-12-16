package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ChartDAO;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.Profit;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	private ChartDAO dao;
	//월별 매출액 리스트
	@Override
	public List<Profit> selectMarginList() {
		return dao.selectMarginList();
	}
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
}
