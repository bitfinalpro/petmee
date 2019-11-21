package kr.co.petmee.board.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.petmee.board.service.ParcelBoardService;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.ParcelBoard;
import kr.co.petmee.repository.vo.SermernoteVo;

@Controller
@RequestMapping("/parcelboard")
public class ParcelBoardController {

	@Autowired
	private ParcelBoardService service;
	
	@Autowired
	private ServletContext context;

	@RequestMapping("qqq.do")
	public void qqq() {
	}

	@RequestMapping("parcelList.do")
	public void parcelList(Model model) {
		model.addAttribute("blist", service.listBoard());
		model.addAttribute("flist", service.selectSumFiles());
	}

	@RequestMapping("parcelDtail.do")
	public void parcelDtail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
		 model.addAttribute("flist", service.selectBaordFile(no)); 
	}

	@RequestMapping("delete.do")
	public String delete(int no) {
		service.deleteBoard(no);
		return "redirect:list.do";
	}
	
//	@RequestMapping("updateform.do")
//	public void updateform(int no,Model model) throws Exception {
//		model.addAttribute("board", service.updateFormBoard(no));
//	}
//	
//	@RequestMapping("update.do")
//	public String update(Board board) {
//		service.updateBoard(board);
//		return "redirect:list.do";
//	}

	@RequestMapping("parcelWriteForm.do")
	public void parcelWriteForm() {
	}

	@RequestMapping("parcelwrite.do")
	public String parcelwrite(SermernoteVo sermernoteVo) throws Exception {
//		게시판 정보
		ParcelBoard getParcelBoard = new ParcelBoard();
		getParcelBoard.setTitle(sermernoteVo.getTitle());
		getParcelBoard.setWriter(sermernoteVo.getWriter());
		getParcelBoard.setContent(sermernoteVo.getContent());
//		썸네일
		List<MultipartFile> getSumfile = sermernoteVo.getSumfile();
//		게시판 내부 파일(이미지)
		List<MultipartFile> getBoardfile = sermernoteVo.getBoardfile();

		service.insertBoard(getParcelBoard);
		
		List<ParcelBoard> blist = service.listBoard();

		int bno = blist.get(0).getNo();
		System.out.println(bno);
//		썸네일 이미지 저장

		if (getSumfile.isEmpty() == false) {
			for (MultipartFile file : getSumfile) {
//			저장할때의 파일명(확장자 포함)
				String orgName = file.getOriginalFilename();
//			jsp 에서 보내오는 name명
				String Name = file.getName();
				System.out.println("name : " + Name);
//			파일 사이즈
				long size = file.getSize();
				System.out.println("size" + size);
//			저장되는 파일명
				String fileName = UUID.randomUUID() + orgName;
				System.out.println("fileName :" + fileName);
//			저장되는 경로
				String ysumpath = "/resources/upload/sum/";
				String sumpath = context.getRealPath(ysumpath);
				System.out.println(sumpath);
//			DB에 파일 정보 저장
//				객체생성
				Filevo filevo = new Filevo();
//			게시판정보에서 번호꺼내옴
				filevo.setNo(bno);
//				업로드할떄의 파일명
				filevo.setName(file.getOriginalFilename());
//				실제 저장된 파일명
				filevo.setOriName(fileName);
//				저장된 경로
				filevo.setSumpath(ysumpath);
//				f.setPath(); 게시판 에서 

//				DB에 실제 저장
				service.insertFile(filevo);

//		메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(sumpath + fileName));

			}
		}

//		게시판 이미지 저장
		if (getBoardfile.isEmpty() == false) {
			for (MultipartFile file : getBoardfile) {
//			저장할때의 파일명(확장자 포함)
				String orgName = file.getOriginalFilename();
//			jsp 에서 보내오는 name명
				String Name = file.getName();
				System.out.println("name : " + Name);
//			파일 사이즈
				long size = file.getSize();
				System.out.println("size" + size);
//			저장되는 파일명
				String fileName = UUID.randomUUID() + orgName;
				System.out.println("fileName :" + fileName);
//			저장되는 파일경로
				String ypath = "/resources/upload/boardfile/";
				String path = context.getRealPath(ypath);
				System.out.println(path);
//			DB에 파일 정보 저장
//				객체생성
				Filevo filevo = new Filevo();
//			게시판정보에서 번호꺼내옴
				filevo.setNo(bno);
//				업로드할떄의 파일명
				filevo.setName(file.getOriginalFilename());
//				실제 저장된 파일명
				filevo.setOriName(fileName);
//				저장된 경로
				filevo.setPath(ypath);
//				f.setSumpath(sumpath);

//				DB에 실제 저장
				service.insertFile(filevo);

//		메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(path + fileName));
			}
		}
//		저장하고 리스트로 이동
		return "redirect:parcelList.do";
	}

}
