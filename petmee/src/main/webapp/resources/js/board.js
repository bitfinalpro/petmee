$(() => {
	// 댓글 등록
	$("#crForm").submit(() => {
		$.post({
			url: "comment_regist.do",
			data: {no, writer: $("#writer").val(), content: $("#content").val()},
			dataType: "json",
			success: (list) => makeCommentList(list)
		});
		$("#writer", "#content").val("");
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
		
		var html = `<tr id="modRow${cNo}">
		            	<td>${modId}</td>
		            	<td>
		            		<div class="form-group">
		            			<input type="text" name="content" value="${modContent}" class="form-control input-wp2" placeholder="내용을 입력하세요">
		            		</div>
		            	</td>
		            	<td colspan="2"> 
		            		<a href="#" data-no="${cNo}" class="btn btn-success btn-sm update" role="button">수정</a>
		            		<a href="#" data-no="${cNo}" class="btn btn-warning btn-sm cancel" role="button">취소</a>
		            	</td>
		            </tr>`;
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

function makeCommentList(list) {
	$tbl = $("<table></table>");
	$.each(list, (i, c) => {
		var date = new Date(c.regDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + toPad(date.getHours()) + ":"
		         + toPad(date.getMinutes()) + ":"
		         + toPad(date.getSeconds());
		$tbl.append(
		    `<tr id="row${c.commentNo}">
			    <td>${c.writer}</td>
			    <td>${c.content}</td>
			    <td>${time}</td>
			    <td><a href="#" data-no="${c.commentNo}" class="del">삭제</a>	
			  	    <a href="#" data-no="${c.commentNo}" class="mod">수정</a>	
			    </td>
		    </tr>`		
		);
	});
	$("#commentList").html($tbl);
}