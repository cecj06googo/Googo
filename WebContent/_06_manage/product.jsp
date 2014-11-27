<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.products.model.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css2.jsp" />
<title>Goo-go</title>

</head>
<body>
 <div id="wrapper">
	<!-- top2 -->
	<jsp:include page="/_00_fragment/top2.jsp" />
	<!-- page-wrapper -->
        <div id="page-wrapper">
 			<!-- container-fluid -->
            <div class="container-fluid">
            <!--標頭-->  
       		<div class="row">
            <div class="col-lg-12">
                <h2 class="page-header"><i class="fa fa-fw fa-th-list"></i> 商品管理 <small>product</small> </h2>
            </div></div><!--/.標頭-->
        
	${MsgOK.InsertOK}     
        <!--汽車-->
        <div class="row">
		<div class="col-md-10 col-md-offset-1">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">汽車</h3>
            </div>
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>商品名稱</th>
<!--                         這邊的欄位應該要設成固定長度 -->
                        <th>優惠</th>
                        <th>價格</th>
                        <th>車號</th>
                        <th class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="ProductVO" items="${car}">
<%--                    <c:set var="prod'${ProductVO.prodId}'" value="${ProductVO}" scope="session"/> --%>
                   	<tr id="${ProductVO.prodId}">
                    	<td id="${ProductVO.prodId}">${ProductVO.prodName}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodDisc}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodPrice}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodPlate}</td>
                    	<td class="text-center">
                        	<a href="#" class='btn btn-info'  data-toggle="modal" data-target="#editProduct" id="${ProductVO.prodId}"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                       		<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct" id="${ProductVO.prodId}"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                         </td>
                    	</tr>
                    	<input type="hidden" name="${ProductVO.prodId}prodId" value="${ProductVO.prodId}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodName" value="${ProductVO.prodName}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodDisc" value="${ProductVO.prodDisc}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodPrice" value="${ProductVO.prodPrice}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodKind" value="${ProductVO.prodKind}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodPlate" value="${ProductVO.prodPlate}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodArticle" value="${ProductVO.prodArticle}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodArticle" value="${ProductVO.prodArticle}"/> 	
                    	<input type="hidden" name="${ProductVO.prodId}prodCarrier" value="${ProductVO.prodCarrier}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodCc" value="${ProductVO.prodCc}"/>
						<input type="hidden" name="${ProductVO.prodId}prodControl" value="${ProductVO.prodControl}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodType" value="${ProductVO.prodType}"/>
                    </c:forEach>
                </tbody>
            </table>
			</div>
		   
			</div>
			</div>
			</div><!--/.汽車-->
			
		<!--機車-->
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
        <div class="panel panel-yellow">
            <div class="panel-heading">
                <h3 class="panel-title">機車</h3>
            </div>
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr >
                        <th>商品名稱</th>
                        <th>優惠</th>
                        <th>價格</th>
                        <th>車號</th>
                        <th class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="ProductVO" items="${moto}">
                    	<tr id="${ProductVO.prodId}">
                    	<td id="${ProductVO.prodId}">${ProductVO.prodName}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodDisc}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodPrice}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodPlate}</td>
                    	<td class="text-center">
                   			<a href="#" id="${ProductVO.prodId}" class='btn btn-info'  data-toggle="modal" data-target="#editProduct" ><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                       		<a href="#" id="${ProductVO.prodId}" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    	</tr>
                    	<input type="hidden" name="${ProductVO.prodId}prodId" value="${ProductVO.prodId}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodName" value="${ProductVO.prodName}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodDisc" value="${ProductVO.prodDisc}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodPrice" value="${ProductVO.prodPrice}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodKind" value="${ProductVO.prodKind}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodPlate" value="${ProductVO.prodPlate}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodArticle" value="${ProductVO.prodArticle}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodArticle" value="${ProductVO.prodArticle}"/> 	
                    	<input type="hidden" name="${ProductVO.prodId}prodCarrier" value="${ProductVO.prodCarrier}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodCc" value="${ProductVO.prodCc}"/>
						<input type="hidden" name="${ProductVO.prodId}prodControl" value="${ProductVO.prodControl}"/>
						<input type="hidden" name="${ProductVO.prodId}prodType" value="${ProductVO.prodType}"/>
                    </c:forEach>                  
                </tbody>
            </table>
			</div>
		   
			</div>
			</div>
			</div><!--/.機車-->
		
		<!--腳踏車-->
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
        <div class="panel panel-green">
            <div class="panel-heading">
                <h3 class="panel-title">腳踏車</h3>
            </div>
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>商品名稱</th>
                        <th>優惠</th>
                        <th>價格</th>
                        <th>車號</th>
                        <th class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ProductVO" items="${bike}">
                    	<tr id="${ProductVO.prodId}">
                    	<td id="${ProductVO.prodId}">${ProductVO.prodName}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodDisc}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodPrice}</td>
                    	<td id="${ProductVO.prodId}">${ProductVO.prodPlate}</td>
                    	<td class="text-center">
               				<a href="#" id="${ProductVO.prodId}" class='btn btn-info'  data-toggle="modal" data-target="#editProduct" ><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                       		<a href="#" id="${ProductVO.prodId}" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                         </td>
                    	</tr>
                    	<input type="hidden" name="${ProductVO.prodId}prodId" value="${ProductVO.prodId}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodName" value="${ProductVO.prodName}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodDisc" value="${ProductVO.prodDisc}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodPrice" value="${ProductVO.prodPrice}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodKind" value="${ProductVO.prodKind}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodPlate" value="${ProductVO.prodPlate}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodArticle" value="${ProductVO.prodArticle}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodArticle" value="${ProductVO.prodArticle}"/> 	
                    	<input type="hidden" name="${ProductVO.prodId}prodCarrier" value="${ProductVO.prodCarrier}"/>
                    	<input type="hidden" name="${ProductVO.prodId}prodCc" value="${ProductVO.prodCc}"/>
						<input type="hidden" name="${ProductVO.prodId}prodControl" value="${ProductVO.prodControl}"/>
						<input type="hidden" name="${ProductVO.prodId}prodType" value="${ProductVO.prodType}"/>
