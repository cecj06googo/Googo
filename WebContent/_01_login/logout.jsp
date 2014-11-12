<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="2; url=${pageContext.request.contextPath}/index.jsp">
<title>登出</title>
</head>
<body>
<!-- 先將使用者名稱取出 -->
<%-- <c:set var="memberName" value="${ LoginOK.name }" />    <!-- LoginOK裡面放置MemberBean資料 (session物件 LoginOK:mb)  --> --%>
<!-- 移除放在session物件內的屬性物件 -->
<c:remove var="LoginMemOK" scope="session" />
<c:remove var="LoginComOK" scope="session" />
<%-- <c:remove var="ShoppingCart" scope="session" /> --%>
<!-- 下列敘述設定變數funcName的值為OUT，top.jsp 會用到此變數 -->
<%-- <c:set var="funcName" value="OUT" scope="session"/> --%>
<!-- 引入共同的頁首 -->
<jsp:include page="/_00_fragment/top1.jsp" />    <!-- 在session還未移除前, 已顯示出菜單列 -->
<div style="margin: 50px 20%">
<img src="http://resource.holyshare.com.tw/uploads/article/600x0/1413951825foz_1.JPG" />
</div>
<%
  session.invalidate();    // 把與session有關的連結全都移除掉.(也包括sessionid)
%>
</body> 
</html>