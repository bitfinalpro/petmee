package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Profit;

@Service
public interface ChartService {
	List<Profit> selectMarginList(Profit p);
}
