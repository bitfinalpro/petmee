//window.onload = function() { //실행될 코드 }

	let cnt = 0
	let dc = 0
	let cno;
	
	$(".con-box").on("click",".coupon-ch",(e)=> {
		let ch = $(".coupon-ch").is(":checked")
		let discount = $(".coupon-ch:checked").val()
		let allprice = `\\ ${p-discount}`
			
			if(ch) {
				cnt += 1  
				cno = $(".coupon-ch:checked").siblings(".couponNo").val()
				let v = `(-) ${discount}`
					dc = discount;
					$('#discount > span:nth-child(2)').html(v);
					$("#p-price").data("sum",p-discount+2500)
				$("#p-price").html(allprice);
			}
		if(ch == false) {
			cnt -= 1
			$('#discount > span:nth-child(2)').html(`(-) 0`);
			$("#p-price").html(`\\ ${p}`);
		}
		if(cnt > 1) {
			alert("하나만 선택가능합니다.")
			$(".coupon-ch").prop("checked", false);
			cnt = 0;
			$('#discount > span:nth-child(2)').html(`(-) 0`);
			$("#p-price").html(`\\ ${p}`);
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
	
function payments() {
	//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
	BootPay.request({
		price: `$("#p-price").data("sum")`, //실제 결제되는 가격
		application_id: "5e096cdd0627a8002d6829e1",
		name: '블링블링 마스카라', //결제창에서 보여질 이름
		pg: '',
		method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		items: [
			{
				item_name: '나는 아이템', //상품명
				qty: 1, //수량
				unique: '123', //해당 상품을 구분짓는 primary key
				price: 1000, //상품 단가
				cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
				cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
				cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
			}
		],
		user_info: {
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
		order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
		account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
		extra: {
		    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
			end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
	        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
	        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
		}
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log(data);
	}).cancel(function (data) {
		//결제가 취소되면 수행됩니다.
		console.log(data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log(data);
	}).confirm(function (data) {
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
		console.log(data);
		var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
		if (enable) {
			BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
		} else {
			BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		}
	}).close(function (data) {
	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	    console.log(data);
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
		console.log(data);
	});
	}
	
/*
	$("#p-box2").on("click","#sd",(e)=>{
		console.log($("#p-price").data("sum"));
	});
*/
	$(".con-box").on("click","#paymentBtn",(e)=>{
		payments();
		
	let pay = $(".payment").val();
//배송/종합 테이블 넣을값
	let name = $("#name").val();
	let phone = $("#phone").val();
	let email = $("#email").val();
	let zipcode = $("#zipcode").val();
	let address1 = $("#address1").val();
	let address2 = $("#address2").val();
	let content = $("#content").val();
	let allDprice = $("#p-price").data("sum");
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
				couponNo:cno,
				allDprice:allDprice
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