<!--                     	Cc數 是否要顯示小數點 ?-->
<%--                     	<input type="hidden" name="${ProductVO.prodId}prodType" value="${ProductVO.prodType}"/> --%>
<%--                     	<img  name="${ProductVO.prodId}prodPic" class="img-responsive" --%>
<%-- 							src='${pageContext.servletContext.contextPath}/ComFirstPageImg?comID=${LoginComOK.comID}&prodId=${ProductVO.prodId}&pic=1' --%>
<!-- 							alt=""/> -->
                    </c:forEach>  
                </tbody>
            </table>
			</div>
		   
			</div>
			</div>
			</div><!--/.腳踏車-->
		<!--商品明細 -->	
		<jsp:include page="/_06_manage/prod_detail.jsp" />	
		<!--修改商品-->
		<jsp:include page="/_06_manage/product_edit.jsp" /> 
		<!--刪除商品-->
		<jsp:include page="/_06_manage/product_del.jsp" />
			
            </div><!-- /.container-fluid -->

        </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->



<script>
$("td[class!=text-center]").click(function() {
	$("#ControlD").html('<td>手/自排:</td><td name="prodControlD"></td>');
	$("#CarrierD").html('<td>乘載人數:</td><td name="prodCarrierD"></td>');
	$("#CcD").html('<td>排氣量</td><td name="prodCcD"></td>');
	$("td[class!=text-center]").attr("data-toggle", "modal");
	$("td[class!=text-center]").attr("data-target","#prod_detail");
	var btnId = this.id;
	var comId = <%= session.getAttribute("comId")%>
	alert("comId"+comId);
	alert(btnId);
	$("#picDe").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=1");
	$("#subPicDe1").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=2");
	$("#subPicDe2").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=3");
	$("#subPicDe3").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=3");
	$("#picDeS").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=1");
	$("#subPicDe1S").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=2");
	$("#subPicDe2S").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=3");
	$("#subPicDe3S").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=3");

		var prodName = $("input[name='"+ btnId +"prodName']").val();
		var prodDisc = $("input[name='"+ btnId +"prodDisc']").val();
		var prodPrice = $("input[name='"+ btnId +"prodPrice']").val();
		$("input[name='prodName']").val(prodName);
		$("input[name='prodDisc']").val(prodDisc);
		$("input[name='prodPrice']").val(prodPrice);
		$("input[name='prodPlate']").val($("input[name='"+ btnId +"prodPlate']").val());
		$("input[name='prodCarrier']").val($("input[name='"+ btnId +"prodCarrier']").val());
		$("input[name='prodCc']").val($("input[name='"+ btnId +"prodCc']").val());
		$("textarea[name='prodArticle']").val($("input[name='"+ btnId +"prodArticle']").val());
		$("input[name='prodControl']").val($("input[name='"+ btnId +"prodControl']").val());
		
		$("td[name='prodDiscD']").text($("input[name='"+ btnId +"prodDisc']").val());
		$("td[name='prodPriceD']").text($("input[name='"+ btnId +"prodPrice']").val());
		$("td[name='prodControlD']").text("自排");
		$("td[name='prodCarrierD']").text($("input[name='"+ btnId +"prodCarrier']").val());
		$("td[name='prodCcD']").text($("input[name='"+ btnId +"prodCc']").val());
		
		//for edit btn and delete btn 'id
		$("a[name='editD']").attr("id",btnId);
		$("a[name='delD']").attr("id",btnId);
		
		//control CC CARRIER 
		var type = $("input[name='"+ btnId +"prodType']").val();
		$("tr[name='"+type+"']").empty();
})
		// Stop carousel
		$('.carousel').carousel({
			interval : false
		});
$("a[data-target='#editProduct']").click(function() {
 		var btnId = this.id; 
//  		alert(btnId);
 		var prodName = $("input[name='"+ btnId +"prodName']").val();
 		var prodDisc = $("input[name='"+ btnId +"prodDisc']").val();
 		var prodPrice = $("input[name='"+ btnId +"prodPrice']").val();
 		$("input[name='prodName']").val(prodName);
 		$("input[name='prodDisc']").val(prodDisc);
 		$("input[name='prodPrice']").val(prodPrice);
 		$("input[name='prodPlate']").val($("input[name='"+ btnId +"prodPlate']").val());
 		$("input[name='prodCarrier']").val($("input[name='"+ btnId +"prodCarrier']").val());
 		$("input[name='prodCc']").val($("input[name='"+ btnId +"prodCc']").val());
 		$("textarea[name='prodArticle']").val($("input[name='"+ btnId +"prodArticle']").val());
 		$("input[name='prodId']").val($("input[name='"+ btnId +"prodId']").val());
});

$("a[data-target='#delProduct']").click(function() {
	var btnId = this.id; 
// 	alert(btnId);
	$("#idForSent").val(btnId);
});
</script>
</body>
</html>