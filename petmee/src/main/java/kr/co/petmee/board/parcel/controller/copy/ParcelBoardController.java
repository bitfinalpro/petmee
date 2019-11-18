package kr.co.petmee.board.parcel.controller.copy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/parcelboard")
public class ParcelBoardController {

	@RequestMapping("parcelList.do")
	public void parcelList() {}

	@RequestMapping("parcelDtail.do")
	public void parcelDtail() {}
	
	@RequestMapping("parcelWriteForm.do")
	public void parcelWriteForm() {}
	
	
	
}
