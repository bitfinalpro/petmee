<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Pet Me</title>
<link href="./css/gnb.css" rel="stylesheet">
  <link href="../resources/css/gnb.css" rel="stylesheet">
  <link href="../resources/css/base.css" rel="stylesheet">
  <script src="..resources/js/jquery-1.12.4.js"></script>
<link href="./css/summernote-lite.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script src="./js/jquery-1.12.4.js"></script>
<script src="./dist/summernote-lite.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function(){
       $("#header").load("menu.html")    
    });
    $(document).ready(function(){
       $("#footer").load("footer.html")    
    });
</script>
<style>
.wirte_form {width: 70%; margin:  0 auto; }
.wirte_form #title {width: 100%; height: 30px; margin: 30px 0px; border: 1px solid #999; color: #333; border-radius: 3px 0 0 3px;}
.wirte_form textarea {width: 100%; height: 30px; border: 1px solid #999; color: #333; border-radius: 3px 0 0 3px;}
.wirte_form textarea {width: 100%; border: 1px solid #333;} 
.files {clear: both; margin: 15px 0px; width: 100%; height: 33px;  border: 1px solid #eee; color: #333; border-radius: 3px 0 0 3px;}
.files > div:nth-child(1){ float: left; margin-top: -1px; text-align: center; width: 30px; height: 34px;  color: #333; border-radius: 2px 0 0 3px; background-color: #eee;}
.files > div:nth-child(1) > i {vertical-align: middle; padding-top: 5px;}
.files > div:nth-child(2){ float: left; padding: 5px 5px; height: 30px; color: #333; }
.btn {width: 100%; margin: 0 auto; margin-bottom: 20%; margin-top: 5%; text-align: center;}
.btn button {width: 8%; height: 30px;}
.btn button:nth-child(1) { margin: 10 0; color: #fff;font-weight: bold;
background-image: linear-gradient(30deg,#002a50,#006ecf);}
.btn button:nth-child(2) { margin: 10 0; color: #fff;font-weight: bold;
    background-image: linear-gradient(30deg,#333, #333);}
 </style>    
<body>
  <div id="header"> </div>

    <section id="wrap">
        <img src="/images/main/1231.jpg" width="100%" />
         <form method="post" action="write.do" id="">
        <div class="wirte_form">
          제목 :  <input type="text" name="title" id="title" placeholder="제목을 입력해 주세요!" maxlength="29" />
            <input type="text" name="writer" id="writer" maxlength="29" value="${writer}"/>
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
                <button type="submit">등록</button>
                <button>취소</button>
            </div>
        </div>
         </form>
    </section>  
    <script>
        $('#summernote').summernote({
            placeholder: '<br>※ 게시판 용도와 무관하거나 아래 내용이 포함된 경우는 사전 안내없이 삭제/제재됩니다.<br><br>- 욕설, 상대 비방 등 타인의 명예를 훼손하는 게시물 <br><br>- 불쾌감을 줄 수 있는 이미지나 내용, 저작권에 위배되는 게시물 <br><br>- 개인정보 노출이 있거나 현금 거래 시도 등에 준하는 행위 ',
            tabsize: 2,
            height: 500,
            minHeight: null,   
            maxHeight: null,             
            focus: true 
          });
        let buEle = document.getElementById("BoardWrite")
        function onWrite(){
        	let userCheck = true;
        	if (buEle.content.value == ''){
        		alert("내용을 입력해주세요.");
        		return false;
        	}
        	BoardWrite.submit();
        }
     </script>
     <script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script> 
     <script src = "simple-image.js" ></script> 
     <link  href = "simple-image.css"  rel = "stylesheet" /> 
     
     <div  id = "editorjs" > </div> 
     
     <script> const editor = new EditorJS ({
            autofocus : true 
         });
         </script>
     <div id="footer" class="footer_wrap clearfix">
     <%@include file="/WEB-INF/include/footer.jsp" %> 
      </div>

</body>
</html>



