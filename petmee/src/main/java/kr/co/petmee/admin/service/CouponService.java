package kr.co.petmee.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.Order;

@Service
public interface CouponService {
	//쿠폰 목록
	List<Coupon> selectCouponList();
	// 쿠폰등록
	void registerCoupon(HashMap map);
	//쿠폰삭제
	void deleteCoupon(String no);
}
