$("#inputbutton").click((e)=>{
    location.href = "#inputpopup";
});
$("#outputbutton").click((e)=>{
    location.href = "#outputpopup";
});
$("#regNdel").click((e)=>{
    location.href = "#registerpopup";
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

let registerList = [];
var inputList = [];
let product = {};

//제품등록 리스트업 버튼 이벤트
$("#registerlistupbtn").click((e) => {
	if($("input[name=productname]").val() === "" ||
	   $("input[name=productno]").val() === "" ||
	   $("input[name=productprice]").val() === "" ||
	   $("input[name=company]").val() === ""	   
	) {alert("등록할 제품의 정보를 모두 기입해주세요.");
	   e.preventDefault();
	}
	else{	
	product = {
			categoryNo: $("select[name=category]").val(),
			productName: $("input[name=productname]").val(),
			productId: $("input[name=productno]").val(),
			price: $("input[name=productprice]").val(),
			company: $("input[name=company]").val()
	};	
	registerList.push(product);
	makeList("register");
	$("input").val("");	
	}
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
		    	result.productCount = $("input[name=productcount]").val();
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
				result.productCount = $("input[name=outproductcount]").val();
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
	if(msg === "register"){
	for(let i = 0; i < registerList.length; i++) {
		switch(registerList[i].categoryNo) {
		case "1" : categoryName = "의류"; break;
		case "2" : categoryName = "식품"; break;
		case "3" : categoryName = "식기/주거"; break;
		case "4" : categoryName = "장난감"; break;
		case "5" : categoryName = "위생"; break;
		}
		query +=`
		<tr>
			<td>${categoryName}</td>
            <td>${registerList[i].productName}</td>
            <td>${registerList[i].productId}</td>
            <td>${registerList[i].price}</td>
		    <td>${registerList[i].company}</td>
        </tr>`;			
	}
  }	else if (msg === "input" || msg === "output"){
	  console.log("sdf");
	  for(let i = 0; i < inputList.length; i++) {
			query +=`
			<tr>
	            <td>${inputList[i].productName}</td>
	            <td>${inputList[i].productId}</td>
	            <td>${inputList[i].productCount}</td>
			    <td>${inputList[i].company}</td>
	        </tr>`;			
		}
  }
	if(msg === "input")	$("#inputTbody").html(query);		
	else $("#outputTbody").html(query);		
}
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
//선택항목삭제
$("#deleteSelected").click((e) => {
	console.log("aaa");
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