package kr.co.petmee.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.petmee.repository.vo.Order;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.Profit;
import kr.co.petmee.repository.vo.User;

public interface ChartDAO {
	//월별 매출액
	int selectMarginList(String sDate);
	//월 주문수 탑
	List<Profit> selectMonthTop();
	//카테고리 별 통계
	List<Product> categoryStatistics();
	//아이디로 통계검색
	int selectTotalPrice(Map<String,String> map);
	int selectTotalCount(Map<String,String> map);
	User selectUser(String userId);
	List<Order> selectOrderList(String userId);
	//제품으로 통계검색
	int selectSumCnt(Map<String,String> map);
	int selectSumPrice(Map<String,String> map);
	Product selectProduct(String productId);
	
}
