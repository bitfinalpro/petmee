package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Product;

public interface MainDAO {
	List<Product> selectFood();
}
