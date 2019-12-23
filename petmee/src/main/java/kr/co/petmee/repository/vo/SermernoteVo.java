package kr.co.petmee.repository.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SermernoteVo {

	private String title;
	private String Writer;
	private String content;
	private String type;	

	private List<MultipartFile> boardfile;
	private List<MultipartFile> sumfile;

}
