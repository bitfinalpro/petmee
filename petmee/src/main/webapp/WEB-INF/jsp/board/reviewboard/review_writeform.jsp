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
   
<body>
    <div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
    <section>
    	<form method='post' action="<c:url value="/board/reviewboard/review_write.do" />" name="SermernoteVo">
        <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
            <img src="<c:url value='/resources/images/board/review/top.jpg' />"/>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        <div class="title">
            <div class="top">
                <h1 style="margin: 0 auto; color:#3f3f3f; font-weight: bold;">리뷰등록</h1>
            </div>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        <!-- content시작 -->
        <div id="content" style="position:relative; border-top: 5px solid #333; margin: 0 auto; width:70%; ">
			<div class="contents_all">
	            <!-- <div class="title">
	                <div class="board_list_all"></div>
	            </div> -->
	            <div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 " style="border-bottom: 1px solid #e0e0e0; display:inline-block; padding:10px;">
	                <input name ="image" value="<c:url value='${imgfirst}'/>" type ="hidden"/>
					<c:forEach var="f" begin="0" end="0" items="${flist}" varStatus="status">
		                <div class="prdThumb">
							<img src="<c:url value='${f.path}${f.oriName}'/>" id="a"/>
		                </div>
	                </c:forEach>
	                
	                <div class="prdInfo">
	                	<strong><input style="display:inline-block;" value="${product.productName}"/></strong>
	                    <p style="color:#666; font-size: 25px;">${product.productInfo}</p>
	                    <h5>제조사: ${product.company} </h5>
	                    
	                    <p class="price" style="font-size: 20px;">${product.price}원</p>
	                    <p class="button">
	                        <a href="#" style="background-color:#3f3f3f; width: 100px; display: block; text-align: center; color: #fff; padding: 5px; ">제품보기</a>
	                    </p>
	                </div>
	            </div>
        	</div>
  		

       	<!-- 별점 -->
       	<div class="review_form__submit_container" style="display: inline-block;">
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
	<!-- 글쓰기 -->
	<div class="revcontent">
    <input type="hidden" name="product_id" value="product_id" class="write_input" />
			<div class="revcontent_title">
		       	<h2>제목을 입력해주세요</h2>
	       		<div class="revcontent_text">
					<textarea class="recs" id="title" name='title' placeholder="내용을 입력해주세요" style="background-color: #f4f4f4;"></textarea>
					<!-- <script>
						function resize(obj) {
						  obj.style.height = "400px";
						  obj.style.height = (12+obj.scrollHeight)+"px";
						}
					</script> -->
				</div> 
	       		<div class="revcontent_text">
		       	<h2>내용을 입력해주세요</h2>
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
	
		
	    <div style="position:relative; text-align:center; display: inline-block; top:100px; width:100%;">
	    	<div class="right-box">
				<a class="btnArea" href="<c:url value="/shop/shoppingDetail.do?productId=${product.productId}" />">목록</a>
				<button class="review_form__submit" type="submit">리뷰 등록하기</button> 
			</div>
	    </div>
	</div>
		
	</form>
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
    
    <div id="footer">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
</body>
</html>