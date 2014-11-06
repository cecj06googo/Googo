<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單頁面</title>
</head>
<style>
#pic2 {
	display: none
}

#pic3 {
	display: none
}

#pic4 {
	display: none
}
</style>
<script>
	// 	動態顯示第二、三張圖片的欄位
	window.onload = function() {
		document.getElementById("prodPic").addEventListener("change",
				clickDiv1, false);
		document.getElementById("prodSubPic1").addEventListener("change",
				clickDiv2, false);
		//onclick oninput onsubmit
		document.getElementById("prodSubPic2").addEventListener("change",
				clickDiv3, false);
	}

	function clickDiv1() {
		document.getElementById('pic2').style.display = "inline";
		alert("show SubPic1");
	}
	function clickDiv2() {
		document.getElementById('pic3').style.display = "inline";
		alert("show SubPic2");
	}
	function clickDiv3() {
		document.getElementById('pic4').style.display = "inline";
		alert("show SubPic3");
	}
</script>
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
	<hr>
	${MsgOK.InsertOK}

	<font color="blue"><b>商品</b></font>
	<%-- 		<form action="<%=request.getContextPath()%>/fakeData.gg" method="post"> --%>
	<!-- 			<div>會員編號: <input type="text" name="mem_id" value="1" /><font -->
	<%-- 				size="-1" color="#FF0000">${ErrorMsg.errorMem_id}</font> --%>
	<!-- 				<p></div> -->
	<!-- 			<div>商家編號: <input type="text" name="com_id" value="1" /><font -->
	<%-- 				size="-1" color="#FF0000">${ErrorMsg.errorCom_id}</font> --%>
	<!-- 				<p></div> <input type="hidden" name="action" value="insert"> <input -->
	<!-- 				type="submit" value="存入session" /> -->
	<!-- 		</form> -->
	<div>
		<form name="comFormU" enctype="multipart/form-data" method="POST"
			action="<%=request.getContextPath()%>/Insert_prod.in">
			<!-- 			編號要記得刪掉 -->
			<div>
				<input type="file" name="file_upload" id="file_upload_1" />
				<script type="text/javascript">
					$(function() {
						$("#file_upload_1").uploadify({
							height : 30,
							swf : '/uploadify/uploadify.swf',
							uploader : '/uploadify/uploadify.php',
							width : 120
						});
					});
				</script>
			</div>
			<div>
				商品種類: <input type="radio" name="prodType" value="1" checked>汽車
				<input type="radio" name="prodType" value="2">機車 <input
					type="radio" name="prodType" value="3">腳踏車 <font size="-1"
					color="#FF0000">${ErrorMsg.errorProdType}</font>
			</div>
			<div>
				商品名稱: <input type="text" name="prodName" value="1" /><font
					size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
			</div>
			<div>
				商品價格: <input type="text" name="prodPrice" value="1" /><font
					size="-1" color="#FF0000">${ErrorMsg.errorProdPrice}</font>
			</div>
			<div>
				商品優惠: <input type="text" name="prodDisc" value="1" /><font
					size="-1" color="#FF0000">${ErrorMsg.errorProdDisc}</font>
			</div>
			<div>
				車輛類型: <select name="prodKind">
					<option value="1">轎車</option>
					<option value="2">休旅車</option>
					<option value="3">大型重型機車</option>
					<option value="4">普通重型機車</option>
					<option value="5">普通輕型機車</option>
					<option value="6">越野腳踏車</option>
					<option value="7">摺疊腳踏車</option>
					<option value="8">電動腳踏車</option>
					<option value="9">一般腳踏車</option>
				</select> <font size="-1" color="#FF0000">${ErrorMsg.errorProdKind}</font>
			</div>
			<div>
				乘載人數: <select name="prodCarrier">
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4" selected>4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select> <font size="-1" color="#FF0000">${ErrorMsg.errorProdCarrier}</font>
			</div>
			<div>
				排氣量: <input type="text" name="prodCc" value="1" /><font size="-1"
					color="#FF0000">${ErrorMsg.errorProdCc}</font>
			</div>
			<div>
				手自排: <input type="text" name="prodControl" value="1" /><font
					size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font>
			</div>
			<div>
				商品說明: <input type="text" name="prodArticle" value="1" /><font
					size="-1" color="#FF0000">${ErrorMsg.errorProdArticle}</font>
			</div>
			<divid="pic1"> 商品封面圖片: <input type="file" name="prodPic"
				id="prodPic" /> <font size="-1" color="#FF0000">${ErrorMsg.errorProdPic}</font>
	</div>
	<div id="pic2">
		商品圖片: <input type="file" name="prodSubPic1" id="prodSubPic1" /><font
			size="-1" color="#FF0000">${ErrorMsg.errorProdSsubpic1}</font>
	</div>
	<div id="pic3">
		商品圖片: <br /> <input type="file" name="prodSubPic2" id="prodSubPic2" />
		<font size="-1" color="#FF0000">${ErrorMsg.errorProdSubpic2}</font>
	</div>
	<div id="pic4">
		商品圖片: <br /> <input type="file" name="prodSubPic3" id="prodSubPic3" />
		<font size="-1" color="#FF0000">${ErrorMsg.errorProdSubpic3}</font>
	</div>
	<input type="submit" value="新增" />
	<font size="-1" color="#FF0000">${ErrorMsg.errTitle}</font>
	<input type="reset" value="取消" />

	</form>
	</div>

	<hr>
	<!-- script -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<!-- script -->
</body>
</html>