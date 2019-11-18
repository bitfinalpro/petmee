<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<div class="header clearfix">
    <div class="headwrap clearfix">
        <h1 class="logo"><a href="#"><img src="../resources/images/menu/final_logo.png"></a></h1>
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
                        placeholder="검색어를 입력하세요">
                    <input type="submit" class="btn" value="검색">
                </form>
            </div>
        </div>
    </div>
    <nav>
        <div class="gnb">
            <div class="gnb_wrap">
                <ul class="depth clearfix">
                    <li class="depth01" data-id="menu1">
                        <a href="#">공지사항</a>
                    </li>
                    <li class="depth01" data-id="menu2">
                        <a href="petmee/freeboard/list.do">자유게시판</a>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">봉사활동게시판</a>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">후기게시판</a>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">Q&A</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<script src="./js/menu.min.js"></script>
