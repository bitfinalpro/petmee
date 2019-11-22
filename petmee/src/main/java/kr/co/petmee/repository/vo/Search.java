package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class Search {
	private int keyword;
	private String searchText;
	private int pageNo;
	private int listSize;
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public Search() {
		this(1, 10);
	}
	public Search(int pageNo) { 
		this(pageNo, 10); 
	}
	public Search(int pageNo, int listSize) { 
		this.pageNo = pageNo;
		this.listSize = listSize;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	// #{begin}
	public int getBegin() {
		return (pageNo - 1) * listSize ;
	}
	// #{end}
	public int getEnd() {
		return pageNo * listSize;
	}
	
	public static void main(String[] args) {
		int listSize = 5;
		for (int pageNo = 1; pageNo < 11; pageNo++) {
			Page p1 = new Page(pageNo, listSize);
			int begin = (pageNo - 1) * 10 + 1;
			System.out.println(p1.getPageNo() + "-" +p1.getBegin() + "-" + p1.getEnd());			
		}
	}
}
