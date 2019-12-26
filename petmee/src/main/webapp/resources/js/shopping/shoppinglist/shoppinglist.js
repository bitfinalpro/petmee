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
	console.log($(e.target).data("oriprice"))
	$.ajax({
		url: "updateamount.do",
		data: {amount: $(e.target).data("amount")+1,no: $(e.target).data("no"),oriprice: $(e.target).data("oriprice")},
		success: (list) => {
			console.log("업데이트 성공");
			makeList(list);
			}
	});
});

$("#y-con-content").on("click",".minus",(e)=>{
	console.log($(e.target).data("oriprice"))
	if($(e.target).data("amount")-1 <=0) {
		alert("최소갯수입니다.");
	}
	
	if($(e.target).data("amount")-1 >0)	{
		$.ajax({
		url: "updateamount.do",
		data: {amount: $(e.target).data("amount")-1,no: $(e.target).data("no"),oriprice: $(e.target).data("oriprice")},
		success: (list) => {console.log("업데이트 성공");makeList(list);}
		});
	}
});

function makeList(list) {
	$tbl = $('<div class="y-con-content"></div>');
	let a;
	let sum = 0;
	$.each(list, (i, list) => {
		
		let price = `${list.price}`
			sum += parseInt(price);
			
		$tbl.append(`
				<div class="y-content-box">
					<div class="floatbox">

						<div>
							<img class="y-img float-l" src="" />
						</div>
						<div class="y-list-content float-l">${list.subTitle}</div>
						<div class="y-check-del-box float-r">
							<div class="y-delbox">
								<i class="fas fa-times fa-2x mousepoint y-delete" data-no="${list.no}" ></i>
							</div>
						</div>
					</div>

					<div class="y-amountbox ">
						<div class="y-s-amount">
							<i class="far fa-plus-square fa-2x mousepoint plus" data-amount="${list.amount }" data-no="${list.no}" data-oriprice="${list.oriprice - list.dcprice}" ></i> 
							<span class="y-amount">${list.amount}</span> 
							<i class="far fa-minus-square fa-2x mousepoint minus" data-amount="${list.amount }" data-no="${list.no}" data-oriprice="${list.oriprice - list.dcprice}" ></i>
						</div>
						<span class="y-price float-r"> 
						<i class="fas fa-won-sign fa-lg"></i> <span class="price">${list.price}</span>
						</span>
					</div>
				</div>
		`);
				
			
//		$(".price").html(price);
	});
	
	$("#sum").html(sum);
	$("#sum1").html(sum+2500);
	$("#y-con-content").html($tbl);
	
}

$("#y-con-button").on("click", "#paymentbtn",(e) => {
	if($(".price").val() == undefined) {
		alert("구매할 상품이 없습니다.")
	}else{
		location.href = "/petmee/shop/shoppinglistdetail/shoppinglistdetail.do";
	}
});







