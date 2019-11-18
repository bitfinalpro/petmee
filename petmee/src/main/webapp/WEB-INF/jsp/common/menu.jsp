<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header clearfix">
    <div class="headwrap clearfix">
        <h1 class="logo"><a href="#"><img src="<c:url value='/resources/images/menu/final_logo.png' />"></a></h1>
        <div class="util_wrap">
            <ul class="clearfix">
                <li><a href="#">LOGIN</a></li>
                <li><a href="#">JOIN</a></li>
                <script>
                    function allsearch(form) {
                        if (form.search_word.value == "") {
                            alert("검색어를 입력해 주세요");
                            form.search_word.focus();
                            return (false);
                        }
                        form.submit();
                    }
                </script>
            </ul>
        </div>
        <div class="search_wrap">
            <div class="search_box">
                <form method="get" action="/pc/main/search.html" onsubmit="return allsearch(this);">
                    <input class="input" type="text" title="검색어" name="search_word"
                        placeholder="검색어를 입력하세요">
                    <input type="submit" class="btn" value="검색">
                </form>
            </div>
        </div>
    </div>
    <nav>
        <div class="gnb">
            <div class="gnb_wrap">
                <ul class="depth clearfix">
                    <li class="depth01" data-id="menu1">
                        <a href="#">FOOD </a>
                        <div class="depth02_box">
                            <ul class="clearfix tab">
                                <li><a href="#">
                                        <div class="imgbox">
                                            <img src="<c:url value='/resources/images/menu/13.jpg' />" alt="" class="off">
                                            <img src="<c:url value='/resources/images/menu/13_on.jpg' />" alt="" class="on">
                                        </div>
                                        <div class="txtbox">
                                            <p class="tit">사료</p>
                                            <p class="txt">사료을 소개합니다. </p>
                                        </div>
                                    </a></li>
                                <li><a href="#">
                                        <div class="imgbox">
                                            <img src="<c:url value='/resources/images/menu/14.jpg' />" alt="" class="off">
                                            <img src="<c:url value='/resources/images/menu/14_on.jpg' />" alt="" class="on">
                                        </div>
                                        <div class="txtbox">
                                            <p class="tit">간식</p>
                                            <p class="txt">함께 일해 볼래요? <i class="br"></i>브리더, 스텝 大모집 </p>
                                        </div>
                                    </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="depth01" data-id="menu2">
                        <a href="#">패션</a>
                        <div class="depth02_box">
                            <ul class="clearfix tab">
                                <li><a href="#">
                                        <div class="imgbox">
                                            <img src="" alt="" class="off">
                                            <img src="" alt="" class="on">
                                        </div>
                                        <div class="txtbox">
                                            <p class="tit">패딩/아우터</p>
                                            <p class="txt">신발/양말</p>
                                        </div>
                                    </a></li>
                                <li><a href="#">
                                        <div class="imgbox">
                                            <img src="" alt="" class="off">
                                            <img src="" alt="" class="on">
                                        </div>
                                        <div class="txtbox">
                                            <p class="tit">티셔츠/올인원</p>
                                            <p class="txt">악세사리/외출용품</p>
                                        </div>
                                    </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">미용/목욕(목욕용품,발톱관리,눈/귀/구강관리,미용/털관리)</a>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">위생/배변(배변용품,위생용품,털제거/청소용품</a>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">장난감()</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<script src="<c:url value='/resources/js/common/menu.min.js' />"></script>
