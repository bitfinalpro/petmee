window.onload = function() { //실행될 코드 }

	let cnt = 0
	
	$("#coupon-list").on("click",".coupon-ch",(e)=> {
		alert("먹고있느ㄴ중")
		let ch = $(".coupon-ch").is(":checked")
		let discount = $(".coupon-ch:checked").val()
		let allprice = `\\ ${p-discount}`
			if(ch) {
				cnt += 1  
				let v = `(-) ${discount}`
					$('#discount > span:nth-child(2)').html(v);
				$("#p-price").html(allprice);
			}
		if(ch == false) {
			cnt -= 1
			$('#discount > span:nth-child(2)').html(`(-) 0`);
			$("#p-price").html(p);
		}
		if(cnt > 1) {
			alert("하나만 선택가능합니다.")
			$(".coupon-ch").prop("checked", false);
			cnt = 0;
			$('#discount > span:nth-child(2)').html(`(-) 0`);
			$("#p-price").html(p);
		}
	})
}




