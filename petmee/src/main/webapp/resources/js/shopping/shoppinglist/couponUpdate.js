
$("#couponbtn").click((e) => {
	console.log($("#couponNo").val());
	$.ajax({
		url: "ajaxUpdateCoupon.do",
		data: {no: $("#couponNo").val() },
//		async: false,
		success: (list) => makeList(list)
	});
});
	


function makeList(list) {
	let make = '';
	$.each(list, (i, coupon) => {
		
		make += `
					<div class="coupon">
						<div>${coupon.name }</div>
						<div>${coupon.regdate} 까지</div>
						<div>(-)${coupon.discount }</div>
					<input type="checkbox" name="coupon" class="coupon-ch" value="${coupon.discount }"  >
					</div>
		`;
	});
	
	$("#coupon-list").html(make);
	
}











