//window.onload = function() { //실행될 코드 }

	let cnt = 0
	let dc = 0
	let cno;
	
	$(".con-box").on("click",".coupon-ch",(e)=> {
		let ch = $(".coupon-ch").is(":checked")
		let discount = $(".coupon-ch:checked").val()
		let allprice = `\\ ${p-discount+2500}`
			
			if(ch) {
				cnt += 1  
				cno = $(".coupon-ch:checked").siblings(".couponNo").val()
				let v = `(-) ${discount}`
					dc = discount;
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

// 주소 입력 api (다음)
function DaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.

			$("#zipcode").val(data.zonecode); //5자리 기초구역번호 사용
			$("#address1").val(fullAddr);

			// 커서를 상세주소 필드로 이동한다.
			$("#address2").focus();
		}
	}).open();
}		


$(".con-box").on("click","#paymentBtn",(e)=>{
	let pay = $(".payment").val();
//배송/종합 테이블 넣을값
	let name = $("#name").val();
	let phone = $("#phone").val();
	let email = $("#email").val();
	let zipcode = $("#zipcode").val();
	let address1 = $("#address1").val();
	let address2 = $("#address2").val();
	let content = $("#content").val();
	sendData = {
				orderId:oid,
				name:name,
				phone:phone,
				email:email,
				zipcode:zipcode,
				address1:address1,
				address2:address2,
				content:content,
				couponDc:dc,
				pay:pay,
				couponNo:cno
			}
	$.ajax({
		
		url:"payment.do",
		data:sendData,
		async: false,
		success:() => {
			alert("결제되었습니다.")
			location.href = "/petmee/main.do";
			}
	})
}) 




