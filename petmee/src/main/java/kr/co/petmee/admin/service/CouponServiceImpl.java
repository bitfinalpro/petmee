package kr.co.petmee.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.CouponDAO;
import kr.co.petmee.repository.vo.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDAO dao;

	//쿠폰목록
	public List<Coupon> selectCouponList(){
		return dao.selectCouponList();
	}
	// 쿠폰등록
	public void registerCoupon(HashMap map) {
		List<Coupon> list = (List<Coupon>) map.get("list");
		for (Coupon c : list) {
			for(int i = 0; i < c.getCouponCount(); i++) {
				c.setNo(UUID.randomUUID().toString());
				dao.registerCoupon(c);
			}
		}
	}
	// 쿠폰삭제
	public void deleteCoupon(String no) {
			dao.deleteCoupon(no);
	}
}
