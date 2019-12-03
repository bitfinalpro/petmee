<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
<header>
      <div class="jbTitle">
           <div id="top_menu">
               <div>
                   <strong>공지스크롤</strong>
                </div>
                <div>
                    <span><a>회원가입</a></span>
                    <span>/</span>
                    <span><a>로그인</a></span>
                </div>
            </div>
      </div>
      <div class="jbMenu">
        <div class="logo">
        <a href="main.jsp"><img src="<c:url value='/resources/images/menu/final_logo.png' />"></a>
      </div>
          <div class="menu">
                <nav>
                    <ul>
                        <li class="drop01"><a href="#"><span>FOOD</span></a>
                            <ul>
                                <li><a href="#">사료</a></li>
                                <li><a href="#">간식</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">패션</a>
                            <ul>
                                <li><a href="#">패딩/아우터</a></li>
                                <li><a href="#">신발/양말</a></li>
                                <li><a href="#">티셔츠/올인원</a>
                                <li><a href="#">악세사리/외출용품</a>
                                    <!-- <ul>
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                    </ul> -->
                                </li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">미용/목욕</a>
                            <ul>
                                <li><a href="#">목욕용품</a></li>
                                <li><a href="#">발톱관리</a></li>
                                <li><a href="#">눈/귀/구강관리</a></li>
                                <li><a href="#">미용/털관리</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">위생/배변</a>
                            <ul>
                                <li><a href="#">배변용품</a></li>
                                <li><a href="#">위생용품</a></li>
                                <li><a href="#">털제거/청소용품</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">장난감</a></li>
                        <li class="drop01"><a href="#">커뮤니티</a>
                            <ul>
                                <li><a href='<c:url value="/board/noticeboard/notice.do" />'>공지사항</a></li>
                                <li><a href='<c:url value="/board/freeboard/list.do" />'>자유게시판</a></li>
                                <li><a href="#">봉사활동</a></li>
                                <li><a href="<c:url value="/board/parcelboard/parcelList.do" />">분양게시판</a></li>
                                <li><a href='<c:url value="/board/volunteerreviewboard/list.do"/>'>후기게시판</a></li>
                                <li><a href='<c:url value="/board/reviewboard/review_list.do" />'>리뷰게시판</a></li>
                                <li><a href='<c:url value="/board/reviewboard/review_list.do" />'>Q&A게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
          </div>
      </div>
</header>