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
  <title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/shopping/detail.css" />">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>   
<body>
    <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    
    <section id="wrap" class="sections">
        <div id="product_title"><h2>파우더향] 강아지수제비누 병풀추출</h2></div>
        <div class="top_product">
            <div class="left_img">
                <img src="<c:url value="/resources/images/main/1.jpg" />" width="100%" >
            </div>
            <div class="right_txt">
                <ul>
                    <li><strong>상품명</strong><span>[파우더향] 강아지수제비누 병풀추출</span></li>
                    <li><strong>소비자가</strong><span class="linethrough">10,000원</span></li>
                    <li><strong>판매가</strong><span>11,000원</span></li>
                    <li><strong>상품간략설명</strong><span>천연성분,각질/세균/진드기 예방</span></li>
                    <li><strong>적립금</strong><span>1%</span></li>
                    <li><strong>국내·해외배송</strong><span>국내배송</span></li>
                    <li><strong>배송방법</strong><span>택배</span></li>
                    <li><strong>배송비</strong><span>2,500원 (300,000원 이상 구매시 무료)</span></li>
                </ul>
                <div id="product_su">
                    <strong>수량</strong><input type="number" placeholder="수량" min="1" max="100" step="1" value="1"/>
                </div>
                <span id="product_su_txt">(최소준문수량 1개 이상)</span>
                <div class="product_sum">
                    <span>총 상품금액(수량)</span><strong>11,800원<span>(1개)</span></strong>
                </div>
                <div class="purchase_btn">
                    <button>바로 구매하기</button>
                    <button>장바구니 담기</button>
                    <button>관심상품등록</button>
                </div>
            </div>
        </div>
    </section>
    <section style="width: 70%; margin: 0 auto;">
        <div id="content_submenu">
            <ul>
                <li id="prdDetail" class="selected"><a href="#prdDetail">상품상세정보</a></li>
                <li><a href="#prdInfo">상품구매안내</a></li>
                <li><a href="#prdReview">상품사용후기</a></li>
                <li><a href="#prdQnA">상품Q&amp;A</a></li>
            </ul>
        </div>
        <img src="<c:url value="/resources/images/shopping/detail/content_img1.jpg" />" style="width: 100%;">
        <img src="<c:url value="/resources/images/shopping/detail/content_img2.jpg" />" style="width: 100%;">
        <img src="<c:url value="/resources/images/shopping/detail/content_img3.jpg" />" style="width: 100%;">
        <img src="<c:url value="/resources/images/shopping/detail/content_img4.jpg" />" style="width: 100%;">
        <img src="<c:url value="/resources/images/shopping/detail/content_img5.jpg" />" style="width: 100%;">
    </section>
    <section class="sections">
            <div id="content_submenu">
                <ul>
                    <li><a href="#prdDetail">상품상세정보</a></li>
                    <li id="prdInfo" class="selected"><a href="#prdInfo">상품구매안내</a></li>
                    <li><a href="#prdReview">상품사용후기</a></li>
                    <li><a href="#prdQnA">상품Q&amp;A</a></li>
                </ul>
            </div>
            <div class="cont">
                    <h3>상품결제정보</h3>
                    고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
              정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
              <br>
              무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>
              주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
              않은 주문은 자동취소 됩니다. <br>
                </div>
                <div class="cont">
                    <h3>배송정보</h3>
            	<ul class="delivery">
        <li>배송 방법 : 택배</li>
                        <li>배송 지역 : 전국지역</li>
                        <li>배송 비용 : 2,500원</li>
                        <li>배송 기간 : 3일 ~ 7일</li>
                        <li>배송 안내 : <p>- 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
            고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</p><p><br></p><li>배송 방법 : 택배</li><li>배송 지역 : 전국지역</li><li>배송 비용 : 조건부 무료 : 주문 금액 30,000원 미만일 때 배송비 2,500원을 추가합니다.</li><li>배송 기간 : 3일 ~ 5일</li>
            <li>배송 안내 : <span>다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</span><br></li></ul></div>
           
                <div class="cont">
                    <h3>교환 및 반품정보</h3>
                    <H3>교환/반품안내</H3>
        <P>교환 및 반품이 가능한 경우</P>
        <P><SPAN style="FONT-SIZE: 9pt">-</SPAN><SPAN style="FONT-SIZE: 9pt">&nbsp;</SPAN>교환 및 반품은 3주 이내로 가능합니다.</P>
        <P><SPAN style="FONT-SIZE: 9pt">-</SPAN><SPAN style="FONT-SIZE: 9pt">&nbsp;</SPAN>내용물의 2/3이상 남아있어야 합니다.</P>
        <P><BR></P>
        <P>※상품불량 및 트러블로 인한 교환 및 반품은 전자상거래법에 의거, 주문날짜로부터 30일이 지나면 반품 및 환불이 불가합니다.</P>
        <P><BR></P>
        <P>교환 및 반품 택배비</P>
        <P>왕복택배비 : 5,000원</P>
        <P><BR></P>
        <P><SPAN style="FONT-SIZE: 9pt">-</SPAN><SPAN style="FONT-SIZE: 9pt">&nbsp;</SPAN>단순변심으로 인한 교환/반품 시 왕복택배비 5,000원 소비자 부담</P>
        <P><SPAN style="FONT-SIZE: 9pt">-</SPAN><SPAN style="FONT-SIZE: 9pt">&nbsp;</SPAN>제품의 하자 및 오배송의 경우 교환/환불 배송비는 당사에서 부담</P>
        <P><BR></P>
        <P>신청방법 및 유의사항</P>
        <P><SPAN style="FONT-SIZE: 9pt">-</SPAN><SPAN style="FONT-SIZE: 9pt">&nbsp;</SPAN>교환/반품을 원하는 경우 고객만족센터와 통화 또는 1:1문의게시판 등록 후 접수 가능</P>
        <P><SPAN style="FONT-SIZE: 9pt">-</SPAN><SPAN style="FONT-SIZE: 9pt">&nbsp;</SPAN>제품 도착 후&nbsp;강아지스토리 환불규정에 따라 신속하게 처리됩니다</P>
        <P><SPAN style="FONT-SIZE: 9pt">-</SPAN><SPAN style="FONT-SIZE: 9pt">&nbsp;</SPAN>교환/반품 주소 : 부산광역시 해운대구&nbsp;센텀중앙로 48, 1411호(010-2450-6863)(우동, 에이스하이테크21) 강아지스토리</P>
        <P><B><BR></B></P>
        <P><B>교환 및 반품이 가능한 경우</B><BR>- 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의<BR>&nbsp;&nbsp;경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<BR>- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<BR>&nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내<BR><BR><B>교환 및 반품이 불가능한 경우</B><BR>- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<BR>&nbsp;&nbsp;포장 등을 훼손한 경우는 제외<BR>- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<BR>&nbsp;&nbsp;(예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에<BR>&nbsp;&nbsp;따른 반품/교환은 제조사 기준에 따릅니다.)<BR>- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 <BR>&nbsp;&nbsp;제공한 경우에 한 합니다.<BR>- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<BR>- 복제가 가능한 상품등의 포장을 훼손한 경우<BR>&nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<BR><BR>※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<BR>&nbsp;&nbsp;(색상 교환, 사이즈 교환 등 포함)<BR></P>        </div>
                <div class="cont">
                    <h3>서비스문의</h3>
                    서비스 문의 안내 : 010-2450-6863 으로 문의 주십시오.        </div>
            </div>
    </section>
    <section class="sections">
            <div id="content_submenu">
                <ul>
                    <li><a href="#prdDetail">상품상세정보</a></li>
                    <li><a href="#prdInfo">상품구매안내</a></li>
                    <li id="prdReview" class="selected"><a href="#prdReview">상품사용후기</a></li>
                    <li><a href="#prdQnA">상품Q&amp;A</a></li>
                </ul>
            </div>

            <table class="notice_tb">
                    <colgroup>
                        <col width=7%;>
                        <col width=50%;>
                        <col width=7%;>
                        <col width=10%;>
                        <col width=7%;>
                        <col width=10%;>
                    </colgroup>
                    <tr>
                        <th>NO</th>
                        <th>TITLE</th>
                        <th>WRITER</th>
                        <th>DATE</th>
                        <th>VIEW</th>
                        <th></th>
                    </tr>
                    
                    <tr onclick="document.location.href='wirte.html'">
                        <td>3</td>
                            <td>비트 이벤트 </td>
                            <td>관리자</td>
                            <td><i class="far fa-clock"></i>&nbsp;2019.11.11</td>
                            <td>123</td>
                            <td>
                                <button>수정</button>
                                <button>삭제</button>
                            </td>
                        </tr>
                    <tr>
                        <td>2</td>
                        <td>빼빼로 이벤트 </td>
                        <td>관리자</td>
                        <td>2019.11.11</td>
                        <td>123</td>
                        <td>
                            <button>수정</button>
                            <button>삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>사이트 서비스 안내</td>
                        <td>관리자</td>
                        <td>2019.11.11</td>
                        <td>123</td>
                        <td>
                            <button>수정</button>
                            <button>삭제</button>
                        </td>
                    </tr>
                </table>
                <div id="page" >
        <nav>
  <ul class="pagination">
  <c:if test="${pr.prev}">
    <li>
      <a href="notice.do?pageNo=${pr.beginPage - 1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
    <li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="notice.do?pageNo=${i}">${i}</a></li>
    </c:forEach>
    <c:if test="${pr.next}">
    <li>
      <a href="notice.do?pageNo=${pr.endPage + 1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
	</div>
    </section>
    <section class="sections1">
            <div id="content_submenu">
                <ul>
                    <li><a href="#prdDetail">상품상세정보</a></li>
                    <li><a href="#prdInfo">상품구매안내</a></li>
                    <li><a href="#prdReview">상품사용후기</a></li>
                    <li id="anchor_div" class="selected"><a href="#prdQnA">상품Q&amp;A</a></li>
                </ul>
            </div>

            <table class="notice_tb">
                    <colgroup>
                        <col width=7%;>
                        <col width=50%;>
                        <col width=7%;>
                        <col width=10%;>
                        <col width=7%;>
                        <col width=10%;>
                    </colgroup>
                    <tr>
                        <th>NO</th>
                        <th>TITLE</th>
                        <th>WRITER</th>
                        <th>DATE</th>
                        <th>VIEW</th>
                        <th></th>
                    </tr>
                    
                    <tr onclick="document.location.href='wirte.html'">
                        <td>3</td>
                            <td>비트 이벤트 </td>
                            <td>관리자</td>
                            <td><i class="far fa-clock"></i>&nbsp;2019.11.11</td>
                            <td>123</td>
                            <td>
                                <button>수정</button>
                                <button>삭제</button>
                            </td>
                        </tr>
                    <tr>
                        <td>2</td>
                        <td>빼빼로 이벤트 </td>
                        <td>관리자</td>
                        <td>2019.11.11</td>
                        <td>123</td>
                        <td>
                            <button>수정</button>
                            <button>삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>사이트 서비스 안내</td>
                        <td>관리자</td>
                        <td>2019.11.11</td>
                        <td>123</td>
                        <td>
                            <button>수정</button>
                            <button>삭제</button>
                        </td>
                    </tr>
                </table>
                <div id="page" >
        <nav>
  <ul class="pagination">
  <c:if test="${pr.prev}">
    <li>
      <a href="notice.do?pageNo=${pr.beginPage - 1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
    <li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="notice.do?pageNo=${i}">${i}</a></li>
    </c:forEach>
    <c:if test="${pr.next}">
    <li>
      <a href="notice.do?pageNo=${pr.endPage + 1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
	</div>
    </section>
    <div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
</body>
</html>