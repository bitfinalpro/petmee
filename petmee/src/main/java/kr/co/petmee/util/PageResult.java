package kr.co.petmee.util;


public class PageResult {
	   private int pageNo;
	   private int count;

	   private int beginPage;
	   private int endPage;
	   private boolean prev;
	   private boolean next;

	   public PageResult(int pageNo, int count) {
	      this(pageNo, count, 10, 10);
	   }

	   public PageResult(int pageNo, int count, int listSize, int tabSize) {
	      this.pageNo = pageNo;
	      this.count = count;
	      
	       int lastPage = (int)Math.ceil(count / (double)listSize);
	      int currTab = (pageNo - 1) / tabSize + 1;
	      
	      // 화면에 전송해야할것은 다 멤버변수로 받아서 사용
	      this.beginPage = (currTab - 1) * tabSize + 1; // 처음 가게될숫자
	      this.endPage = currTab * tabSize; // 마지막 숫자
	      if (endPage > lastPage) {
	         endPage = lastPage;
	      }
	      this.prev = beginPage != 1;
	      this.next = endPage != lastPage;

	   }

	   public int getPageNo() {
	      return pageNo;
	   }

	   public void setPageNo(int pageNo) {
	      this.pageNo = pageNo;
	   }

	   public int getCount() {
	      return count;
	   }

	   public void setCount(int count) {
	      this.count = count;
	   }

	   public int getBeginPage() {
	      return beginPage;
	   }

	   public void setBeginPage(int beginPage) {
	      this.beginPage = beginPage;
	   }

	   public int getEndPage() {
	      return endPage;
	   }

	   public void setEndPage(int endPage) {
	      this.endPage = endPage;
	   }

	   public boolean isPrev() {
	      return prev;
	   }

	   public void setPrev(boolean prev) {
	      this.prev = prev;
	   }

	   public boolean isNext() {
	      return next;
	   }

	   public void setNext(boolean next) {
	      this.next = next;
	   }

	}