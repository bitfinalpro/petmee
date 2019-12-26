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
                        <li><strong>내  용</strong>  : <div id="com_content" class="userbox">${result.content}</div></li>
                </ul>
                <input type="hidden" id="reportEmail1" value="${result.email}"/>
                <input type="hidden" id="commentNo" value="${result.commentNo}"/>
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
	$.ajax({
		url: "search.do",
		data: {keyword: key, searchText: val},
		success: result => {
			let query = `
			<colgroup>
                <col width=7%;>
                <col width=50%;>
                <col width=7%;>
                <col width=10%;>
                <col width=7%;>
                <col width=10%;>
            </colgroup>
            <tr>
                <th>NO</th>
                <th>TITLE</th>
                <th>WRITER</th>
                <th>DATE</th>
                <th>VIEW</th>
            </tr>
			`;
			if (result.length == 0) {
				query += ` <tr><td colspan="5">게시물이 없습니다.</td></tr>`;}
			else{
				for (let i = 0; i < result.length; i++){
				query += `
					<tr>
						<td>${result[i].no}</td>
						<td><a href="detail.do?no=${result[i].no}&keyword=${key}&searchText=${val}">${result[i].title}</a></td>
						<td>${result[i].email}</td>
						<td><i class="far fa-clock"></i> ${result[i].stringDate}</td>
						<td><i class="far fa-eye"></i> ${result[i].viewCnt}</td>
					</tr>
				`;	
				}
			}
			$(".notice_tb").html(query);
		}
	})	
});