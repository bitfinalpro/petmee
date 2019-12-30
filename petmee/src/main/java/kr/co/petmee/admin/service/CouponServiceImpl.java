package kr.co.petmee.admin.service;

import java.util.HashMap;
import java.util.List;

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
			dao.registerCoupon(c);
		}
	}
	// 쿠폰삭제
	public void deleteCoupon(String no) {
			dao.deleteCoupon(no);
	}

	// 쿠폰중복검사
	public int checkCoupon(Coupon coupon) {
		int nameCnt = dao.checkCouponName(coupon.getName());
		int noCnt = dao.checkCouponNo(coupon.getNo());
		if (nameCnt == 1 && noCnt == 1)
			return 3;
		if (nameCnt == 1)
			return 1;
		if (noCnt == 1)
			return 2;

		return 0;
	}
}
