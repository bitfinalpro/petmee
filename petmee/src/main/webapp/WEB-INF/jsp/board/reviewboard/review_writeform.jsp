<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	<title>Pet Mee</title>
	<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
	<%@ include file="/WEB-INF/jsp/include/review/review_writeform.jsp" %>
	<%@ include file="/WEB-INF/jsp/include/login/joincss.jsp" %>
	<script src="<c:url value='/resources/js/common/jquery-1.12.4.js' />"></script>
	<script src="<c:url value='/resources/js/common/jquery-3.4.1.js' />"></script>
</head>
<style>
.top1 { margin 0 auto;}
   #holoscope a {
         text-decoration: none;
         color: gray;
     }
     #holoscope a.on{
         color: red;
     }
     #holoscope {
     text-align: center;
     }
</style>
   
<body>
    <div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
    <section>
        <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
            <img src="<c:url value='/resources/images/board/review/top.jpg' />"/>
        </div>
        <div class="title">
            <div class="top1">
                <h1 style="margin: 0 auto;">리뷰등록</h1>
            </div>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        <!-- content시작 -->
        <div id="content" style="position:relative; margin: 0 auto; width:70%; ">
			<div class="contents_all">
	            <div class="title">
	                <div class="board_list_all"></div>
	            </div>
	            <div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 ">
	                <p class="prdThumb">
	                    <a href="#">
	                        <img src="<c:url value='/resources/images/board/review/food.jpg' />"/>
	                    </a>
	                </p>
	                <div class="prdInfo">
	                    <p style="color:#666;">${board.proCatgo}</p>
	                    <h3>${board.product} </h3>
	                    
	                    <p class="price" style="font-size: 20px;">${board.price}원</p>
	                    <p class="button">
	                        <a href="#" title="새창으로 이동" class="dj_search_btn_2">상품상세보기</a>
	                    </p>
	                </div>
	            </div>
        	</div>
  		
		<form method='post' action='review_write.do' name="SermernoteVo" enctype="multipart/form-data" >
       	<!-- 별점 -->
       	<div class="review_form__submit_container" style="height: 200px;">
			<div class="review_form_title">
	       		<h2>상품은 만족하셨나요?</h2>
			</div>
    		<div class="review_form__score">
	    		<input type="hidden" name="holoscope" value="1">
		        <p id="holoscope">
	              <a href="#">★</a>
	              <a href="#">★</a>
	              <a href="#">★</a>
	              <a href="#">★</a>
	              <a href="#">★</a>
	           	</p>
	           	<p>선택해주세요</p>
      		</div>
    	</div>
    <input type="hidden" name="type" value="review" />
    <input type="hidden" name="email" value="원피스" class="write_input" placeholder="작성자" />
	<!-- 글쓰기 -->
	<div class="revcontent">
		<div style="position:relative; margin: 0 auto;  width:50px; height: 100px;"></div>  
			<div class="revcontent_title">
		       	<h2>어떤 점이 좋았나요?</h2>
	       		<div class="revcontent_text">
					<textarea class="recs" id="content" name='content' placeholder="내용을 입력해주세요" style="background-color: #f4f4f4;"></textarea>
					<!-- <script>
						function resize(obj) {
						  obj.style.height = "400px";
						  obj.style.height = (12+obj.scrollHeight)+"px";
						}
					</script> -->
				</div> 
	       	</div>
	</div> 
	<button class="review_form__submit" type="submit" data-disable-with="저장 중...">
      <span class="review_form__post_review_label" >리뷰 등록하기</span>
	</button> 
	</form>
		
    <div style="position:relative; text-align:center; margin: 0 auto; display:block; top:120px; width:100%; height: 180px; padding: 10px;">
    	<div class="btnArea" style=" width:150px; top:20px; margin:0 auto; border: 1px solid #dadada;">
			<a href="/petmee/board/reviewboard/review_list.do">목록</a>
        </div>
        <div style="position:relative; margin: 0 auto; width:50px; height: 80px;"></div>
    </div>
		
	</div>
    </section>
    
   
     <script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script> 
     <script src = "simple-image.js" ></script> 
     
      <script>
           $('#holoscope a').click(function() {
           $(this).parent().children("a").removeClass("on");
           $(this).addClass("on").prevAll("a").addClass("on");
              return false;
            });
         </script>
    
    <div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
</body>
</html>