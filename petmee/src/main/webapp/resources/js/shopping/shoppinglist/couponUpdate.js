
$("#couponbtn").click((e) => {
	console.log($("#couponNo").val());
	$.ajax({
		url: "ajaxUpdateCoupon.do",
		data: {no: $("#couponNo").val() },
//		async: false,
		success: (map) => {
			if(map['state'] == 0) {
					alert("사용중인 쿠폰입니다.");
				}else{
					makeList(map['clist'])
				}
			}
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
					<input type="hidden" class="couponNo" value="${coupon.no}">
					</div>
		`;
	});
	
	$("#coupon-list").html(make);
	
}











