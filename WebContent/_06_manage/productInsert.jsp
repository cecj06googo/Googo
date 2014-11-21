<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.products.model.*" %>
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

#c1 {
	display: inline
}
#cc1 {
	display: inline
}
#cnl1 {
	display: inline
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
	
		document.getElementById("t1").addEventListener("change", hide1, false)
		document.getElementById("t2").addEventListener("change", hide2, false)
		document.getElementById("t3").addEventListener("change", hide3, false)
		
		var type = $("#type").val();//安泰要的
		var kind = $("#kind").val();
		var carrier = $("#carrier").val();
		var control = $("#control").val();
		$("input[name='prodType'][value='"+type+"']").prop("checked",true);//安泰要的
		$("option[class='pKind'][value='"+kind+"']").prop("selected",true);
		$("option[class='carrier'][value='"+carrier+"']").prop("selected",true);
		$("option[class='control'][value='"+control+"']").prop("selected",true);
		
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
	

	function hide1() {
		$("#prodKind").empty();
		$("#prodKind").html('<option class="pKind" value="1">轎車</option>	<option class="pKind" value="2">休旅車</option>');
		document.getElementById('c1').style.display = "inline";
		document.getElementById('cc1').style.display = "inline";
		document.getElementById('cnl1').style.display = "inline";
	}
	function hide2() {
		$("#prodKind").empty();
		$("#prodKind").html('<option class="pKind" value="3">大型重型機車</option><option class="pKind" value="4">普通重型機車</option><option class="pKind" value="5">普通輕型機車</option>');
		document.getElementById('c1').style.display = "none";
		document.getElementById('cc1').style.display = "inline";
		document.getElementById('cnl1').style.display = "none";
	}
	function hide3() {
		$("#prodKind").empty();
		$("#prodKind").html('<option class="pKind" value="6">越野腳踏車</option><option class="pKind" value="7">摺疊腳踏車</option><option class="pKind" value="8">電動腳踏車</option><option class="pKind" value="9">一般腳踏車</option>');
		document.getElementById('c1').style.display = "none";
		document.getElementById('cc1').style.display = "none";
		document.getElementById('cnl1').style.display = "none";
		$("#cc1").val("0");
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

	${MsgOK.InsertOK}            		
            				
 <!--上架商品form===============================================-->
         <form name="prodInsert" action="<%=request.getContextPath()%>/prod.in" enctype="multipart/form-data" method="post" >
             <div class="control-group form-group">
             <label class="control-label">商品種類</label>
<!--              //安泰要的 -->
             	<input type="hidden" id="type" value="${ProductVO.prodType}"/>
                <label class="control-label"><input type="radio" id="t1" name="prodType" value="1">汽車</label>
                <label class="control-label"><input type="radio" id="t2" name="prodType" value="2">機車</label>
                <label class="control-label"><input type="radio" id="t3" name="prodType" value="3">腳踏車</label>
                <br> <font size="-1" color="#FF0000">${ErrorMsg.errorProdType}</font>
            </div>
             <div class="control-group form-group ">
                <label class="control-label">商品名稱:</label>
                <div class="controls" >
                    <input type="text" class="form-control" name="prodName" value="${ProductVO.prodName}" placeholder="請輸入商品名稱" >
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
                <div id="div1"></div>
            </div>
            <div class="control-group form-group ">
                <label class="control-label">商品車號:</label>
                <div class="controls" >
                    <input type="text" class="form-control" name="prodPlate" value="${ProductVO.prodPlate}" placeholder="請輸入商品名稱" >
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
                <div id="div1"></div>
            </div>
            <div class="control-group form-group">
                <label  class="control-label">商品價格:</label>
                <div class="controls ">
                    <input type="text"  class="form-control" name="prodPrice" value="${ProductVO.prodPrice}" placeholder="請輸入商品價格" >
                </div>
                 <font size="-1" color="#FF0000">${ErrorMsg.errorProdPrice}</font>
            </div>
            <div class="control-group form-group">
                <label >商品優惠:</label>
                <div class="controls ">
                    <input type="text"  class="form-control" name="prodDisc" value="${ProductVO.prodDisc}" placeholder="請輸入商品優惠">
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdDisc}</font>
            </div>
            <div class="control-group  form-group">
             	<label >車輛類型:</label>
             	<input type="hidden" id="kind" value="${ProductVO.prodKind}"/>
                <select class="form-control" name="prodKind" id="prodKind">
