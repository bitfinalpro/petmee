<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="<c:url value="/resources/css/common/gnb.css" />">
  <script src="<c:url value="/resources/js/common/jquery-1.12.4.js" /> "></script>
  <link href="../resources/css/common/base.css" rel="stylesheet">
  <link href="../resources/css/qna/style.css" rel="stylesheet"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <title>Pet Me</title>
</head>
<script type="text/javascript">
    $(document).ready(function(){
       $("#header").load("menu.html")    
    });
    $(document).ready(function(){
       $("#footer").load("footer.html")    
    });
</script>
<body>
<div id="header">
        <%@include file="/WEB-INF/include/menu.jsp" %>
    </div>
       
  <div>
    <section class="qna-content" style="margin-bottom:0">

        <h1 class="qna-title">질문 답변</h1>
       <div class="qna-table_write">
 <form method='post' action="qna-write.do" name="writeForm" > 
 <div>
     제목 :<br> <input type='text' name='title' size='70' placeholder="20자 까지 가능합니다" />	 	
 </div>
 <div>
     글쓴이 :${qnaWriter} <input type='hidden' value="${qnaWriter}" name='writer' size='30' />
 </div> 
 <div>
          내용 :<br> <textarea name='content' rows='7' cols='70' placeholder="500자 까지 가능합니다" ></textarea>
 </div>
          <a class="qna-write_do" > 
             <button type='submit'>등록</button>
          </a> 
</form>
          </div>
          <div class="qna-to_list"><button type="button" onclick="location.href='<c:url value="/qna/qna-list.do"/>'">목록으로</button></div>
        
    </section>
</div>
<div id="footer" class="footer_wrap clearfix"> 
<%@include file="/WEB-INF/include/footer.jsp" %> 
</div>
</div>
</body>
</html>