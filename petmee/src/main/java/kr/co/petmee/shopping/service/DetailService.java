package kr.co.petmee.shopping.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ReviewBoard;

@Service
public interface DetailService {
	
	Product ShoppingDetail(String productId);
	
	List<Image> SelectProductImage(String productId);
	
	/*디테일 게시판*/
	List<Board> listBoard(Page page);
	int selectBoardCount();
	
}