<!--                 	不知道為啥不會顯示 -->
<%--                 	<c:if test="${ProductVO.prodType== '2'} "> --%>
<!--                 		<option class="pKind" value="3">大型重型機車</option> -->
<!--                 		<option class="pKind" value="4">普通重型機車</option> -->
<!--                 		<option class="pKind" value="5">普通輕型機車</option> -->
<%--                 	</c:if> --%>
<%--                 	<c:if test="${ProductVO.prodType== '3'} "> --%>
<%--                 		<c:out value=' --%>
<%--                 		<option class="pKind" value="6">越野腳踏車</option> --%>
<%--                 		<option class="pKind" value="7">摺疊腳踏車</option> --%>
<%--                 		<option class="pKind" value="8">電動腳踏車</option> --%>
<%--                 		<option class="pKind" value="9">一般腳踏車</option>'/>         	 --%>
<%--                 	</c:if> --%>
					</select>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdKind}</font>
            </div>             
            <div class="control-group  form-group" id="c1">
                <label class="show1">乘載人數:</label>
             	<input type="hidden" id="carrier" value="${ProductVO.prodCarrier}"/>
                <select class="form-control" name="prodCarrier">
                    <option class="carrier" value="2">2</option>
					<option class="carrier" value="3">3</option>
					<option class="carrier" value="4">4</option>
					<option class="carrier" value="5">5</option>
					<option class="carrier" value="6">6</option>
					<option class="carrier" value="7">7</option>
					<option class="carrier" value="8">8</option>
                </select>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdCarrier}</font>
            </div>
            <div class="control-group form-group" id="cc1">
                <label>排氣量:</label>
                <div class="controls ">
                    <input type="text" class="form-control" name="prodCc" value="${ProductVO.prodCc}" placeholder="請輸入排氣量">
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdCc}</font>
            </div>
			<div class="control-group form-group" id="cnl1">
                <label>手自排:</label>
                <div class="controls ">
                <input type="hidden" id="control" value="${ProductVO.prodControl}"/>
                <select name="prodControl">
					<option class="control" value="1" selected>手排</option>
					<option class="control" value="2">自排</option>
					<option class="control" value="3">手自排</option>
				</select>
					<font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font>
			</div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font>
            </div>
            <div class="control-group form-group">
                <label>商品說明:</label>
                <div class="controls ">
                    <textarea  rows="5" class="form-control" name="prodArticle" >${ProductVO.prodArticle}</textarea>
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
          
          <c:if test="${ProductVO.prodType == '1'}">
                 		<script>
                 		$("#prodKind").html('<option class="pKind" value="1">轎車</option><option class="pKind" value="2">休旅車</option>');
                 		document.getElementById('c1').style.display = "inline";
                		document.getElementById('cc1').style.display = "inline";
                		document.getElementById('cnl1').style.display = "inline";
                 		</script>
          </c:if>
          <c:if test="${ProductVO.prodType == '2'}">
                		<script>
                		$("#prodKind").html('<option class="pKind" value="3">大型重型機車</option><option class="pKind" value="4">普通重型機車</option><option class="pKind" value="5">普通輕型機車</option>');
                		document.getElementById('c1').style.display = "none";
                		document.getElementById('cc1').style.display = "inline";
                		document.getElementById('cnl1').style.display = "none";
                		</script>
           </c:if>
           <c:if test="${ProductVO.prodType == '3'}">
                		<script>
                		$("#prodKind").html('<option class="pKind" value="6">越野腳踏車</option><option class="pKind" value="7">摺疊腳踏車</option><option class="pKind" value="8">電動腳踏車</option><option class="pKind" value="9">一般腳踏車</option>');
                		document.getElementById('c1').style.display = "none";
                		document.getElementById('cc1').style.display = "none";
                		document.getElementById('cnl1').style.display = "none";
                		$("#cc1").val("0");
                		</script>
          </c:if>
          
          
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