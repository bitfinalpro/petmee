package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.DeliInfo;
import kr.co.petmee.repository.vo.User;

public interface DeliInfoDAO {
	
	List<DeliInfo> selectDeliInfo (String order_no);
	
	void insertDeliInfo(DeliInfo deliInfo);
	
}
