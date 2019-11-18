package kr.co.petmee.board.file.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.SermernoteVo;

@Controller("kr.co.petmee.mvc._04file.Test")
@RequestMapping("/mvc/file")
public class Test {

	@RequestMapping("/upload03.do")
	public String upload03(SermernoteVo sermernoteVo) throws Exception {
		
		System.out.println("msg : " + sermernoteVo.getParcelBoard());
		
//		썸네일 이미지 저장
		for (MultipartFile file : sermernoteVo.getSumfile()) {
			
			if (file.isEmpty()) continue;
			
			String orgName = file.getOriginalFilename();
			String Name = file.getName();
			System.out.println("name : "+Name);
			long size = file.getSize();
			
			System.out.println("orgName :" +UUID.randomUUID()+ orgName);
			System.out.println("size" + size);
			
//		메모리에 있는 파일을 실제 폴더에 저장 하려면
			file.transferTo(new File("C:/java/git/finalpro/petmee/src/main/webapp/resources/upload/sum/" +UUID.randomUUID()+ orgName));
		}
		
//		게시판 이미지 저장
		for (MultipartFile file : sermernoteVo.getBoardfile()) {
			
			if (file.isEmpty()) continue;
			
		
			
			String orgName = file.getOriginalFilename();
			long size = file.getSize();

			System.out.println("orgName :" +UUID.randomUUID()+orgName);
			System.out.println("size" + size);
			
//		메모리에 있는 파일을 실제 폴더에 저장 하려면
			file.transferTo(new File("C:/java/git/finalpro/petmee/src/main/webapp/resources/upload/boardfile/" +UUID.randomUUID()+orgName));
		
//		DB에 파일 정보 저장
		Filevo f = new Filevo();
		
		f.setNo(sermernoteVo.getParcelBoard().getNo());
		f.setName(file.getOriginalFilename());
		f.setOriName(oriName);
		f.setPath(path);
		f.setSumpath(sumpath);
		
		}
//		저장하고 이동
		return "redirect:/mvc/index04.jsp";
	}

}
