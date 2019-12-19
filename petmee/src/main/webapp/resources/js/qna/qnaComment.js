/**
 * 댓글 목록 가져오는 Ajax
 * @returns
 */
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				makeCommentList(list);
			}
		}
	};
	xhr.open("POST", "commentList.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	xhr.send(`qnaNo=${qnaNo}&cmtPageNo=${cmtPageNo}`);
	return false;
}
commentListAjax();

function makeCommentList(list) {
	let AjaxCmtList = document.getElementById("AjaxCmtList");
	AjaxCmtList.innerHTML = "";
	let html = "<div>";
	for (let i = 0; i < list[0].length; i++) {
		let comment = list[0][i];
		let pr = list[1][i];
		
			
		html += `
		
		<ul style="list-style:none"><h3>&nbsp;${comment.userId}</h3>
								  
		  <li>
			 <h6> ${comment.cmtRegDt}"</h6>
		  </li>
		  
		  <li>
		  
		`;
		
		if(comment.userNo == UserNo || UserGrade == 3) {
			let co = `${comment.cmtContent}`;
			co = co.trim();
			html +=`
			
			<a href="javascript:;" onclick="commentDeleteAjax(${comment.cmtNo}, ${comment.boardqnaNo}, ${pr.pageNo})">삭제</a>
			<a href="javascript:;" onclick="commentUpdateAjax(${comment.cmtNo}, '${co}')">수정</a>
			`
		}
		  
		  html +=`
		  </li> 
		  </ul>
		    <ul style='list-style:none;'>
			<li></li>
		    <li></li>
		    <li></li>
			  <li colspan="3" id="cmtUpdateBox${comment.cmtNo}">&emsp;${comment.cmtContent}</li>
		    </ul>
		  `;
		
	}
	html += "</div>";
	AjaxCmtList.innerHTML = html;
	// 삭제링크 이벤트 설정??
}

/**
 * 댓글 삭제
 * @returns
 */
function commentDeleteAjax(cmtNo, boardqnaNo, pageNo ) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				makeCommentList(list);
				
			}
		}
	};
	xhr.open("POST", "comment_delete.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	xhr.send(`qnaNo=${qnaNo}&pageNo=${cmtPageNo}&cmtNo=${cmtNo}`);
	return false;
}

/**
 * 댓글 등록 
 * @returns
 */
function commentRegistAjax() {
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				makeCommentList(list);
			}
		}
	};
	xhr.open("POST", "comment_regist.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	
	let f = document.writeForm;
	xhr.send(`boardqnaNo=${f.boardqnaNo.value}&userNo=${f.userNo.value}&cmtContent=${f.cmtContent.value}&pageNo={f.pageNo.value}`);
//	f.writer.value = "";
//	f.content.value ="";
	return false;
}

/**
 * 댓글 수정 
 * @returns
 */
function commentUpdateAjax(cmtNo) {
	id = "cmtUpdateBox" +  cmtNo + "";
	let AjaxUpdate = document.getElementById(id);
	let html = "";

	
	html += `
		<input type="hidden" name="cmtNo" value="${cmtNo}">
		<textarea id="cmtContent${cmtNo}" name="cmtUpdateContent" rows="2" cols="60"></textarea>
		<button onclick="inputCheck2(${cmtNo})" type="button">수정</button>
		<a href="javascript:;" onclick="commentListAjax()">취소</a>
	`;
	AjaxUpdate.innerHTML = html;
			
	
};
function commentUpdateDoAjax(cmtNo) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				makeCommentList(list);
				
				
			}
		}
	};
	xhr.open("POST", "comment_update.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	
	let f = document.updateForm;
	id = "cmtContent" +  cmtNo;
	let u = document.getElementById(id);
	let cmtContent = document.getElementById(`cmtContent${cmtNo}`).value;
	xhr.send(`boardqnaNo=${f.boardqnaNo.value}&cmtNo=${cmtNo}&cmtPageNo=${f.cmtPageNo.value}&cmtContent=${cmtContent}`);
	return false;
}

