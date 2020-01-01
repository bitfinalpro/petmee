package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.Order;

public interface CouponDAO {
	//쿠폰 목록
	List<Coupon> selectCouponList();

	// 쿠폰번호중복검사
	int checkCouponNo(String no);

	// 쿠폰등록
	void registerCoupon(Coupon coupon);
	// 쿠폰삭제
	void deleteCoupon(String no);
}
