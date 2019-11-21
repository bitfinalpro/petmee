package kr.co.petmee.board.file.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.ParcelBoard;
import kr.co.petmee.repository.vo.SermernoteVo;

@Controller("kr.co.petmee.board.file.controller")
@RequestMapping("/parcelboard")
public class Test {

	@RequestMapping("/write.do")
	public String parcelwrite(SermernoteVo sermernoteVo) throws Exception {
//		게시판 정보
		ParcelBoard getParcelBoard = sermernoteVo.getParcelBoard();
//		썸네일
		List<MultipartFile> getSumfile = sermernoteVo.getSumfile();
//		게시판 내부 파일(이미지)
		List<MultipartFile> getBoardfile = sermernoteVo.getBoardfile();

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
				String sumpath = "C:/java/git/finalpro/petmee/src/main/webapp/resources/upload/sum/";
//			DB에 파일 정보 저장
//				객체생성
				Filevo filevo = new Filevo();
//			게시판정보에서 번호꺼내옴
				filevo.setNo(getParcelBoard.getNo());
//				업로드할떄의 파일명
				filevo.setName(file.getOriginalFilename());
//				실제 저장된 파일명
				filevo.setOriName(fileName);
//				저장된 경로
				filevo.setSumpath(sumpath);
//				f.setPath(); 게시판 에서 
				
//				서비스.insertFile(filevo);
//				service.insertBoard(getParcelBoard);

//		메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(sumpath + UUID.randomUUID() + orgName));
				
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
				String path = "C:/java/git/finalpro/petmee/src/main/webapp/resources/upload/boardfile/";
//			DB에 파일 정보 저장
//				객체생성
				Filevo filevo = new Filevo();
//			게시판정보에서 번호꺼내옴
				filevo.setNo(getParcelBoard.getNo());
//				업로드할떄의 파일명
				filevo.setName(file.getOriginalFilename());
//				실제 저장된 파일명
				filevo.setOriName(fileName);
//				저장된 경로
				filevo.setPath(path);
//				f.setSumpath(sumpath);

//				DB에 실제 저장
//				서비스.insertFile(ilevo);
//				service.insertBoard(getParcelBoard);
				
//		메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(path + UUID.randomUUID() + orgName));
			}
		}
//		저장하고 리스트로 이동
		return "redirect:list.do";
	}

}
