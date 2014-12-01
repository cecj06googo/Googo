<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.products.model.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css2.jsp" />
<title>Goo-go</title>
<style>
</style>
</head>
<body>
	<div id="wrapper">
		<!-- top2 -->
		<jsp:include page="/_00_fragment/top2.jsp" />
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
				<form name="accInsert"
					action="<%=request.getContextPath()%>/acc.in"
					enctype="multipart/form-data" method="post">

					<div class="row">
						<div class="col-md-6">
							<br> <label class="control-label">${MsgOK.InsertOK}</label>
							<div class="control-group form-group ">
								<label class="control-label">配備名稱:</label>
								<div class="controls">
									<input type="text" class="form-control" name="accName"
										value="${ProductVO.prodName}" placeholder="請輸入配備名稱">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
								<div id="div1"></div>
							</div>
							
							<div class="control-group form-group">
								<label class="control-label">配備價格:</label>
								<div class="controls ">
									<input type="text" class="form-control" name="accPrice"
										value="${ProductVO.prodPrice}" placeholder="請輸入配備價格">
								</div>
								<font size="-1" color="#FF0000">${ErrorMsg.errorProdPrice}</font>
							</div>
							<div class="control-group form-group">
								<label>配備說明:</label>
								<div class="controls ">
									<textarea rows="5" class="form-control" name="accArticle">${ProductVO.prodArticle}</textarea>
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
							<button type="reset" class="btn btn-primary">取消</button>
							<font size="-1" color="#FF0000">${ErrorMsg.errTitle}</font>
							<button type="submit" class="btn btn-danger">新增</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script>
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
	</script>


</body>
</html>