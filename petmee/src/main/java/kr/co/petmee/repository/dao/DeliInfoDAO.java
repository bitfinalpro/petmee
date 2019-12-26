package kr.co.petmee.repository.dao;

import kr.co.petmee.repository.vo.DeliInfo;

public interface DeliInfoDAO {
	
	DeliInfo selectDeliInfo (String order_no);
	
	void insertDeliInfo(DeliInfo deliInfo);
	
}
