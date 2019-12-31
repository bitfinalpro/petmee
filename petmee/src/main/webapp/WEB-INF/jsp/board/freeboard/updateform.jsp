<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/free/freeupdate.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/dist/summernote-lite.css" />">
<script src="<c:url value="/resources/css/dist/summernote-lite.js" />"></script>

<script>
 function check() {
	var title = document.create.title;
	var content = document.create.content;
	  
	if(title.value=="") {
		alert("수정된 제목을 입력해주세요.");
		title.focus();
		return false;
	}else if(content.value=="") {
		alert("수정된 내용을 입력해주세요.");
		content.focus();
		return false;
	}else {
		alert("글이 수정되었습니다.");
		return true;
	  }
  }
</script>
</head>
<body>
   <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>

    <section id="wrap">
        <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;">
         <form name="create" method="post" action="update.do" id="" onsubmit="return check()">
         <input type="hidden" name="no" value="${board.no}" />
        <div class="wirte_form">
             <input type="text" name="title" id="title" placeholder="제목을 입력해 주세요!" maxlength="29" value='<c:out value="${board.title}" /> '> 
            <input type="hidden" name="email" id="email" maxlength="29" value="${user.name}"/>
            <textarea name="content" id="summernote"><c:out value="${board.content}" /></textarea>
            <div class="files">
                <div><i class="fas fa-download"></i></div>
                <div><input type="file" /></div>
            </div>
            <div class="files">
                <div><i class="fas fa-download"></i></div>
                <div><input type="file" /></div>
            </div>
            <div class="files">
                <div><i class="fas fa-download"></i></div>
                <div><input type="file" /></div>
            </div>
            <div class="btn">
                <button type="submit">수정</button>
                <button>취소</button>
            </div>
        </div>
         </form>
    </section>  
    <script>
    
    $(function(e) {
    	$("p").replaceWith(" ");
    });
    $('#summernote').summernote({
        placeholder: '<br>※ 게시판 용도와 무관하거나 아래 내용이 포함된 경우는 사전 안내없이 삭제/제재됩니다.<br><br>- 욕설, 상대 비방 등 타인의 명예를 훼손하는 게시물 <br><br>- 불쾌감을 줄 수 있는 이미지나 내용, 저작권에 위배되는 게시물 <br><br>- 개인정보 노출이 있거나 현금 거래 시도 등에 준하는 행위 ',
        tabsize: 2,
        height: 500,
        minHeight: null,   
        maxHeight: null,             
        focus: true 
      });
     </script>
  
     <div id="footer" class="footer_wrap clearfix">
        <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
     </div>

</body>
</html>



