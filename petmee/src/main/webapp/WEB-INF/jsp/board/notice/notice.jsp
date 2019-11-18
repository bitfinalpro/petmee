<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="./css/gnb.css" rel="stylesheet">
  <link href="./css/base.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <script src="./js/jquery-1.12.4.js"></script>
</head>
<style>
    .top_input {width: 70%; height: 32px; margin: 15px auto; }
    .top_input strong {font-size: 1.2rem; line-height: 2.1rem;}
    .top_input div {width: 40%; display: inline-block; clear: both;}
    .top_input div:nth-child(2) {text-align: right; float: right;}
    .top_input div:nth-child(2) select {height: 29px; vertical-align: middle; border: 1px solid #333;}
    .top_input div:nth-child(2) input {vertical-align: middle; border: 1px solid #333; height: 27px; }
    .top_input div:nth-child(2) button { width: 50px; height: 29px; margin: 10 0; color: #fff;font-weight: bold;
    background-image: linear-gradient(30deg,#333, #333);}
    .notice_tb {width: 70%; margin: 0px auto; border-top: 2px solid #333; text-align: center;}
    .notice_tb tr th {background-color: #e5e5e5; border-right:1px solid #fff; height: 50px;}
    .notice_tb tr td {height: 50px; border-bottom: 2px solid #999;}
    .notice_tb tr td button {width: 50px; height: 30px;}
    .notice_tb tr td button:nth-child(1) { margin: 10 0; color: #fff;font-weight: bold;
    background-image: linear-gradient(30deg,#002a50,#006ecf);}
    .notice_tb tr td button:nth-child(2) { margin: 10 0; color: #fff;font-weight: bold;
    background-image: linear-gradient(30deg,#333, #333);}

    #page {width: 60%; margin: 30px auto; text-align: center;}

    aside {width: 150px; position: absolute; top: 73%; left: 30px; background-color: #fff;}
    aside > div {width: 150px; height: 28px; text-align: center;  background-color: #333; color: #fff;}
    aside > div strong {vertical-align: middle}
    aside > ul li {text-align: center; height: 30px; border-bottom: 2px solid #eee;}
    aside > ul li a { line-height: 1.8rem;}
</style>    
<body>
  <div id="header"> </div>
    <section id="wrap" >
        <aside class="side_menu">
            <div><strong>Community</strong></div>
            <ul>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">자유게시판</a></li>
                <li><a href="#">봉사활동</a></li>
                <li><a href="#">분양게시판</a></li>
                <li><a href="#">후기게사판</a></li>
                <li><a href="#">Q&A</a></li>
            </ul>
        </aside>    
        <img src="/images/main/1231.jpg" width="100%" />
        <div class="top_input">
            <div>
                <strong>공지사항</strong>
            </div>
            <div>
                <select name="" id="top_sel">
                    <option>전체</option>
                </select>
                <input type="text"  placeholder="검색어 입력" />
                <button>검색</button>
            </div>
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
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
                <td>123</td>
                <td>
                    <button>수정</button>
                    <button>삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>비트 이벤트 </td>
                <td>관리자</td>
                <td>2019.11.11</td>
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
        <style>.foot_btn {width: 70%; margin: 0 auto; margin-top: 10px;}
           .foot_btn button{width: 80px; height: 30px; margin: 10 0; color: #fff;font-weight: bold;
            background-image: linear-gradient(30deg,#002a50,#006ecf);
            float : right;}</style>
        <div class="foot_btn"><button>글 등록</button></div>
        <div id="page">
            <span> << &nbsp;1 &nbsp; / &nbsp; 2 &nbsp; / &nbsp; 3 &nbsp; / &nbsp; 4 &nbsp; / &nbsp; 5 &nbsp; >></span>
        </div>
    </section>  
        <div id="footer" class="footer_wrap clearfix"> </div>
    </div>
</body>
</html>