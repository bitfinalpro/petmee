function popup(email, name, resident, address, phone, gender, age) {
/*	let name = document.getElementById("name");
	let email = document.getElementById("email");
	let resident = document.getElementById("resident");
	let gender = document.getElementById("gender");
	let address = document.getElementById("address");
	let phone = document.getElementeById("phone");*/

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
	
}

// 주민번호를 받아서 나이 계산하기

function age(resident) {
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1);
	var day = date.getDate();
	if (month < 10 ) month ='0' + month;
	if (day < 10) day = '0' + day;
	resident = resident.replace('-','').replace('-','');
	var residenty = resident.substr(0, 4);
	var residentmd = birth.substr(4, 4);
	var age1 = monthDay < residentmd ? year - residenty - 1 : year - residenty;
	
	return age1;
}