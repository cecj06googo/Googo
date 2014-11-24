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
<link href="${pageContext.request.contextPath}/_07_order/jquery.datetimepicker.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/_07_order/jquery.datetimepicker.js"></script>

<script>
$(document).ready(function () {

	$('#show').datetimepicker({
		  lang:'zh-TW'
		  
	});
});
</script>
</head>
	
<body>
<%-- <jsp:include page="/_00_fragment/top1.jsp" /> --%>
   	<!-- 登入 -->
		
		<!-- 忘記密碼 -->
<%-- 		<jsp:include page="/_01_login/forgetPwd.jsp" /> --%>



<label><span class="span-red">*</span>取車日期</label>
<%--                    <input type="image" id="icon-calendar" src="${pageContext.request.contextPath}/img/order/calendar.png"> --%>
				   <input id="show"  maxlength="100" type="text" required="required" class="form-control" placeholder="請選擇日期" />
<input   maxlength="100" type="text" required="required" class="form-control"  />

</body>
</html>