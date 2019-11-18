package kr.co.petmee.board.parcel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/parcelboard")
public class ParcelBoardController {

	@RequestMapping("qqq.do")
	public void qqq() {}

	@RequestMapping("parcelList.do")
	public void parcelList() {}

	@RequestMapping("parcelDtail.do")
	public void parcelDtail() {}
	
	@RequestMapping("parcelWriteForm.do")
	public void parcelWriteForm() {}
	
	
	
}
