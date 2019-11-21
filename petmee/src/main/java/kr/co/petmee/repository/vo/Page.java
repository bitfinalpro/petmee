package kr.co.petmee.repository.vo;

public class Page {
	private int pageNo = 1;
	private int listSize;
	
	public Page() {
		this(1, 10);
	}
	public Page(int pageNo) {
//		this.pageNo = pageNo;
		this(pageNo, 10);
		}
	public Page(int pageNo, int listSize) {
		this.pageNo = pageNo;
		this.listSize = listSize;
	}
	
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
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
//		return  (pageNo - 1) * 10 + 1;
		return  (pageNo - 1) * listSize;
	}
	// #{end}
	public int getEnd() {
//		return  pageNo * 10;
		return  pageNo * listSize;
	}	
	
	public static void main(String[] args) {
		int listSize = 5;
		for (int pageNo = 1; pageNo < 11; pageNo++) {
			Page p1 = new Page(pageNo, listSize);
			System.out.println(p1.getBegin() + "-" + p1.getBegin() + "_" + p1.getEnd());
			
//		int begin = (pageNo - 1) * 10 + 1;
//		int end = (pageNo * 10);
		System.out.println(p1.getPageNo() + "-" + p1.getEnd());
		}
	}
}
