$(() => {
	
	$("#y-con-content").on("click", ".y-delete",(e) => {
		console.log($(e.target).data("no"));
		console.log("에이작스 삭제 성공");
		
		$.getJSON({
			url: "deletelist.do",
			data: {no: $("#no").val()},
			success: (list) => makeList(list)
		});
	});
	
	// 로딩시 목록 호출
//	ListAjax();
});

/** 댓글 목록 가져오는 Ajax */
function ListAjax() {
	console.log("에이작스 로딩 성공");
	
	$.getJSON({
		url: "ajaxshoppinglist.do",
		success: list => makeList(list)
	});
}
	

function makeList(list) {
	$tbl = $('<div class="y-con-content">');
	$.each(list, (i, list) => {
		$tbl.append(
				
				`
				<c:set scope="page" var="sum" value="0" />
			
			<c:forEach var="list" items="${list}" varStatus="status">
			<c:set scope="page" var="price" value="${list.price}" />
			`
				)
		,
		
		$tbl.append('<c:set scope="page" var="sum" value="${sum + price}" />')
			,
			
		$tbl.append(`<div class="y-content-box">
					<div class="floatbox">

						<div>
							<img class="y-img float-l" src="" />
						</div>
						<div class="y-list-content float-l">${list.explain}</div>
						<div class="y-check-del-box float-r">
							<div>
								<i class="fas fa-times fa-2x mousepoint y-delete"></i>
								<input type="hidden" name="no" value="${list.no }">
							</div>
							<div>
								<input type="checkbox" id="y-allcheck" />
							</div>
						</div>
					</div>

					<div class="y-amountbox ">
						<div class="y-s-amount">
							<i class="far fa-plus-square fa-2x mousepoint "></i> <span
								class="y-amount">${list.amount}</span> <i
								class="far fa-minus-square fa-2x mousepoint"></i>
						</div>
						<span class="y-price float-r"> <i
							class="fas fa-won-sign fa-lg"></i> ${list.price }
						</span>
					</div>
				</div>
				
			</c:forEach>
			`
		)
	});
	$("#y-con-content").html($tbl);
	
}












