<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css2.jsp" />
<title>Goo-go</title>
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
	// 	動態顯示第一、二、三張圖片的欄位
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
    <h2 class="page-header"><i class="fa  fa-briefcase"></i> 商品上架 <small>modification</small> </h2>
</div> </div><!--/.標頭-->
<!--上架商品-->
<div class="row">
<div class="col-lg-5 col-lg-offset-1"><br>

<!-- 顯示session中的假資料 -->
	<c:if test="${not empty sessionScope.mem_id}">
		<font>
			session內的會員編號：
			<c:out value="${sessionScope.mem_id}" />
		</font>
	</c:if>
	<c:if test="${not empty sessionScope.com_id}">
		<font>
			session內的商家編號：
			<c:out value="${sessionScope.com_id}" />
		</font>
	</c:if>
	${MsgOK.InsertOK}            		
            				
 <!--上架商品form===============================================-->
         <form name="prodInsert" action="<%=request.getContextPath()%>/prod.in" enctype="multipart/form-data" method="post" >
             <div class="control-group form-group">
             <label class="control-label">商品種類</label>
                <label class="control-label"><input type="radio" name="prodType" value="1">汽車</label>
                <label class="control-label"><input type="radio" name="prodType" value="2">機車</label>
                <label class="control-label"><input type="radio" name="prodType" value="3">腳踏車</label>
                <br> <font size="-1" color="#FF0000">${ErrorMsg.errorProdType}</font>
            </div>
             <div class="control-group form-group ">
                <label class="control-label">商品名稱:</label>
                <div class="controls" >
                    <input type="text" class="form-control" name="prodName" value="${ProductsVO.prodName}" placeholder="請輸入商品名稱" >
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
                <div id="div1"></div>
            </div>
            <div class="control-group form-group ">
                <label class="control-label">商品車號:</label>
                <div class="controls" >
                    <input type="text" class="form-control" name="prodPlate" value="${ProductsVO.prodPlate}" placeholder="請輸入商品名稱" >
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
                <div id="div1"></div>
            </div>
            <div class="control-group form-group">
                <label  class="control-label">商品價格:</label>
                <div class="controls ">
                    <input type="text"  class="form-control" name="prodPrice" value="${ProductsVO.prodPrice}" placeholder="請輸入商品價格" >
                </div>
                 <font size="-1" color="#FF0000">${ErrorMsg.errorProdPrice}</font>
            </div>
            <div class="control-group form-group">
                <label >商品優惠:</label>
                <div class="controls ">
                    <input type="text"  class="form-control" name="prodDisc" value="${ProductsVO.prodDisc}" placeholder="請輸入商品優惠">
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdDisc}</font>
            </div>
            <div class="control-group  form-group">
             	<label >車輛類型:</label>
                <select class="form-control" name="prodKind">
                    <option value="1">轎車</option>
					<option value="2">休旅車</option>
					<option value="3">大型重型機車</option>
					<option value="4">普通重型機車</option>
					<option value="5">普通輕型機車</option>
					<option value="6">越野腳踏車</option>
					<option value="7">摺疊腳踏車</option>
					<option value="8">電動腳踏車</option>
					<option value="9">一般腳踏車</option>
                </select>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdKind}</font>
            </div>
             <div class="control-group  form-group">
                <label >乘載人數:</label>
                <select class="form-control" name="prodCarrier">
                    <option value="2">2</option>
					<option value="3">3</option>
					<option value="4" selected>4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
                </select>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdCarrier}</font>
            </div>
            <div class="control-group form-group">
                <label>排氣量:</label>
                <div class="controls ">
                    <input type="text" class="form-control" name="prodCc" value="${ProductsVO.prodCc}" placeholder="請輸入排氣量">
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdCc}</font>
            </div>
			<div class="control-group form-group">
                <label>手自排:</label>
                <div class="controls ">
                <select name="prodControl">
					<option value="1" selected>手排</option>
					<option value="2">自排</option>
					<option value="3">手自排</option>
				</select>
					<font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font>
			</div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font>
            </div>
            <div class="control-group form-group">
                <label>商品說明:</label>
                <div class="controls ">
                    <textarea  rows="5" class="form-control" name="prodArticle" >${ProductsVO.prodArticle}</textarea>
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdArticle}</font>
            </div>
            <div class="control-group form-group" id="pic1">
                   <label >商品封面圖片:</label>
                   <img src="img/13.jpg">
                   <input type="file" name="prodPic" id="prodPic">
                   <font size="-1" color="#FF0000">${ErrorMsg.errorProdPic}</font>
            </div>
            <div class="control-group form-group" id="pic2">
                   <label >商品圖片:</label>
                   <img src="img/13.jpg">
                   <input type="file" name="prodSubPic1" id="prodSubPic1">
                   <font size="-1" color="#FF0000">${ErrorMsg.errorProdSsubpic1}</font><br>
            </div>
            <div class="control-group form-group" id="pic3">
                   <label >商品圖片:</label>
                   <img src="img/13.jpg">
                   <input type="file" name="prodSubPic2" id="prodSubPic2">
                   <font size="-1" color="#FF0000">${ErrorMsg.errorProdSsubpic2}</font><br>
            </div>
            <div class="control-group form-group" id="pic4">
                   <label >商品圖片:</label>
                   <img src="img/13.jpg">
                   <input type="file" name="prodSubPic3" id="prodSubPic3"><br>
                     <font size="-1" color="#FF0000">${ErrorMsg.errorProdSsubpic3}</font>
            </div>
      		
          	  <button type="reset" class="btn btn-primary" >取消 </button>
          	  <font size="-1" color="#FF0000">${ErrorMsg.errTitle}</font>
              <button type="submit" class="btn btn-danger" >新增</button>
          </form>
          </div>
          </div>
</div><!-- /.container-fluid -->
</div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->  
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script>

</script>


</body>
</html>