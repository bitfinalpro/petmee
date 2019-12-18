$(() => {
	// 댓글 등록
	$("#crForm").submit(() => {
		$.post({
			url: "comment_regist.do",
			data: {no, email: $("#email").val(), content: $("#content").val()},
			dataType: "json",
			success: (list) => makeCommentList(list)
		});
		$("#email", "#content").val("");
		return false;
	});
	
	// 댓글 삭제
	$("#commentList").on("click", "a.del", (e) => {
		$.getJSON({
			url: "comment_delete.do",
			data: {commentNo: $(e.target).data("no"), no},
			success: (list) => makeCommentList(list)
		});
	});
	
	// 댓글 수정폼 취소
	$("#commentList").on("click", "a.cancel", (e) => {
		let cNo = $(e.target).data("no");
		$("#row" + cNo).show();
		$("#modRow" + cNo).remove();
	});

	// 댓글 수정
	$("#commentList").on("click", "a.update", (e) => {
		let cNo = $(e.target).data("no");
		$.ajax({
			url: "comment_update.do",
			type: "POST",
			data: {
				no, 
				content: $("#modRow" + cNo + " input[name=content]").val(), 
				commentNo: cNo
			},
			dataType: "json",
			success: result => makeCommentList(result)
		});
	});
	
	// 댓글 수정 폼 보이기
	$("#commentList").on("click", "a.mod", (e) => {
		let cNo = $(e.target).data("no");
		$("#commentList tr[id^=row]").show();
		$("#commentList tr[id^=modRow]").remove();
		
		var modId = $(`#row${cNo} > td:eq(0)`).text();
		var modContent = $(`#row${cNo} > td:eq(1)`).text();
		
		var html = `<div id="modRow${cNo}">
		            	<div>${modId}</div>
		            	<div>
		            		<div class="form-group">
		            			<input type="text" name="content" value="${modContent}" class="form-control input-wp2" placeholder="내용을 입력하세요">
		            		</div>
		            	</div>
		            	<div colspan="2"> 
		            		<a href="#" data-no="${cNo}" class="btn btn-success btn-sm update" role="button">수정</a>
		            		<a href="#" data-no="${cNo}" class="btn btn-warning btn-sm cancel" role="button">취소</a>
		            	</div>
		            </div>`;
		$("#row" + cNo).after(html);	
		$("#row" + cNo).hide();
	});
	// 로딩시 목록 호출
	commentListAjax();
});
/** 댓글 목록 가져오는 Ajax */
function commentListAjax() {
	$.getJSON({
		url: "comment_list.do",
		data: {no},
		success: list => makeCommentList(list)
	});
}

function toPad(val) {
	return val < 10 ? "0" + val : val;
}
$(document).on("click", "#reportbtn", (e) => {
	console.log("aaa");
	$.ajax({
		url: "selectReportedMember.do",
		data: {commentNo: $(e.target).data("no")},
		dataType: "json",
		async: false,
		success: result => {
			console.log(result);
			let query = `
				<ul>
                        <li><strong>작성자</strong> :<div class="userbox">&nbsp; ${result.email} </div></li>
                        <li><strong>내  용</strong>  : <div class="userbox">&nbsp; ${result.content}</div></li>
                </ul>
                <input type="hidden" id="reportEmail1" value="${result.email}"/>
			`;
			$(".reporttitle1").html(query);
		}
	});
	location.href="#popup1";
});
function makeCommentList(list) {
    $di = $("<div></div>");
	$.each(list, (i, c) => {
		var date = new Date(c.regDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + toPad(date.getHours()) + ":"
		         + toPad(date.getMinutes()) + ":"
		         + toPad(date.getSeconds());
		$di.append(
		    `<div id="row${c.commentNo}">
				<div class="com_com">
				<div class="nick">${c.email}</div>
				<div class="time">${time}</div>
				<button id="reportbtn" data-no="${c.commentNo}">신고</button>
				<a href="#" data-no="${c.commentNo}" class="del">삭제</a>
				<a href="#" data-no="${c.commentNo}" class="mod">수정</a>	
				</div>
				<br><br>
			    <div class="com_content">${c.content}</div>
		    </div>
		    `		
		);
	});
	$("#commentList").html($di);
}
$("#searchbutton").click((e)=>{
	let key = $("#top_sel").val();
	let val = $("#searchtext").val();
	console.log(key, val);
	location.href="list.do?key=" + key + "&val=" + val;
});