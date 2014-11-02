<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.template.model.Prototype_OrderTemp_VO"%>
<% Prototype_OrderTemp_VO tempVo = (Prototype_OrderTemp_VO)request.getAttribute("tempVo"); %>
<!DOCTYPE html>
<html>
<head>
<title>View</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/codemirror.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/form_builder.css" rel="stylesheet">
</head>
<body>

<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<form role="form" action="<%=request.getContextPath()%>/DesignAccessDB" method="post">
			id<input type="text" id="id_view" name="id_form_view" /><br>
			com_id<input type="text" id="com_id_view" name="com_id_form_view" /><br>
			command<input type="text" id="command" name="command" value="retrieve" readonly /><br>
			<input type="submit" /><br>
		</form>
		<div class="alert alert-danger" role="alert">Shell Head</div>
		<div class="row">
			${tempVo.content}
		</div>
		<div class="alert alert-danger" role="alert">Shell Foot</div>
	</div>
</div>

<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<!-- 
<script src="<%=request.getContextPath()%>/js/form_builder.min.js"></script>
<script src="<%=request.getContextPath()%>/js/form_builder.js"></script>
<script src="<%=request.getContextPath()%>/js/codemirror.min.js"></script>
<script src="<%=request.getContextPath()%>/js/formatting.js"></script>
 -->
</body>
</html>