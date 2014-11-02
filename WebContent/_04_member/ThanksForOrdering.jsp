<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>金玉堂網路購物商城</title>
</head>
<body style="background:#EBFFEB;">


 <CENTER> 
 <h1>
親愛的會員  您好：${MsgOK.InsertOK}
<BR><FONT COLOR='RED'>Goo-go租車網</FONT><BR>
 感謝您的訂購<BR>
 期待您再度光臨 
  </h1> 
 <BR>
 
 <a href="<%=request.getContextPath()%>/_04_member/productsDetails.jsp"><input type="button" value="再訂一筆" /></a>
 </CENTER>
</body>
</html>