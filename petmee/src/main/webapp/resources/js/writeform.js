 function check() {
	  var title = document.create.title;
	  var content = documen.create.content;
	  
	  if(title.value=="") {
		  alert("제목을 입력해주세요.");
		  title.focus();
		  return false;
	  }else if(content.value="") {
		  alert("내용을 입력해주세요.");
		  content.focus();
		  return false;
	  } else {
		  alert("글이 등록되었습니다.");
		  return true;
	  }
  }