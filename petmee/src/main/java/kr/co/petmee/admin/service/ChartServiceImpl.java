package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ChartDAO;
import kr.co.petmee.repository.vo.Profit;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	private ChartDAO dao;
	
	@Override
	public List<Profit> selectMarginList(Profit p) {
		return dao.selectMarginList(p);
	}
}
