package kr.co.petmee.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

@Service
public interface MainService {
	
	//상품 최신 리스트
	List<Product> foodList();
	
	// 상품 베스트 리스트
	List<Product> bestList();
	
	// 각 항목 세일 베스트 리스트
	List<Product> selectSaleBest();
	List<Product> selectSaleBest1();
	List<Product> selectSaleBest2();
	List<Product> selectSaleBest3();
	List<Product> selectSaleBest4();
	
	//상품 최신 이미지
	List<Image> selectProductFile();
	
	//상품 베스트 이미지
	List<Image> selectProductFile1();
	
	//상품 세일 베스트 이미지
	List<Image> selectProductFile2();
	//상품 세일 베스트 이미지
	List<Image> selectProductFile3();
	//상품 세일 베스트 이미지
	List<Image> selectProductFile4();
	//상품 세일 베스트 이미지
	List<Image> selectProductFile5();
	//상품 세일 베스트 이미지
	List<Image> selectProductFile6();
}
