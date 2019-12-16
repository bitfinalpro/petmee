package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.Profit;

public interface ChartDAO {
	//월별 매출액
	List<Profit> selectMarginList();
	//월 주문수 탑
	List<Profit> selectMonthTop();
	//카테고리 별 통계
	List<Product> categoryStatistics();
}
