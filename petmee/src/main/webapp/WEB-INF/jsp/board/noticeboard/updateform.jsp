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
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board/notice.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/dist/summernote-lite.css" />">
<script src="<c:url value="/resources/css/dist/summernote-lite.js" />"></script>
</head>
<body>
  <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    <section id="wrap">
        <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;">
         <form method="post" action="<c:url value="/board/noticeboard/write.do" />" id="">
        <div class="write_form">
        <h2>공지사항 글쓰기</h2>   
            <input type="text" name="title" class="write_input" placeholder="제목을 입력해 주세요!" maxlength="29" />
            <input type="checkbox" name="topChk" value="1" id="topchk" /> 공지
       		<input type="hidden" name="writer" value="기모찌" class="write_input" placeholder="작성자" />
            <textarea name="content" id="summernote"></textarea>
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
               <a href="<c:url value="/board/noticeboard/notice.do"/>"><button type="button">취소</button></a>
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
        <div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
</body>
</html>