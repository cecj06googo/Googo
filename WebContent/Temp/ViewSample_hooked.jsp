<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.template.model.Prototype_OrderTemp_VO, com.member.model.MemVO, java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<% Prototype_OrderTemp_VO tempVo = (Prototype_OrderTemp_VO)request.getAttribute("tempVo"); %>

<!-- 此為測試用程式碼，在後端 console 檢查 session 內容物 -->
<%
Enumeration e = request.getSession().getAttributeNames();
while (e.hasMoreElements()){
	System.out.println(e.nextElement());
}
MemVO mem = (MemVO) request.getSession().getAttribute("LoginMemOK");
System.out.println(mem.getMem_id());
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單頁面</title>
</head>
<body>
<jsp:include page="/_00_fragment/top1.jsp" />

<h2>Current Mem: ${LoginMemOK.mem_id}</h2>

<p>訂單</p>
<form action="<%=request.getContextPath()%>/Insert.gg" method="post">
	<p>訂購時間: <input type="text" name="ord_time" value="2014-10-20 07:06:32" />${ErrorMsg.errorOrd_time}</p>
	<p>取車日期: <input type="text" name="ord_getday"	value="2014-01-01 14:15:00" />${ErrorMsg.errorOrd_getday}</p>
	<p>還車日期: <input type="text" name="ord_reday" value="2014-03-01 14:35:00" />${ErrorMsg.errorOrd_reday}</p>
	<p>訂單總額: <input type="text" name="item_total" value="3000.0" />${ErrorMsg.errorItem_total}</p>
	<p>------------------- 訂單明細-------------------</p>
	<p>商品編號: <input type="text" name="prod_id" value="1" />${ErrorMsg.errorProd_id}</p>
	<p>配備編號: <input type="text" name="acc_id" value="1" />${ErrorMsg.errorAcc_id}</p>
	<p>領車人姓名: <input type="text" name="item_name" value="john" />${ErrorMsg.errorItem_name}</p>
	<p>領車人行動電話: <input type="text" name="item_phone"	value="0987654321" />${ErrorMsg.errorPhone}</p>
	<p>${ErrorMsg.errorPT}</p>
	<p>領車人市內電話: <input type="text" name="item_tel" value="" />${ErrorMsg.errorTel}</p>
	<p>領車人e-mail: <input type="text" name="item_email" value="gg@ya.123" />${ErrorMsg.errorEmail}</p>
	<p>商品配備: <input type="text" name="pritem_acc" value="啤酒,威士忌,高粱酒" /></p>
	<p>優惠: <input type="text" name="item_all" value="優惠方案1:租車送塔位" /></p>
	<p>服務廠商id: <input type="text" name="vendor_id" value="1" /></p>
	<input type="hidden" name="action" value="insert"> 
	<p><input type="submit" value="下訂" />${ErrorMsg.errTitle}</p>
	<p><input type="reset" value="恢復" /></p>
	<p>------------------- 帶入店家設計欄位-------------------</p>
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			${tempVo.content}
		</div>
	</div>
</form>
<hr>

<form role="form" action="<%=request.getContextPath()%>/DesignAccessDB" method="post">
	com_id<input type="text" id="com_id_view" name="com_id_form_view" /><br>
	command<input type="text" id="command" name="command" value="retrieve" readonly /><br>
	<input type="submit" /><br>
</form>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</body>
</html>