//모달창 새로고침 금지 이벤트
$(".stopnofresh").click((e) => {
	function Reload(){
		event.cancelBubble = false;
		event.returnValue = true;
	}
	document.onkeydown = Reload;
});
//모달창 아웃시 새로고침 재기능
$(".noRefresh").click((e) => {
	function doNotReload(){
	    if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
	    	keyCode = event.keyCode;
	        event.keyCode = 0;
	        event.cancelBubble = true;
	        event.returnValue = false;
	    } 
	}
	document.onkeydown = doNotReload;
});
//모달창 빠져나가기
$(".cancelModalbtn").click((e) => {
	location.href = "order.do";
});
//전체선택 체크박스
$("#checkall").click(function(){        
  if($("#checkall").prop("checked")) {
     $("input[type=checkbox]").prop("checked",true);
} else {$("input[type=checkbox]").prop("checked",false); }
 })
 //전체선택 버튼
 $("#checkallbutton").click((e)=>{
	 $("input[type=checkbox]").prop("checked",true);
});
 //선택취소
 $("#cancelchoice").click((e) => {
    $("input[type=checkbox]").prop("checked",false);
 });
//선택주문삭제
 $("#deleteSelected").click((e) => {
 	let checkedbox = [];
 	let checkboxes = document.querySelectorAll("input[name=choice]");
 	for(let i = 0; i < checkboxes.length; i++){
 		if(checkboxes[i].checked) {
 			checkedbox.push(checkboxes[i].value);
 		}
 	}
 	if (checkedbox.length === 0) {alert("체크된 제품이 없습니다."); return;}
 	$.ajax({
 		url: "deleteSelected.do",
 		dataType: "json",
 		contentType: "application/json",
 		async: false,
 		type: "POST",
 		data: JSON.stringify(checkedbox) 		
 	})
 	location.href="order.do";
 });
 //주문내역 상세 팝업
 $(".detailOrder").click((e) => {
	 e.preventDefault();	
		$.ajax({
			url: "detailOrder.do",
		   data: {orderId: $(e.target).data("no")},
		   async: false,
		   success: result => {
			   let query = `
			   <div>주문번호 : ${result.orderId}</div>                            
	           <div>주문회원 ID : ${result.userId}</div>
			   <div>연락처 : ${result.userPhoneNo}</div>
			   <div>주문날짜 : ${result.date}</div>
	           <div>결제방법 : ${result.paymentMethod}</div>
			   <div>배송지 : ${result.delieveryAddress}</div>
	           <div>배송상태 : ${result.delieveryStatus}</div>              
	           <div>요청사항  : ${result.orderRequest}</div>	                                 
			   <div>주문금액 : ${result.sumPrice}원</div>	                                 
			   <div>주문내역</div>
			   <div id="orderProducts">
				   ${result.orderedProduct}
			   </div>	                                 
			   `;
			   $("#orderbox").html(query);		   
		   }
		})	
		location.href = "#orderpopup";	
 });
 $(".delieveryStatus").change((e) => {
	 $.ajax({
		url: "updateStatus.do",
		data: {orderId: $(e.target).data("no"), delieveryStatus: $(e.target).val()},
	 	success: result => {
	 		console.log($(e.target).siblings().html());
	 		if($(e.target).data("status") === result) {$(e.target).siblings().html(""); return;}
	 		$(e.target).siblings().html("▶변경");
	 	}
	 });
 });