package kr.co.petmee.shopping.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.NoticeBoardDAO;
import kr.co.petmee.repository.dao.ParcelBoardDao;
import kr.co.petmee.repository.dao.ShoppingDAO;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ReviewBoard;

@Service
public class DeatilServiceImpl implements DetailService{
	
	@Autowired
	private ShoppingDAO dao;
	@Autowired
	private NoticeBoardDAO boardDao;
	
	@Override
	public Product ShoppingDetail(String productId) {
		return dao.shoppingDetail(productId);
	}
	
	@Override
	public List<Image> SelectProductImage(String productId) {
		return dao.selectProductImage(productId);
	}
	
	/* ----------게시판 리스트 -------------------*/
	
	@Override
	public List<NoticeBoard> listBoard(Page page) {
		return boardDao.selectBoard(page);
	}
	@Override
	public int selectBoardCount() {	
		return boardDao.selectBoardCount();
	}

}
