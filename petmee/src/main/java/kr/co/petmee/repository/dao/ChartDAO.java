package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Profit;

public interface ChartDAO {
	List<Profit> selectMarginList(Profit profit);
}
