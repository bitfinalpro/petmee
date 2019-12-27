package kr.co.petmee.board.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.petmee.board.service.ReviewBoardService;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.ParcelBoard;
import kr.co.petmee.repository.vo.ReviewBoard;
import kr.co.petmee.repository.vo.SermernoteVo;
import kr.co.petmee.repository.vo.User;

@Controller("kr.co.petmee.board.review.controller.ReviewBoardController")
@RequestMapping("/board/reviewboard")
public class ReviewBoardController {

	@Autowired
	private ReviewBoardService service;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/review_list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("list", service.listBoard());
	}
	
	@RequestMapping("/review_detail.do")
	public void detail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
		model.addAttribute("flist", service.selectBaordFile(no));
	}
	
	@GetMapping("/review_writeform.do")
	public void writeform() {}
	
	@RequestMapping("/review_write.do")
	public String write(ReviewBoard board) {
		service.insertBoard(board);
		return "redirect:review_list.do";
	}

	@GetMapping("/review_updateform.do")
	public void updateform(int no, Model model) throws Exception {
		model.addAttribute("board", service.updateFormBoard(no));
	}
	
	@PostMapping("/review_update.do")
	public String update(ReviewBoard board) {
		service.updateBoard(board);
		return "redirect:review_list.do";
	}
	
	
	@RequestMapping("/review_delete.do")
	public String delete(int no) {
		service.deleteBoard(no); 
		return "redirect:review_list.do";
	}
	
//	댓글
	@RequestMapping("/comment_update.do")
	   @ResponseBody
	   public List<Comment> commentUpdateAjax(Comment comment) {
	      return service.commentUpdate(comment);
	   }
	   
	   @RequestMapping("/comment_regist.do")
	   @ResponseBody
	   public List<Comment> commentRegistAjax(Comment comment) {
	      return service.commentRegist(comment);
	   }
	   
	   @RequestMapping("/comment_list.do")
	   @ResponseBody
	   public List<Comment> commentListAjax(int no) {
	      return service.commentList(no);
	   }
	   
	   @RequestMapping("/comment_delete.do")
	   @ResponseBody
	   public List<Comment> commentDeleteAjax(Comment comment) {
	      return service.commentDelete(comment);
	   }
	
	   
	   
	   // 파일업로드
	   /*
	   @RequestMapping("review_write.do")
		public String parcelwrite(SermernoteVo sermernoteVo) throws Exception {
//			게시판 정보
		   	ReviewBoard getParcelBoard = new ReviewBoard();
//			getParcelBoard.setTitle(sermernoteVo.getTitle());
//			getParcelBoard.setWriter(sermernoteVo.getWriter());
			getParcelBoard.setContent(sermernoteVo.getContent());
//			썸네일
			List<MultipartFile> getSumfile = sermernoteVo.getSumfile();
//			게시판 내부 파일(이미지)
			List<MultipartFile> getBoardfile = sermernoteVo.getBoardfile();

			service.insertBoard(getParcelBoard);
			
			List<ReviewBoard> blist = service.listBoard();

			int bno = blist.get(0).getNo();
			System.out.println(bno);
//			썸네일 이미지 저장

			if (getSumfile.isEmpty() == false) {
				for (MultipartFile file : getSumfile) {
//				저장할때의 파일명(확장자 포함)
					String orgName = file.getOriginalFilename();
//				jsp 에서 보내오는 name명
					String Name = file.getName();
					System.out.println("name : " + Name);
//				파일 사이즈
					long size = file.getSize();
					System.out.println("size" + size);
//				저장되는 파일명
					String fileName = UUID.randomUUID() + orgName;
					System.out.println("fileName :" + fileName);
//				저장되는 경로
					String ysumpath = "/resources/upload/sum/";
					String sumpath = context.getRealPath(ysumpath);
					System.out.println(sumpath);
//				DB에 파일 정보 저장
//					객체생성
					Filevo filevo = new Filevo();
//				게시판정보에서 번호꺼내옴
					filevo.setNo(bno);
//					업로드할떄의 파일명
					filevo.setName(file.getOriginalFilename());
//					실제 저장된 파일명
					filevo.setOriName(fileName);
//					저장된 경로
					filevo.setSumpath(ysumpath);
//					f.setPath(); 게시판 에서 

//					DB에 실제 저장
					service.insertFile(filevo);

//					메모리에 있는 파일을 실제 폴더에 저장
					file.transferTo(new File(sumpath + fileName));
				}
			}

//			게시판 이미지 저장
			if (getBoardfile.isEmpty() == false) {
				for (MultipartFile file : getBoardfile) {
//				저장할때의 파일명(확장자 포함)
					String orgName = file.getOriginalFilename();
//				jsp 에서 보내오는 name명
					String Name = file.getName();
					System.out.println("name : " + Name);
//				파일 사이즈
					long size = file.getSize();
					System.out.println("size" + size);
//				저장되는 파일명
					String fileName = UUID.randomUUID() + orgName;
					System.out.println("fileName :" + fileName);
//				저장되는 파일경로
					String ypath = "/resources/upload/boardfile/";
					String path = context.getRealPath(ypath);
					System.out.println(path);
//				DB에 파일 정보 저장
//				객체생성
				Filevo filevo = new Filevo();

//				게시판정보에서 번호꺼내옴
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

//				메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(path + fileName));
				}
			}
//			저장하고 리스트로 이동
			return "redirect:review_list.do";
		}
		*/
}




