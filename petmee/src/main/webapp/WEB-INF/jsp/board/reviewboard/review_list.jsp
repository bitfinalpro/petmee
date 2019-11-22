<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pet Mee</title>
	<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
	<link href="<c:url value='/resources/css/review/review_list.css' />" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board/notice.css" />">
</head>
<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>

<section>
    <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
        <img src="<c:url value='/resources/images/board/review/top.jpg' />">
    </div>
     <c:import url="/WEB-INF/jsp/common/sideMenu.jsp"></c:import>      
    <div class="boardList">
        <div class="title">
            <div class="top">
                <h1>리뷰게시판</h1>
                <h3>-Review-</h3>
            </div>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        <div class="review-tab">
	    	<ul>
				<li class="product-review"><a href="/board/reviewboard/review_list.html">상품리뷰</a></li>
				<li class="photo-review"><a href="/petmee/board/review/photo-review/index.html?board_no=14">포토리뷰</a></li>
				<li class="queen-review"><a href="/board/review/queen-review/index.html">이달의 포토리뷰퀸</a></li>
		    </ul>
		</div>
        <table border="" summary="">
        <caption>상품 게시판 목록</caption>
        <colgroup class="">
            <col style="width:10%;">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
            <col style="width:20%;">
            <col style="width:10%;">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
        </colgroup>
        <thead class="listheader">
            <tr  id="top_list" style="margin-top: 20px; height:50px;">
                <th scope="col">번호</th>
                <th scope="col" class="thumb">제품</th>
                <th scope="col">제목</th>
                <th scope="col">내용</th>
                <th scope="col">글쓴이</th>
                <th scope="col">날짜</th>
                <th scope="col" class="displaynone">조회수</th>
                <th scope="col" class="displaynone">평점</th>
                <th scope="col" class="displaynone">버튼</th>
            </tr>
        </thead>
        <!-- <tbody class="notice">
        <tr style="background-color:#FFFFFF; color:#000000;" class="content">
            <td class="number">공지 </td>
            <td class="thumb b_list">
                <a href="/product/detail.html?product_no=419">
                    <img src="//globalby.cafe24.com/web/product/tiny/201803/419_shop1_771658.jpg" border="0" alt="">
                    <span>AEROXON 파리 퇴치제(윈도우부착용) ...</span>
                </a>
            </td>
            <td class="b_list">
                <a href="/petmee/board/review_detail.html">강아지가 피를 토합니다.</a>
            </td>
            <td>권성진</td>
            <td class="txtLess  b_list">2018.06.21</td>
            <td class="txtLess  b_list">7</td>
            <td class="displaynone b_list">★★★★★</td>
        </tbody> -->
        
        <!-- 제품 -->
        <c:if test="${empty list}">
			<tr>
				<td colspan="5">게시물이 없습니다.</td>
			</tr>				
		</c:if>
        <c:forEach var="b" items="${list}">
        <tbody class="product">
            <tr style="background-color:#FFFFFF; color:#000000;" class="content">
                <!-- 번호 -->
                <td class="number">${b.no}</td>
                <!-- 상품이미지, 상품명 -->
                <td class="thumb b_list">
                    <%-- <a href="/petmee/reviewboard/review_detail.do?no=${b.no}"> --%>
                        <img src="<c:url value='/resources/images/board/review/food.jpg' />" border="0" alt="">
                        <span>하이펫 강아지사료 네츄럴코어</span>
                    <!-- </a> -->
                </td>
                <!-- 제목 -->
                <td class="displaynone b_list"><span>${b.title}</span></td>
                <!-- 내용 -->
                <td class="displaynone b_list"><span>${b.content}</span></td>
                <!-- <td class="subject b_list b_list">
                    <span class="displaynone">
                        <a href="#none" onclick="BOARD.viewTarget('59','4',this);"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_unfold.gif" alt="내용 보기"></a>
                    </span>
                    <a href="/board/product/read.html?no=59&amp;board_no=4" style="color:#000000;">Test</a> <span class="comment"></span>
                </td> -->
                <td class="b_list">${b.writer}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /></td>
                <td>${b.views}</td>
                
                <td class="displaynone b_list">★★★★★★</td>
            	<td >
            		<div style="margin-top: 10px;">
	            		<a href="#" style="background-color:#3f3f3f; width: 100px; display: block; color: #fff; padding: 5px; ">제품보기</a>
	            		<a href="/petmee/board/reviewboard/review_detail.do?no=${b.no}" style="background-color:#3f3f3f; margin-top: 10px; display: block; width: 100px; color: #fff; padding: 5px;">리뷰상세보기</a>
            		</div>
            	</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <div style="height:50px;"></div>
    
    <!-- 검색 -->
   <div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 bbs_normal ">
        <fieldset class="boardSearch">
            <!-- <legend>게시물 검색</legend> -->
            <p><select id="search_date" name="search_date" fw-filter="" fw-label="" fw-msg="">
            <option value="week">일주일</option>
            <option value="month">한달</option>
            <option value="month3">세달</option>
            <option value="all">전체</option>
            </select> <select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
            <option value="subject">제목</option>
            <option value="content">내용</option>
            <option value="writer_name">글쓴이</option>
            <option value="member_id">아이디</option>
            <option value="nick_name">별명</option>
            <option value="product">상품정보</option>
            </select> 
            <input id="search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 
                <a href="#none" onclick="BOARD.form_submit('boardSearchForm');" class="dj_btn_1">검색</a>
            </p>
            
            <!-- 글쓰기 버튼 -->
            <!-- <a href="#none" onclick="BOARD.form_submit('boardSearchForm');" class="dj_btn_1" style="position:relative; top:-25px; left:600px; ">글쓰기</a> -->
            <a href="review_writeform.do" class="dj_btn_1" style="position:relative; top:-25px; left:550px; ">글쓰기</a>
            <!--
            <div class="board_write_btn">     
                <div module="board_ButtonList_4" class="displaynone">
                    <a href="/board/product/write.html">
                        <button class="dj_btn_1"> 글쓰기</button>
                        <img src="/_dj/img/s58_bbs_write_img.png" onmouseover="this.src='/_dj/img/s58_bbs_write_img_on.png'"  onmouseout="this.src='/_dj/img/s58_bbs_write_img.png'" />
                    </a>
                </div>
            </div>
            -->    
        </fieldset>
    </div>


    <div class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4">
        <p style="width: 50px; height:50px; border: 1px solid #e0e0e0;">
            <a href="">
                <i class="fas fa-chevron-left" style="line-height:1.5em; font-size:30px;" ></i>
            </a>
        </p>
        <ol>
            <li class="xans-record-" style=" box-sizing: border-box; width:50px; height:50px; border: 2px solid #000;">
                <a href="?board_no=4&amp;page=1" class="this">1</a>
            </li>
            <p style="width: 50px; height:50px; margin-left: 5px; border: 1px solid #e0e0e0;">
                <a href="?board_no=4&amp;page=1">
                    <i class="fas fa-chevron-right" style="line-height:1.5em; font-size:30px;"></i>
                </a> 
            </p>
        </ol>
    </div>
