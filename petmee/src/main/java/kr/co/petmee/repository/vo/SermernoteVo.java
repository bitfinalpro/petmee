package kr.co.petmee.repository.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SermernoteVo {

	private String title;
	private String writer;
	private String content;

	private List<MultipartFile> boardfile;
	private List<MultipartFile> sumfile;

}
