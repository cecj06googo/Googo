<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>訂單頁面</title>
<jsp:include page="/_00_fragment/top1.jsp" />
<jsp:include page="/_00_fragment/css.jsp" />


</head>
	
<body>
session內的值:<br>
com_id： ${com_id == null ? '無':com_id} <br>
mem_id：${ mem_id == null ? '無':mem_id}<br>
item_total：${ item_total  == null ? '無':item_total}<br>
prod_id：${ prod_id == null ? '無':prod_id}<br>
acc_id：${ acc_id  == null ? '無':acc_id}<br>



<hr>
<form  role="form" action="<%=request.getContextPath()%>/FakeSession" method="post">
<label>訂單頁面要的session值</label><br>
com_id:(商家VO)<input maxlength="100" type="text" required="required"  value="3" name="com_id"/><br>
mem_id:(會員登入VO)<input maxlength="100" type="text" required="required"  value="3" name="mem_id"/><br>
item_total:(商品VO的價格+配件的價格)<input maxlength="100" type="text" required="required"  value="6666" name="item_total"/><br>
prod_id:(商品VO的id)<input maxlength="100" type="text" required="required"  value="1" name="prod_id"/><br>
acc_id:(配件的id  VO?)<input maxlength="100" type="text" required="required"  value="1" name="acc_id"/><br>
<input type="hidden"    name="action" value="fake_ord"/>
<button type="submit">存值</button>

</form>
<br>
<h1><a href="<%=request.getContextPath()%>/_07_order/placeOrder.jsp">下訂單</a></h1>

</body>
</html>