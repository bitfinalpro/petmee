$("#inputbutton").click((e)=>{
    location.href = "#inputpopup";
});
$("#outputbutton").click((e)=>{
    location.href = "#outputpopup";
});
$("#regNdel").click((e)=>{
    location.href = "#registerpopup";
});
$("#completebtn1").click((e)=>{
    alert("요청이 완료되었습니다.");
    location.href = "#";
});
$("#completebtn2").click((e)=>{
    alert("요청이 완료되었습니다.");
    location.href = "#";
});
$("#completebtn3").click((e)=>{
    alert("요청이 완료되었습니다.");
    location.href = "#";
});
$("#checkallbutton").click((e)=>{
	 $("input[type=checkbox]").prop("checked",true);
});
$("#checkall").click(function(){        
	  if($("#checkall").prop("checked")) {
	     $("input[type=checkbox]").prop("checked",true);
	} else {$("input[type=checkbox]").prop("checked",false); }
	 })
	 $("#cancelchoice").click((e) => {
	    $("input[type=checkbox]").prop("checked",false);
	 });

//$("#selectDelete").on("click", "a.del", (e) => {
//	$.getJSON({
//		url: "delete.do",
//		data: {productId: $(e.target).data("id")},
//		success: list => makeProductList(list);
//	});
//})
//
//
//function makeProductList(list){
//	 let head = `<thead>
//                  <tr>
//                    <th><input type="checkbox" id="checkall" value="0"/> 제품번호</th>
//                    <th>상품명</th>
//                    <th>대상</th>
//                    <th>분류</th>
//                    <th>가격</th>
//                    <th>재고량</th>
//                    <th>제조사</th>
//                    <th>삭제</th>
//                  </tr>
//                </thead>
//                <tfoot>
//                    <tr>
//                      <th colspan="7"><button id="checkallbutton">전체선택</button><button id="cancelchoice">선택해제</button><button id="cancelorder">주문 취소</button></th>
//                    </tr>
//                  </tfoot>`;
//	 	$di = $("<tbody></tbody>")
//		$.each(list, (i, p) => {			
//			$di.append(
//			    `<tr>
//                    <td><input type="checkbox" name="a" value=""/> &nbsp ${p.productId}</td>
//                    <td>${p.productName}</td>
//                    <td><c:if test="${p.animalNo == 1}">강아지</c:if><c:if test="${p.animalNo == 2}">고양이</c:if></td>
//                    <td>
//                    	<c:if test="${p.categoryNo == 1}">의류</c:if>
//                    	<c:if test="${p.categoryNo == 2}">식품</c:if>
//                    	<c:if test="${p.categoryNo == 3}">식기/주거</c:if>
//                    	<c:if test="${p.categoryNo == 4}">장난감</c:if>
//                    	<c:if test="${p.categoryNo == 5}">위생</c:if>
//                     </td>
//                    <td><fmt:formatNumber value="${p.price}" pattern="###,###,###"/></td>
//                    <td>${p.stock}</td>
//                    <td>${p.company}</td>
//                    <td><a href="delete.do" id="selectDelete" data-id="${p.productId}">삭제</a></td>
//                  </tr>`		
//			);
//		});
//	 	let result = head + $di;
//		$("#dataTable").html(result);
//}
let product = new Map();
let registerList = [];
$("#listupbtn").click(() => {
	product.set("categoryNo", $("input[name=category]").val());
	product.set("productName", $("input[name=productname]").val());
	product.set("productNo", $("input[name=productno]").val());
	product.set("productPrice", $("input[name=productprice]").val());
	product.set("company", $("input[name=company]").val());
});
