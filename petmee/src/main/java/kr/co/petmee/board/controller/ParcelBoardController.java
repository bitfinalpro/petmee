package kr.co.petmee.board.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.petmee.board.service.ParcelBoardService;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.SermernoteVo;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.controller.ParcelBoardController")
@RequestMapping("/board/parcelboard")
public class ParcelBoardController {

	@Autowired
	private ParcelBoardService service;
	
	@Autowired
	private ServletContext context;

	@RequestMapping("parcelList.do")
	public void parcelList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		
		Page p = new Page(pageNo);
		p.setType("parcel");
		List<Board> bylist = service.listBoard(p);
		
		for (Board b : bylist) { 
			
			System.out.println(b.getNo());
			System.out.println(b.getTitle());
			System.out.println(b.getType());
			
		}
		
		model.addAttribute("blist", bylist);
		
		model.addAttribute("pr", new PageResult(pageNo, service.selectBoardCount("pasel")));
		model.addAttribute("flist", service.selectSumFiles());
	}

	@RequestMapping("parcelDtail.do")
	public void parcelDtail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
		 model.addAttribute("flist", service.selectBoardFile(no)); 
	}

	@RequestMapping("delete.do")
	public String delete(int no) {
		service.deleteBoard(no);
		return "redirect:parcelList.do";
	}
	
	@RequestMapping("parcelUpdateForm.do")
	public void updateform(int no,Model model) throws Exception {
		model.addAttribute("no",no);
	}
	
	@RequestMapping("parcelupdate.do")
	public String parcelupdate(SermernoteVo sermernoteVo,int no) throws Exception {
//		게시판 정보
		Board getBoard = new Board();
		getBoard.setNo(no);
		getBoard.setTitle(sermernoteVo.getTitle());
		getBoard.setContent(sermernoteVo.getContent());

		service.updateBoard(getBoard);
		
		int bno = getBoard.getNo();
		//System.out.println(bno);

//		저장하고 리스트로 이동
		return "redirect:parcelList.do";
	}

	@RequestMapping("parcelWriteForm.do")
	public void parcelWriteForm() {
	}

	@RequestMapping("parcelwrite.do")
	public String parcelwrite(SermernoteVo sermernoteVo,Board board, HttpSession session) throws Exception {
//		게시판 정보
		Board getBoard = new Board();
		getBoard.setTitle(sermernoteVo.getTitle());
		getBoard.setEmail(sermernoteVo.getWriter());
		getBoard.setContent(sermernoteVo.getContent());
		getBoard.setType(sermernoteVo.getType());
//		썸네일
		sermernoteVo.getSumfile();
//		게시판 내부 파일(이미지)
		List<MultipartFile> getBoardfile = sermernoteVo.getBoardfile();
		
		service.insertBoard(getBoard);
		
		int bno = getBoard.getNo();
		System.out.println(bno);
//		썸네일 이미지 저장

		if (sermernoteVo.getSumfile().isEmpty() == false) {
			for (MultipartFile file : sermernoteVo.getSumfile()) {
//			저장할때의 파일명(확장자 포함)
				String orgName = file.getOriginalFilename();
//			jsp 에서 보내오는 name명
				String Name = file.getName();
//			파일 사이즈
				long size = file.getSize();
//			저장되는 파일명
				String fileName = UUID.randomUUID() + orgName;
//			저장되는 경로
				String ysumpath = "/resources/upload/sum/";
				String sumpath = context.getRealPath(ysumpath);
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

				System.out.println("파일번호썸"+filevo.getNo());
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
//			파일 사이즈
				long size = file.getSize();
//			저장되는 파일명
				String fileName = UUID.randomUUID() + orgName;
//			저장되는 파일경로
				String ypath = "/resources/upload/boardfile/";
				String path = context.getRealPath(ypath);
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
				
				System.out.println("파일번호내부"+filevo.getNo());
//				DB에 실제 저장
				service.insertFile(filevo);

//		메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(path + fileName));
			}
		}
//		저장하고 리스트로 이동
		return "redirect:parcelList.do";
	}

//	댓글
	
	@RequestMapping("comment_update.do")
	@ResponseBody
	public List<Comment> commentUpdateAjax(Comment comment) {
		return service.commentUpdate(comment);
	}
	
	@RequestMapping("comment_regist.do")
	@ResponseBody
	public List<Comment> commentRegistAjax(Comment comment) {
		return service.commentRegist(comment);
	}
	
	@RequestMapping("comment_list.do")
	@ResponseBody
	public List<Comment> commentListAjax(int no) {
		return service.commentList(no);
	}
	
	@RequestMapping("comment_delete.do")
	@ResponseBody
	public List<Comment> commentDeleteAjax(Comment comment) {
		return service.commentDelete(comment);
	}
	
}
