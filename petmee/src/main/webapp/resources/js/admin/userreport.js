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
	$("#boardtype").text(boardType);
	document.location.href="#popup";
	
    // 신고일자
	$("#date").text(stringReportDate);
	document.location.href="#popup";
	
}

// 게시글 신고
function report_chk() {
	// 신고내용 Name 가져오기
	var report = document.getElementsByName("report");	
	var report_check = 0;
	for(var i = 0; i<report.length; i++) {
		
		if(report[i].checked==true) {
			report_check++;
		}
	}
	if(report_check==0) {
		alert("신고사유를 선택해주세요");
		return;
	} else {
		$.ajax({
			url: "/petmee/admin/user/insertReport.do",
			type: "POST",
			data: {
				no: $("#no").val(),
				reportEmail: $("#reportEmail").val(),
 				reportReason: $("input[name=report]:checked").val(),
				content: contentVal,
				title: titleVal,
				other: $(".reportcontent").val(),
				type: $(".reporttype").data("type"),
				boardType: $(".reporttitle").data("type")
			},
			error: () => {console.log("err");},
			success: (result) => {alert(result);}
		});
		alert("신고되었습니다.");
		$("#popup").hide();
	}
}


// 댓글 신고
function report_comChk() {
	var report = document.getElementsByName("report1");	
	var report_check = 0;
	for(var i = 0; i<report.length; i++) {
		
		if(report[i].checked==true) {
			report_check++;
		}
	}
	if(report_check==0) {
		alert("신고사유를 선택해주세요");
		return;
		
	} else {
		console.log("ajax호출");
		console.log($(".reporttype1").data("t"));
		$.ajax({
			url: "/petmee/admin/user/insertComReport.do",
			type: "POST",
			data: {
				no: $("#no").val(),
				commentNo: $("#commentNo").val(),
				reportEmail: $("#reportEmail1").val(),
 				reportReason: $("input[name=report1]:checked").val(),
				content: $("#com_content").html(),
				other: $(".reportcontent1").val(),
				type: $(".reporttype1").data("t"),
				boardType: $(".reporttitle1").data("type")
			},
			error: () => {console.log("err");},
		});
		alert("신고되었습니다.");
		$("#popup1").hide();
	}
}