</section>
<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
<!-- 
<script type="text/javascript">
				function getRandomInt(min, max) {
					  return Math.floor(Math.random() * (max - min)) + min;
					}

					function compareNumbers(a, b) {
					  return a - b;
					}

					var App = React.createClass({
						getInitialState: function () {
							return {
								data: [],
								series: ['France', 'Italy', 'England', 'Sweden', 'Germany'],
								labels: ['cats', 'dogs', 'horses', 'ducks', 'cows'],
								colors: ['#43A19E', '#7B43A1', '#F2317A', '#FF9824', '#58CF6C']
							}
						},
						componentDidMount: function () {
							this.populateArray();
							setInterval(this.populateArray, 2000);
						},
						populateArray: function () {
							var data = [],
								series = 5,//getRandomInt(2, 10),
								serieLength = 5;//getRandomInt(2, 10);
						
							for (var i = series; i--; ) {
								var tmp = [];
								
								for (var j = serieLength; j--; ) {
									tmp.push(getRandomInt(0, 20));
								}
								
								data.push(tmp);			
							}
							
							this.setState({ data: data });
						},
						render: function () {
							return (
								<section>
									<Charts
										data={ this.state.data }
										labels={ this.state.series }
										colors={ this.state.colors }
										height={ 250 }
									/>
								
									<Charts
										data={ this.state.data }
										labels={ this.state.series }
										colors={ this.state.colors }
										height={ 250 }
										opaque={ true }
										grouping={ 'stacked' }
									/>
									
									<Charts
										data={ this.state.data }
										labels={ this.state.series }
										colors={ this.state.colors }
										height={ 250 }
										grouping={ 'layered' }
									/>
								
									<Charts
										data={ this.state.data }
										labels={ this.state.series }
										colors={ this.state.colors }
										horizontal={ true }
									/>
									
									<Legend labels={ this.state.labels } colors={ this.state.colors } />
								</section>
							);
						}
					});



					var Legend = React.createClass({
						render: function () {
							var labels = this.props.labels,
								colors = this.props.colors;
							
							return (
							<div className="Legend">
								{ labels.map(function(label, labelIndex) {
									return (
									<div>
										<span className="Legend--color" style={{ backgroundColor: colors[labelIndex % colors.length]  }} />
										<span className="Legend--label">{ label }</span>
									</div>
									);
								}) }
							</div>
							);
						}
					});

					var Charts = React.createClass({
						render: function () {
							var self = this,
								data = this.props.data,
								layered = this.props.grouping === 'layered' ? true : false,
								stacked = this.props.grouping === 'stacked' ? true : false,
								opaque = this.props.opaque,
								max = 0;
							
							for (var i = data.length; i--; ) {
								for (var j = data[i].length; j--; ) {
									if (data[i][j] > max) {
										max = data[i][j];
									}
								}
							}
							
									
							return (
								<div className={ 'Charts' + (this.props.horizontal ? ' horizontal' : '' ) }>
									{ data.map(function (serie, serieIndex) {
									 	var sortedSerie = serie.slice(0),
									 		sum;
									 	
									 	sum = serie.reduce(function (carry, current) {
									 		return carry + current;
										}, 0);
									 	sortedSerie.sort(compareNumbers);				 		
														 
										return (
											<div className={ 'Charts--serie ' + (self.props.grouping) }
									 			key={ serieIndex }
												style={{ height: self.props.height ? self.props.height: 'auto' }}
											>
											<label>{ self.props.labels[serieIndex] }</label>
											{ serie.map(function (item, itemIndex) {
												var color = self.props.colors[itemIndex], style,
													size = item / (stacked ? sum : max) * 100;
												
												style = {
													backgroundColor: color,
													opacity: opaque ? 1 : (item/max + .05),
													zIndex: item
												};
											
												if (self.props.horizontal) {
													style['width'] = size + '%';
												} else {								
													style['height'] = size + '%';						
												}
						
												if (layered && !self.props.horizontal) {
													//console.log(sortedSerie, serie, sortedSerie.indexOf(item));
													style['right'] = ((sortedSerie.indexOf(item) / (serie.length + 1)) * 100) + '%';
													// style['left'] = (itemIndex * 10) + '%';
												}
											
											 return (
												 <div
												 	className={ 'Charts--item ' + (self.props.grouping) }
												 	style={ style }
													key={ itemIndex }
												>
												 	<b style={{ color: color }}>{ item }</b>
												 </div>
											);
											}) }
											</div>
										);
									}) }
								</div>
							);
						}
					});

					React.render(<App />, document.getElementById('charts'));
				</script> -->
</body>
</html>