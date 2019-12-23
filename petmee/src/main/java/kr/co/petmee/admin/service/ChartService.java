package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Chart;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.Profit;

@Service
public interface ChartService {
	
	//월별 매출액 리스트
	Chart selectMarginList();
	//이번달 주문 top5
	List<Profit> selectMonthTop();
	//카테고리별 통계
	List<Product> categoryStatistics();
	//아이디 검색 통계
	Chart selectTotalById(String userId);
	//제품 검색
	Chart selectTotalByProduct(String productId);
}
