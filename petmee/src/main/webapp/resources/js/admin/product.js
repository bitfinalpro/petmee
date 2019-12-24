$("#inputbutton").click((e)=>{
    location.href = "#inputpopup";
});
$("#outputbutton").click((e)=>{
    location.href = "#outputpopup";
});
$("#inputcouponbutton").click((e) => {
	location.href = "#inputcouponpopup";
});
$(".cancelModalbtn").click((e) => {
	location.href = "#";
});
//모달창 새로고침 금지 이벤트
$(".stopnofresh").click((e) => {
	function Reload(){
		event.cancelBubble = false;
		event.returnValue = true;
	}
	document.onkeydown = Reload;
});
//모달창 아웃시 새로고침 재기능
$(".nofresh").click((e) => {
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
//제품정보 변경
$(".updateInfo").click((e)=>{	
	e.preventDefault();	
	$.ajax({
		url: "updateModal.do",
	   data: {productId: $(e.target).data("no")},
	   async: false,
	   success: result => {
		   let query = `
		   <div>품번 : <input type="text" id="updateId" name="productId" value="${result.productId}"/></div>                            
                        <div>상품명 : <input type="text" id="updateName" name="productName" value="${result.productName}"/></div>
                        <div>판매대상 : <select name="animalNo">
                        <c:choose>
                        	<c:when test="${result.animalNo == 1}">
                        		<option value="1" selected>강아지</option>
                        		<option value="2">고양이</option>
                        	</c:when>
                        	<c:otherwise>
                        		<option value="1">강아지</option>
                        		<option value="2" selected>고양이</option>                        	</c:otherwise>
                        </c:choose>
                        </select>
                        </div>
                         <div>
                          분류: <select name="categoryNo" id="selectCategory">
                          `;		   
			   			  for(let i = 1; i <= document.getElementById("cList").value; i++){
			   				  let categoryName = ""; 
			   				  switch(i) {
			   				  case 1: categoryName = "의류"; break;
			   				  case 2: categoryName = "식품"; break;
			   				  case 3: categoryName = "식기/주거"; break;
			   				  case 4: categoryName = "장난감"; break;
			   				  case 5: categoryName = "위생"; break;
			   				  }
			   				  if(result.categoryNo === i) {
			   					  query += `<option value="` + i + `" selected>` + categoryName +`</option>` ;		   					  
			   				  } else {
			   					query += `<option value="` + i + `">` + categoryName +`</option> `; 
			   				  }
			   			  };                          
                          query += `
                          </select>
                        </div>              
                        <div>가격 : <input type="text" name="price" value="${result.price}"/></div>
                        <div>상품설명 : <input type="text" name="productInfo" value="${result.productInfo}"/></div>
                        <div>제조사 : <input type="text" name="company" value="${result.company}"/></div>
                        <div>재고량 : <input type="number" name="stock" value="${result.stock}"/></div>
                        <div>판매상태 :
                        <select name="sellCondition">`;
                        switch(result.sellCondition) {
                        case 0 : 
                        query += `
                        		<option value="0" selected>품절</option>
                        		<option value="1">판매대기중</option>
                        		<option value="2">판매중</option>
                        `;
                        break;
                        case 1 : 
                        query += `
                        		<option value="0" >품절</option>
                        		<option value="1" selected>판매대기중</option>
                        		<option value="2">판매중</option>
                        `;
                        break;
                        default : 
                        query += `
                        		<option value="0" >품절</option>
                        		<option value="1">판매대기중</option>
                        		<option value="2" selected>판매중</option>
                        `;
                        break;
                        }
                        
                 query +=`                    
                        </select>                        
                        </div>   
                        <div><input type="hidden" name="orgProductId" value="${result.productId}"/></div>
                        <button id="updateCompletebtn" class="stopnofresh">완료</button>                     
		   `;
		   $("#updateForm").html(query);		   
	   }
	})	
	location.href = "#updatepopup";	
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
function check() {
	console.log("넘어옴");	
	let con = confirm("상품명 : " + $("input[name=productName]").val() + "\n품번 : " + $("input[name=productId]").val()
			+ "\n가격 : " + $("input[name=price]").val() + "\n제조사 : " + $("input[name=company]").val() 
			+"\n분류 : " + $("select[name=categoryNo] option:checked").text() + "\n판매대상 : " + $("select[name=animalNo] option:checked").text()
			+ "\n상품설명 : " + $("input[name=productInfo]").val() + "\n판매상태 : " + $("select[name=sellCondition] option:checked").text());
	if(con) {return true;}
	return false;
}
let registerList = [];
var inputList = [];
let couponList = [];
let product = {};

//제품등록 리스트업 버튼 이벤트
$("#registerlistupbtn").click((e) => {
	if($("input[name=productName]").val() === "" ||
	   $("input[name=productId]").val() === "" ||
	   $("input[name=price]").val() === "" ||
	   $("input[name=stock]").val() === ""||
	   $("input[name=productInfo]").val() === ""||
	   $("input[name=productfile]").val() === ""||
	   $("input[name=boardfile]").val() === ""||
	   $("input[name=company]").val() === ""
	) {alert("등록할 제품의 정보를 모두 기입해주세요.");
	   e.preventDefault();
	}
	else{	
	product = {
			categoryNo: $("select[name=categoryNo]").val(),
			sellCondition: $("select[name=sellCondition]").val(),
			animalNo: $("select[name=animalNo]").val(),
			productName: $("input[name=productName]").val(),
			productId: $("input[name=productId]").val(),
			price: $("input[name=price]").val(),
			stock: $("input[name=stock]").val(),
			productInfo: $("input[name=productInfo]").val(),
			productfile: $("input[name=productfile]").val(),
			boardfile: $("input[name=boardfile]").val(),
			company: $("input[name=company]").val()
	};	
	registerList.push(product);
	makeList("register");
	$("input").val("");	
	}
});
//쿠폰 리스트업 이벤트
$("#inputcouponlistupbtn").click((e) => {
	if( $("input[name=couponName]").val() === "" ||
	    $("input[name=couponNo]").val() === "" ||
	    $("input[name=couponDiscount]").val() === "" ) {
		alert("쿠폰등록에 필요한 정보를 모두 기입하세요.");
		return;
	}
	let coupon = {
			name: $("input[name=couponName]").val(),
			no: $("input[name=couponNo]").val(),
			discount: $("input[name=couponDiscount]").val()
	}
	console.log("aaa");
	$.ajax({
		url: "checkCoupon.do",
		type: "post",
		async: false,
		data: coupon,
		success: result => {
			console.log("bbb");
			switch (result) {
			case 0:
				couponList.push(coupon);
				makeList("coupon");				
				return;
			case 1: 
				alert("이미 같은 이름의 쿠폰이 존재합니다"); 
				$("input[name=couponName]").focus();
				return;
			case 2:
				alert("이미 같은 번호의 쿠폰이 존재합니다"); 
				$("input[name=couponNo]").focus();
				return;
			case 3: 
				alert("이미 같은 이름,번호의 쿠폰이 존재합니다"); 
				$("input[name=couponName]").focus();
				return;
			}
		}		
	});
	
});
//제품입고 리스트업 버튼 이벤트
$("#inputlistupbtn").click((e) => {
	if($("input[name=productId]").val() === ""  ||
	   $("input[name=productcount]").val() === ""		
	) {alert("등록할 제품의 정보를 모두 기입해주세요.");
	e.preventDefault();
	}
	else if($("input[name=productcount]").val() < 1){
		alert("제품은 1개이상 가능합니다.");
		$("input[name=productcount]").focus();
		e.preventDefault();
	}
	else{
		$.ajax({
			url: "input_list.do",
		    data: {productId: $("input[name=productId]").val()},
		    success: result => {
		    	result.productCnt = $("input[name=productcount]").val();
		    	if(result.productName === undefined) {
		    		alert("존재하지 않는 제품입니다.");
		    		$("input[name=productId]").focus();
		    		return;
		    	};
		    	inputList.push(result);
		    	makeList("input");
				$("input").val("");
		    }		    
		});		
			
	}
});
//제품출고 리스트업 버튼 이벤트
$("#outputlistupbtn").click((e) => {
	if($("input[name=outproductId]").val() === ""  ||
			$("input[name=outproductcount]").val() === ""		
	) {alert("등록할 제품의 정보를 모두 기입해주세요.");
	e.preventDefault();
	}
	else if($("input[name=outproductcount]").val() < 1){
		alert("제품은 1개이상 가능합니다.");
		$("input[name=outproductcount]").focus();
		e.preventDefault();
	}
	else{
		$.ajax({
			url: "input_list.do",
			data: {productId: $("input[name=outproductId]").val()},
			success: result => {
				result.productCnt = $("input[name=outproductcount]").val();
				if(result.productName === undefined) {
					alert("존재하지 않는 제품입니다.");
					$("input[name=outproductId]").focus();
					return;
				} else if (result.stock < $("input[name=outproductcount]").val()) {
					alert("출고량이 재고량보다 많습니다.");
					$("input[name=outproductcount]").focus();
					return;
				}
				inputList.push(result);
				makeList("output");
				$("input").val("");
			}		    
		});		
		
	}
});
//제품 등록, 입고, 출고 리스트
function makeList(msg){
	let query = "";	
	var categoryName = "";
	var animal = "";
	var sellCondition = "";
	if(msg === "coupon") {
		for(let i = 0; i < couponList.length; i++) {
			query += `
				<tr>
					<td>${couponList[i].name}</td>
					<td>${couponList[i].no}</td>
					<td>${couponList[i].discount}</td>
				</tr>
			`;
		}
		console.log("ddd");
		$("#inputcouponTbody").html(query);
		$("input").val(""); return;
	}
	if(msg === "register"){
	for(let i = 0; i < registerList.length; i++) {
		switch(registerList[i].categoryNo) {
		case "1" : categoryName = "의류"; break;
		case "2" : categoryName = "식품"; break;
		case "3" : categoryName = "식기/주거"; break;
		case "4" : categoryName = "장난감"; break;
		case "5" : categoryName = "위생"; break;
		}
		switch(registerList[i].sellCondition) {
		case "0" : sellCondition = "판매대기중"; break;
		case "1" : sellCondition = "판매중"; break;
		case "2" : sellCondition = "품절"; break;
		}
		if(registerList[i].animalNo === 1) {
			animal = "강아지";
		} else {animal = "고양이";}
		query +=`
		<tr>
			<td>${categoryName}</td>
            <td>${registerList[i].productName}</td>
            <td>${registerList[i].productId}</td>
            <td>${registerList[i].price}</td>
			<td>${sellCondition}</td>
			<td>${animal}</td>
			<td>${registerList[i].stock}</td>
		    <td>${registerList[i].company}</td>
			<td>${registerList[i].productInfo}</td>
			<td>${registerList[i].productfile}</td>
			<td>${registerList[i].boardfile}</td>
        </tr>`;			
	} $("#registertbody").html(query);
  }	else if (msg === "input" || msg === "output"){
	  for(let i = 0; i < inputList.length; i++) {
			query +=`
			<tr>
	            <td>${inputList[i].productName}</td>
	            <td>${inputList[i].productId}</td>
	            <td>${inputList[i].productCnt}</td>
			    <td>${inputList[i].company}</td>
	        </tr>`;			
		}
	  if(msg === "input")	$("#inputTbody").html(query);		
	  else $("#outputTbody").html(query);		
  }
}
//등록 완료 버튼 클릭 이벤트
//$("#completebtn1").click((e) => {	
//	$.ajax({
//		url: "productRegister2.do",
//		dataType: "json",
//		contentType: "application/json",
//		type: "POST",
//		data: JSON.stringify(registerList),
//		success: () => {}
//	})
//	alert("제품등록이 완료되었습니다");
//	registerList = [];
//	location.href="product.do";
//});
//입고 완료 버튼 클릭 이벤트
$("#completebtn2").click((e) => {
	let userList = inputList;
	$.ajax({
		url: "plusCount.do",
		dataType: "json",
		contentType: "application/json",
		type: "POST",
		data: JSON.stringify(userList),
		success: () => {}
	})
	alert("제품입고가 완료되었습니다");
	inputlist = [];
	location.href="product.do";
});
//출고 완료 버튼 클릭 이벤트
$("#completebtn3").click((e) => {
	let userList = inputList;
	$.ajax({
		url: "minusCount.do",
		dataType: "json",
		contentType: "application/json",
		type: "POST",
		data: JSON.stringify(userList),
		success: () => {}
	})
	alert("제품출고가 완료되었습니다");
	inputlist = [];
	location.href="product.do";
});
//쿠폰등록 완료 이벤트
$("#couponcompletebtn").click((e) => {
	let userList = couponList;
	$.ajax({
		url: "registerCoupon.do",
		contentType: "application/json",
		type: "POST",
		data: JSON.stringify(userList),
		success: () => {}
	})
	alert("쿠폰등록이 완료되었습니다");
	couponList = [];
	location.href="product.do";
});
// 제품변경 완료 버튼 클릭 이벤트
$("updateCompletebtn").click((e) => {alert("변경이 완료되었습니다.")});
//선택항목삭제
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
		data: JSON.stringify(checkedbox),
		success: () => {}
	})
	location.href="product.do";
});
