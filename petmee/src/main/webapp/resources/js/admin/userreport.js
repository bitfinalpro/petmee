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


function report_chk() {
	// 신고내용 Name 가져오기
	var report = document.getElementsByName("report");	
	var report_check = 0;
	for(var i = 0; i<report.length; i++) {
		
		if(report[i].checked==true) {
			alert(report[i].value);
			report_check++;
		}
	}
	if(report_check==0) {
		alert("신고사유를 선택해주세요");
		return;
	} else {
		alert("신고되었습니다.");
	}
}

