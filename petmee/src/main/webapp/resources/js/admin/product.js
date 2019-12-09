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
let registerList = [];
let product = {};
$("#listupbtn").click((e) => {
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
	let result = "";
	for(let i = 0; i < registerList.length; i++) {
		result += registerList[i].productName;		
	}
	console.log(result);
	makeRegisterList();
	$("input").val("");	
	}
});
function makeRegisterList(){
	let query = "";	
	var categoryName = "";
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
	$("#registertbody").html(query);		
}
$("#completebtn1").click((e) => {
	
});