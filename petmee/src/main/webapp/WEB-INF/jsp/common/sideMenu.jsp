<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="side_menu">
            <div><strong>Community</strong></div>
            <ul>
                <li><a href='<c:url value="/board/noticeboard/notice.do" />'>공지사항</a></li>
                <li><a href='<c:url value="/board/freeboard/list.do" />'>자유게시판</a></li>
                <li><a href='<c:url value="/board/parcelboard/parcelList.do" />'>분양게시판</a></li>
                <li><a href='<c:url value="/board/volunteerreviewboard/list.do" />'>후기게사판</a></li>
                <li><a href='<c:url value="/board/reviewboard/review_list.do" />'>리뷰게사판</a></li>
                <li><a href='<c:url value="/board/reviewboard/qna-list.do" />'>Q&A</a></li>
            </ul>
</aside>