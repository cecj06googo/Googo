<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單頁面</title>
</head>
<body>
<jsp:include page="/_00_fragment/top1.jsp" />
<br>
	<!-- 顯示session中的假資料 -->
	<c:if test="${not empty sessionScope.mem_id}">
		<p>
			session內的會員編號：
			<c:out value="${sessionScope.mem_id}" />
		</p>
	</c:if>
	<hr>
	<c:if test="${not empty sessionScope.com_id}">
		<p>
			session內的商家編號：
			<c:out value="${sessionScope.com_id}" />
		</p>
	</c:if>
	<!-- Compiler會騙人啦討厭 =3=  -->
	<hr>
	${MsgOK.InsertOK}
	<OL>
		<font color="blue"><b>訂單</b></font>
		<form action="<%=request.getContextPath()%>/fakeData.gg" method="post">
			------------------- 訂單主表-------------------
			<LI>會員編號: <input type="text" name="mem_id" value="1" /><font size="-1" color="#FF0000">${ErrorMsg.errorMem_id}</font>
			<p></LI> 
			<LI>商家編號: <input type="text" name="com_id" value="1" /><font size="-1" color="#FF0000">${ErrorMsg.errorCom_id}</font>
			<p></LI>
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="存入session" />
		</form>
		<form action="<%=request.getContextPath()%>/Insert.gg" method="post">
			<LI>訂購時間: <input type="text" name="ord_time"
				value="2014-10-20 07:06:32" /><font size="-1" color="#FF0000">${ErrorMsg.errorOrd_time}</font>
				<p></LI>
			<LI>取車日期: <input type="text" name="ord_getday"
				value="2014-01-01 14:15:00" /><font size="-1" color="#FF0000">${ErrorMsg.errorOrd_getday}</font>
			<p></LI>
			<LI>還車日期: <input type="text" name="ord_reday"
				value="2014-03-01 14:35:00" /><font size="-1" color="#FF0000">${ErrorMsg.errorOrd_reday}</font>
			<p></LI>
			<LI>訂單總額: <input type="text" name="item_total" value="3000.0" /><font size="-1" color="#FF0000">${ErrorMsg.errorItem_total}</font>
			<p></LI> ------------------- 訂單明細-------------------
			<LI>商品編號: <input type="text" name="prod_id" value="1" /><font size="-1" color="#FF0000">${ErrorMsg.errorProd_id}</font>
			<p></LI>
			<LI>配備編號: <input type="text" name="acc_id" value="1" /><font size="-1" color="#FF0000">${ErrorMsg.errorAcc_id}</font>
			<p></LI>
			<LI>領車人姓名: <input type="text" name="item_name" value="john" /><font size="-1" color="#FF0000">${ErrorMsg.errorItem_name}</font>
			<p></LI>
			<LI>領車人行動電話: <input type="text" name="item_phone"
				value="0987654321" /><font size="-1" color="#FF0000">${ErrorMsg.errorPhone}</font>
			<p><font size="-1" color="#FF0000">${ErrorMsg.errorPT}</font></p></LI>
			<LI>領車人市內電話: <input type="text" name="item_tel" value="" /><font size="-1" color="#FF0000">${ErrorMsg.errorTel}</font>
			</font><p></LI>
			<LI>領車人e-mail: <input type="text" name="item_email"
				value="gg@ya.123" /><font size="-1" color="#FF0000">${ErrorMsg.errorEmail}</font>
			<p></LI>
			<LI>商品配備: <input type="text" name="pritem_acc"
				value="啤酒,威士忌,高粱酒" />
			<p></LI>
			<LI>優惠: <input type="text" name="item_all" value="優惠方案1:租車送塔位" />
			<p></LI> <input type="hidden" name="action" value="insert"> <input
				type="submit" value="下訂" /> <font size="-1" color="#FF0000">${ErrorMsg.errTitle}</font>
				
				<input type="reset" value="恢復" />
				
		</form>
	</OL>
	<hr>
<!-- script -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- script -->
</body>
</html>