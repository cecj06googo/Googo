<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.products.model.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 	
<jsp:include page="/_00_fragment/top2.jsp" />
<jsp:include page="/_00_fragment/css2.jsp" />
<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/bootstrapValidator.css"
	rel="stylesheet" />
<title>Goo-go</title>
</head>
<body>
	<div id="wrapper">
		<!-- top2 -->
		<!-- page-wrapper -->
		<div id="page-wrapper">
			<div class="container-fluid">

				<!--標頭-->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">
							<i class="fa  fa-briefcase"></i> 配備上架 <small>modification</small>
						</h2>
					</div>
				</div>
				<!--/.標頭-->
				<!--上架商品-->


				<!--上架商品form===============================================-->
				<form name="accInsert" id="accInsertForm"
					action="<%=request.getContextPath()%>/acc.in"
					enctype="multipart/form-data" method="post">

					<div class="row">
						<div class="col-md-6">
							<br> <label class="control-label">${MsgOK.InsertOK}</label>
							<div class="control-group form-group ">
								<label class="control-label">配備名稱:</label>
								<div class="controls">
									<input type="text" class="form-control" name="accName"
										 placeholder="請輸入配備名稱" 
										 data-toggle="tooltip" data-placement="top"
										 title="<h5>請輸入商品名稱<h5>">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
								<div id="div1"></div>
							</div>
							
							<div class="control-group form-group">
								<label class="control-label">配備價格:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="accPrice"
										placeholder="請輸入配備價格"
										data-toggle="tooltip" data-placement="top"
										title="<h5>請輸入商品價格<h5>">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPrice}</font>
							</div>
							<div class="control-group form-group">
								<label>配備說明:</label>
								<div class="controls ">
									<textarea rows="5" class="form-control" name="accDetail"></textarea>
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdArticle}</font>
							</div>
						</div>
						<div class="col-md-6">
							<br> <br> <br> <br>
							<div class="control-group form-group" id="pic1">
								<label>配備圖片:</label>
								<div>
									<img class="img-responsive" id="img1">
								</div>
								<input type="file" name="accPic" id="accPic"
									multiple="multiple" onchange="fileShow();" accept="image/*">
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPic}</font>
							</div>
							<br>
							<button type="submit" class="btn btn-success">新增</button>
							<button type="reset" class="btn btn-danger">取消</button>
							<font size="-1" color="#FF0000">${ErrorMsg.errTitle}</font>
						</div>
					</div>
				</form>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	
	<script>
	$("[data-toggle='tooltip']").tooltip({
		html : true
	});
	function fileShow() {
		document.getElementById('img1').style.display = "inline";
		var reader = new FileReader();
		reader.onload = function(e) {
			var fileContent = e.target.result;
			var show = document.getElementById("img1");
			show.setAttribute("src", fileContent);
		}
		file = document.getElementById("accPic").files[0];
		reader.readAsDataURL(file);
	}
	(function($) {
		$(document).ready(function() {
					
					$("#accInsertForm").bootstrapValidator({
				    	feedbackIcons: {
				    		valid : 'glyphicon glyphicon-ok',
							invalid: 'glyphicon glyphicon-remove',
							validating: 'glyphicon glyphicon-refresh'
				    	},
				    	
				    	fields: {
				    		accName: {
								trigger: 'keyup blur',
								validators: {
									notEmpty: {
										message: '商品名稱不可空白'
									},
									stringLength: {
										min: 1,
										max: 16,
										message: '名稱長度限1~16字數'
									},
									regexp : {
										regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9)]+$/,
										message: '只能是中、英文字母、數字和-'
									},
								} // end validators
							}, // 
							
							accPrice: {
								trigger: 'keyup blur',
								validators: {
									notEmpty: {
										message:'請勿空白'
									},
									stringLength: {
										min: 2,
										max: 8,
										message: '2~8數字'
									},
									regexp : {
										regexp: /^[(\.0-9)]{2,8}$/,
										message: '格式錯誤, 只能是數字'
									},
								} // end validators
							}, // 
							
				    	} // end fields
				    }); // end bootstrapValidator
		})})(jQuery)
	
	
	</script>


</body>
</html>