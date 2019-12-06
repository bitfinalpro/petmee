$(() => {
	
	$("#y-con-content").on("click", ".y-delete",(e) => {
		console.log($(e.target).data("no"));
		$.ajax({
			url: "deletelist.do",
			data: {no: $(e.target).data("no")},
			success: (list) => makeList(list)
		});
	});
	
	$("#y-alldelete").click(() => {
		$.ajax({
			url: "alldeletelist.do",
			success: (list) => makeList(list)
		});
	});
});


$("#y-con-content").on("click",".plus",(e)=>{
	$.ajax({
		url: "updateamount.do",
		data: {amount: $(e.target).data("amount")+1,no: $(e.target).data("no")},
		success: (list) => {console.log("업데이트 성공");makeList(list);}
	});
});

$("#y-con-content").on("click",".minus",(e)=>{
	if($(e.target).data("amount")-1 <=0) {
		alert("최소갯수입니다.");
	}
	
	if($(e.target).data("amount")-1 >0)	{
		$.ajax({
		url: "updateamount.do",
		data: {amount: $(e.target).data("amount")-1,no: $(e.target).data("no")},
		success: (list) => {console.log("업데이트 성공");makeList(list);}
		});
	}
});

function makeList(list) {
	$tbl = $('<div class="y-con-content"></div>');
	$.each(list, (i, list) => {
		$tbl.append(
				
				`
			<c:set scope="page" var="sum" value="0" />
			<c:forEach var="list" items="${list}" varStatus="status">
			<c:set scope="page" var="price" value="${list.price*list.amount}" />
			`
				)
		,
		
		$tbl.append('<c:set scope="page" var="sum" value="${sum + price}" />')
			,
			
		$tbl.append(`
		<div class="y-content-box">
					<div class="floatbox">

						<div>
							<img class="y-img float-l" src="" />
						</div>
						<div class="y-list-content float-l">${list.explain}</div>
						<div class="y-check-del-box float-r">
							<div class="y-delbox">
								<i class="fas fa-times fa-2x mousepoint y-delete" data-no="${list.no}" ></i>
							</div>
						</div>
					</div>

					<div class="y-amountbox ">
						<div class="y-s-amount">
							<i class="far fa-plus-square fa-2x mousepoint plus" data-amount="${list.amount }" data-no="${list.no}"></i> 
							<span class="y-amount">${list.amount}</span> 
							<i class="far fa-minus-square fa-2x mousepoint minus" data-amount="${list.amount }" data-no="${list.no}"></i>
						</div>
						<span class="y-price float-r"> `),
			$tbl.append('<i class="fas fa-won-sign fa-lg"></i> ${price}'),
						
			$tbl.append(`
						</span>
					</div>
				</div>
				
			</c:forEach>
			`
		)
	});
	$("#y-con-content").html($tbl);
	
}

	












