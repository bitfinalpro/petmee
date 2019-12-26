function popup(email, name, resident, address, phone, gender, age, stringUserDate) {
	$("#email").text(email);
	document.location.href="#popup";
	$("#name").text(name);
	document.location.href="#popup";
	$("#resident").text(resident);
	document.location.href="#popup";
	$("#address").text(address);
	document.location.href="#popup";
	$("#phone").text(phone);
	document.location.href="#popup";
	$("#gender").text(gender);
	document.location.href="#popup";
	$("#age").text(calcAge(resident));
	document.location.href="#popup";
	$("#regDate").text(stringUserDate);
	document.location.href="#popup";
}

// 주민번호를 받아서 나이 계산하기
function calcAge(resident) {
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1);
	var day = date.getDate();
	if (month < 10 ) month ='0' + month;
	if (day < 10) day = '0' + day;
	var monthDay = month+day;
	resident = resident.replace('-','');
	var residenty = '19'
		residenty += resident.substr(0, 2);
	console.log(residenty)
	var residentmd = resident.substr(4, 4);
	//941221-1000000
	var age = monthDay < residentmd ? (year - residenty) + 1 : (year - residenty);
	return age;
}

// 총 구매금액
function totalPrice() {
	
	
}
// 총 구매횟수
function totalPurchaseCount() {
	
}