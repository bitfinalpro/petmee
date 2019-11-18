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
  <link href="../resources/css/common/base.css" rel="stylesheet">
  <script src="<c:url value="/resources/js/common/jquery-1.12.4.js" /> "></script>
    <link href="../resources/css/free/detail.css" rel="stylesheet">
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
<section>
    <div class="body">
        <div class="background">
            <h2 class="free"><i class="fas fa-users"></i> 자유게시판</h2>
        </div>
    </section>
<section id="layout">
        <div class="freeboard">
            <div class="board_list">
                 <div id="types"> 
                       <div class="ll">
                           <div class="left" style="font-size: 24px;">집에가고싶다</div>     
                           <div class="right" style="font-size: 16px;"><i class="far fa-clock"></i> 2019.11.12 16:53</div>
                        </div> 
                </div>
                <div id="types1"> 
                    <div class="ll">
                          <div class="left" style="margin-top: 3px;"><i class="far fa-user"></i> 유휘준</div>
                          <div class="right"><i class="far fa-eye"></i> 조회 수 11</div>     
                    </div>
                </div>
            </div>
                    <div id="pic">
                        <img src="../resources/images/image/holly.jpg">
                    </div>
                    <div class="title">
                        <h1>
                            호올릴....
                        </h1>
                    </div>
                    <div class="button"> 
                        <button><a href="#" class="b1" type="button">수정</a></button>  
                        <button><a href="#" class="b1" type="button">삭제</a></button>  
                        <button><a href="/petmee/freeboard/list.do" class="b1">목록</a></button>  
                    </div>
                    <div class="com">
                        <textarea type="text" placeholder="댓글을 입력해주세요" class="comment"></textarea>
                        <button type="button" class="comment1"">등록</button>
                    </div>
                    <div class="comlist">
                              <div class="nick">권성진</div>
                              <div class="time">19.11.13 09:43</div>
                              <br><br>
                              <div class="com_content">가세요</div>
                    <div class="com_com">
                        <button class="b2" type="button">수정</button>
                        <button class="b2" type="button">삭제</button>
                    </div>
                    </div>
                </div>
    </section>
        <div id="footer" class="footer_wrap clearfix"> </div>
</body>
</html>