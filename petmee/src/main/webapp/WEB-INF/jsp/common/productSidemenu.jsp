<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value="/resources/js/shopping/main/shoppingProductList.js"/>"></script>
       <div class="product_nav" role="navigation">
          <ul class="nav__list">
            <li>
              <input id="group-1" type="checkbox" hidden />
              <label for="group-1">반려동물</label>
              <ul class="group-list">
                <input id="sub-group-list" type="checkbox" hidden />
                <label for="sub-group-list"
                  ><span class="fa fa-angle-right"></span>푸드</label
                >
                <ul class="sub-group-list">
                  <li><a href="<c:url value="/shop/productList.do?categoryNo=1" />">사료</a></li>
                  <li><a href="<c:url value="/shop/productList.do?categoryNo=2" />">간식</a></li>
                </ul>
                <input id="sub-group-list2" type="checkbox" hidden />
                <label for="sub-group-list2"
                  ><span class="fa fa-angle-right"></span>패션</label
                >
                <ul class="sub-group-list">
                  <li><a href="#">티셔츠/아우터</a></li>
                  <li><a href="#">신발</a></li>
                  <li><a href="#">액세서리/외출용품</a></li>
                </ul>
                <input id="sub-group-list3" type="checkbox" hidden />
                <label for="sub-group-list3"
                  ><span class="fa fa-angle-right"></span>미용/목욕</label
                >
                <ul class="sub-group-list">
                  <li><a href="#">목욕용품</a></li>
                  <li><a href="#">미용용품</a></li>
                </ul>
                <input id="sub-group-list4" type="checkbox" hidden />
                <label for="sub-group-list4"
                  ><span class="fa fa-angle-right"></span>위생/배변</label
                >
                <ul class="sub-group-list">
                <input type="button" value="페이지 이동" onclick="acyncMovePage('/shop/productList.do?categoryNo=7')" />
                  <li><a onclick="acyncMovePage('/shop/productList.do?categoryNo=1')">위생/배변용품</a></li>
                  <li><a onclick="acyncMovePage('/shop/productList.do?categoryNo=2') ">청소용품</a></li>
                </ul>
                <input id="sub-group-list5" type="checkbox" hidden />
                <label for="sub-group-list5"
                  ><span class="fa fa-angle-right"></span>장난감</label
                >
              </ul>
            </li>
          </ul>
        </div>