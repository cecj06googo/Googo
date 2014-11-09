<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>無此帳號，<a href="${pageContext.request.contextPath}/index.jsp">前往Googo</a></h1>
<font color="red" size="-1">${errorMsgs.errorQQ}</font>
<font color="red" size="-1">${errorMsgs.errorQQ}</font>
<font color="red" size="-1">${errorMsgs.errorException}</font>
</body>
</html>