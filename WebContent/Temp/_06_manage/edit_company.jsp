<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.company.model.*"%>
<%@ page import="java.io.*" %>

<%
	CompanyVO companyVO = (CompanyVO) request.getAttribute("companyVO");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>manage</title>

<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="<%=request.getContextPath()%>/css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=request.getContextPath()%>/font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="<%=request.getContextPath()%>/C_index.jsp" id="logo"> <i
				class="fa fa-car"></i><span class="light"> 租車網</span> Goo-go
			</a> <font class="navbar-brand page-scroll light">${companyVO.comName}</font>
		</div>
		<!-- 提醒 -->
		<ul class="nav navbar-right top-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-bell"></i> <b
					class="caret"></b></a>
				<ul class="dropdown-menu message-dropdown">
					<!-- 提醒1 -->
					<li class="message-preview"><a href="#">
							<div class="media">
								<span class="pull-left"> <img class="media-object"
									src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<span class="label label-default">取消訂單</span>
									<p class="medium text-muted">
										<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM<br>會員:李安泰<br>訂單編號:11111
									</p>
								</div>
							</div>
					</a></li>
					<!-- 提醒2 -->
					<li class="message-preview"><a href="#">
							<div class="media">
								<span class="pull-left"> <img class="media-object"
									src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<span class="label label-primary">收到訂單</span>
									<p class="medium text-muted">
										<i class="fa fa-clock-o"></i> Yesterday at 5:32 PM<br>會員:李安泰<br>訂單編號:22222
									</p>
								</div>
							</div>
					</a></li>
					<!-- 提醒3-->
					<li class="message-preview"><a href="#">
							<div class="media">
								<span class="pull-left"> <img class="media-object"
									src="http://placehold.it/50x50" alt="">
								</span>
								<div class="media-body">
									<span class="label label-danger">尚未還車</span>
									<p class="medium text-muted">
										<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM<br>會員:李安泰<br>訂單編號:33333
									</p>
								</div>
							</div>
					</a></li>
					<li class="message-footer"><a href="#">查看訂單</a></li>
				</ul></li>
			<!-- /.提醒 -->
			<!-- 商家專區 -->
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-briefcase"></i> 拉拉租車小舖 <b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li>
					<a href="#editCompany"><i class="fa fa-fw fa-pencil"></i> 修改商家資訊</a>
					</li>
					<li><a href="#"><i class="fa fa-fw fa-info"></i> 幫助</a></li>

					<li class="divider"></li>
					<li><a href="#"><i class="fa fa-fw fa-power-off"></i> 登出</a></li>
				</ul></li>
		</ul>
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li>
					<a href="C_manage.jsp"><i class="fa fa-fw fa-bar-chart-o"></i>報表分析</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-book"></i> 訂單管理</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-file-text-o"></i>問券分析</a>
				</li>
				<li>
					<a href="javascript:;" data-toggle="collapse" data-target="#demo">
				<i class="fa fa-fw fa-th-list"></i> 庫存管理 <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="demo" class="collapse">
						<li><a href="#">新品上架</a></li>
						<li><a href="#">車輛管理</a></li>
						<li><a href="#">配件管理</a></li>
					</ul></li>
				<li>
					<a href="#"><i class="fa fa-fw fa-clipboard"></i> 設計訂單</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-fw fa-edit"></i> 設計問券</a>
				</li>
				<li class="active">
					<a href="#editCompany"> <i class="fa fa-fw fa-pencil"></i> 修改商家資訊</a>
				</li>
					<li><a href="manage_help.html"><i class="fa fa-fw fa-info"></i>幫助</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							修改資訊 <small>company profile</small>
						</h1>
					</div>
					<div>
						<font color="red" size="3">${successMsgs.seccessUpdate}</font>
					</div>
				</div>
				<!-- /.row -->
				<!-- 商家修改資料 -->
					<div class="row">
					<div class="col-lg-6">
						<form name="comFormU" enctype="multipart/form-data" method="POST" action="<%=request.getContextPath()%>/Company.Update" id="editCompany">
							<div class="control-group form-group ">
								<label>帳號:</label>
								<div class="controls">
									<input type="text" class="form-control" name="comAccount"
										id="com_account" value="${companyVO.comAccount}" disabled /> 
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorAccount}</font></span>
							</div>
							<div class="control-group form-group">
								<label>密碼:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="comPwd"
										id="com_pwd" value="${companyVO.comPwd}">
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorPwd}</font></span>
							</div>
							<div class="control-group form-group">
								<label>商家名稱:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="comName"
										id="com_name" value="${companyVO.comName}">
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorNameEmpty}${errorMsgs.errorNameFormat}</font></span>
							</div>
							<div class="control-group form-group">
								<label>負責人:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="comOwner"
										id="com_owner" value="${companyVO.comOwner}">
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorOwnerEmpty}${errorMsgs.errorOwnerFormat}</font></span>
							</div>
							<div class="control-group form-group">
								<label>地址:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="comAddr"
										id="com_address" value="${companyVO.comAddr}">
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorAddrEmpty}${errorMsgs.errorAddrFormat}</font></span>
							</div>
							<div class="control-group form-group">
								<label>電話:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="comTel"
										id="com_tel" value="${companyVO.comTel}">
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorTelEmpty}${errorMsgs.errorTelFormat}</font></span>
							</div>
							<div class="control-group form-group">
								<label>fax:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="comFax"
										id="com_fax" value="${companyVO.comFax}">
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorFaxFormat}</font></span>
							</div>
							<div class="control-group form-group">
								<label>營業統編:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="comVAT"
										id="com_vat" value="${companyVO.comVAT}" disabled />
								</div>
								<span><font color="red" size="-1">${errorMsgs.errorVATEmpty}${errorMsgs.errorVATFormat}${errorMsgs.errorVATDup}</font></span>
							</div>
							<div class="control-group form-group">
								<label>商家封面圖片:</label> <input type="file" name="comPic">
							</div>
							<span></span>
							 <br> 
							<input type="hidden" name="action" value="update"> 
							<input type="hidden" name="comID" value="${companyVO.comID}"> 
							<input type="hidden" name="comAccount" value="${companyVO.comAccount}">
							<input type="hidden" name="comVAT" value="${companyVO.comVAT}">
							<input type="hidden" name="comStatus" value="${companyVO.comStatus}">
							<button type="submit" class="btn btn-danger">儲存</button>
						</form>
					</div>
					<div class="col-lg-6">
						<img class="img-responsive" src='${pageContext.servletContext.contextPath}/image?comID=${companyVO.comID}' alt=""> <!-- http://placehold.it/750x450  -->
<!-- 					</div> -->
<!-- 					選取檔案 -->
<!-- 						<form name="imageupload" enctype="multipart/form-data" action="image" method="POST"> -->
<!-- 							<div class="control-group form-group"> -->
<!-- 								<label>商家封面圖片:</label> <input type="file" name="file">  -->
<%-- 								<input type="hidden" name="comID2" value="<%=companyVO.getComID()%>"> --%>
<!-- 								<button type="submit" class="btn btn-default">上傳</button> -->
<!-- 							</div> -->
<!-- 						</form> -->
<!-- 				</div> -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
    <!-- /#wrapper -->
	

	<!-- jQuery Version 1.11.0 -->
	<script src="<%=request.getContextPath()%>/js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="<%=request.getContextPath()%>/js/plugins/morris/raphael.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins/morris/morris.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins/morris/morris-data.js"></script>

	<!-- Flot Charts JavaScript -->
	<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
	<script src="<%=request.getContextPath()%>/js/plugins/flot/jquery.flot.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins/flot/jquery.flot.pie.js"></script>
	<script src="<%=request.getContextPath()%>/js/plugins/flot/flot-data.js"></script>
	
	
	

</body>

</html>