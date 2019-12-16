function popup(email, title, content, 
		  reportEmail, other, reportReason, boardType, stringReportDate) {
	
	// 작성자
	$("#email").text(email);
	document.location.href="#popup";
	
	// 제목
	$("#title").text(title);
	document.location.href="#popup";
	
	// 신고내용
	$("#content").text(content);
	document.location.href="#popup";
	
	//신고자	
	$("#reportEmail").text(reportEmail);
	document.location.href="#popup";
	
	// 기타 사유
	$("#other").text(other);
	document.location.href="#popup";
	
	// 사유
	$("#reason").text(reportReason);
	document.location.href="#popup";
	
	// 게시판 타입 (어느게시판에서 신고했는지)
	$("#type").text(boardType);
	document.location.href="#popup";
	
    // 신고일자
	$("#date").text(stringReportDate);
	document.location.href="#popup";
	
}