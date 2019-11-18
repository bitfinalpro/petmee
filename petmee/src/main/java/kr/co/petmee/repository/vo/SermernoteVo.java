package kr.co.petmee.repository.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SermernoteVo {

ParcelBoard parcelBoard;
private List<MultipartFile> boardfile;
private List<MultipartFile> sumfile;


}
