<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="side_menu">
            <div><strong>Community</strong></div>
            <ul>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">자유게시판</a></li>
                <li><a href="#">봉사활동</a></li>
                <li><a href="#">분양게시판</a></li>
                <li><a href="<c:url value="/board/volunteerreviewboard/list.do" /> ">후기게시판</a></li>
                <li><a href="#">Q&A</a></li>
            </ul>
</aside>