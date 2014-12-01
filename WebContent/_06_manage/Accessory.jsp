<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.products.model.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- top2 -->
	<jsp:include page="/_00_fragment/top2.jsp" />
<jsp:include page="/_00_fragment/css2.jsp" />
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<style type="text/css">
#accPic{
	height:80px; 
	width:100px;
}
td{
	align=center;
}
</style>
<title>Goo-go</title>

</head>
<body>
 <div id="wrapper">
	<!-- page-wrapper -->
        <div id="page-wrapper">
 			<!-- container-fluid -->
            <div class="container-fluid">
            <!--標頭-->  
       		<div class="row">
            <div class="col-lg-12">
                <h2 class="page-header"><i class="fa fa-fw fa-th-list"></i> 配件管理 <small>product</small> </h2>
            </div></div><!--/.標頭-->
        
       
        <div class="row">
		<div class="col-md-10 col-md-offset-1">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">配件		</h3>
            </div>
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>配件圖片</th>
                        <th>商品名稱</th>
                        <th>價格</th>
                        <th>配件說明</th>
                        <th class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="AccVO" items="${accList}">
                   	<tr id="${AccVO.accId}">
                   		<td id="${AccVO.accId}">
                   			<img id="accPic" src="${pageContext.servletContext.contextPath}/ShowAccsPicturs.do?comID=${AccVO.comId}&accID=${AccVO.accId}">
                   		</td>
                		<td id="${AccVO.accId}">${AccVO.accName}</td>
                    	<td id="${AccVO.accId}">${AccVO.accPrice}</td>
                    	<td id="${AccVO.accId}">${AccVO.accDetail}</td>
                    	<td class="text-center">
                        	<a href="#" class='btn btn-success'  data-toggle="modal" data-target="#editProduct" id="${AccVO.accId}"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                       		<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct" id="${AccVO.accId}"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    </tr>
                    	<input type="hidden" name="${AccVO.accId}AccId" value="${AccVO.accId}"/>
                    	<input type="hidden" name="${AccVO.accId}AccName" value="${AccVO.accName}"/>
                    	<input type="hidden" name="${AccVO.accId}AccPrice" value="${AccVO.accPrice}"/>
                    	<input type="hidden" name="${AccVO.accId}accDetail" value="${AccVO.accDetail}"/>
                    </c:forEach>
                </tbody>
            </table>
			</div>
		  
			
		   
			</div>
			</div>
			</div>
		<!--修改商品-->
		<jsp:include page="/_06_manage/product_edit.jsp" /> 
		<!--刪除商品-->
		<jsp:include page="/_06_manage/product_del.jsp" />
			
            </div><!-- /.container-fluid -->

        </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->



<script>
// $("td[class!=text-center]").click(function() {
// 	$("#ControlD").html('<td>手/自排:</td><td name="prodControlD"></td>');
// 	$("#CarrierD").html('<td>乘載人數:</td><td name="prodCarrierD"></td>');
// 	$("#CcD").html('<td>排氣量</td><td name="prodCcD"></td>');
// 	$("td[class!=text-center]").attr("data-toggle", "modal");
// 	$("td[class!=text-center]").attr("data-target","#prod_detail");
// 	var btnId = this.id;
<%-- 	var comId = <%= session.getAttribute("comId")%> --%>
// // 	alert("comId"+comId);
// // 	alert(btnId);
// 	$("#picDe").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=1");
// 	$("#subPicDe1").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=2");
// 	$("#subPicDe2").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=3");
// 	$("#subPicDe3").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=4");
// 	$("#picDeS").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=1");
// 	$("#subPicDe1S").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=2");
// 	$("#subPicDe2S").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=3");
// 	$("#subPicDe3S").attr("src","${pageContext.servletContext.contextPath}/ProdImg?comID="+comId+"&prodId="+ btnId + "&pic=4");

// 		var prodName = $("input[name='"+ btnId +"prodName']").val();
// 		var prodDisc = $("input[name='"+ btnId +"prodDisc']").val();
// 		var prodPrice = $("input[name='"+ btnId +"prodPrice']").val();
// 		$("input[name='prodName']").val(prodName);
// 		$("input[name='prodDisc']").val(prodDisc);
// 		$("input[name='prodPrice']").val(prodPrice);
// 		$("input[name='prodPlate']").val($("input[name='"+ btnId +"prodPlate']").val());
// 		$("input[name='prodCarrier']").val($("input[name='"+ btnId +"prodCarrier']").val());
// 		$("input[name='prodCc']").val($("input[name='"+ btnId +"prodCc']").val());
// 		$("textarea[name='prodArticle']").val($("input[name='"+ btnId +"prodArticle']").val());
// 		$("input[name='prodControl']").val($("input[name='"+ btnId +"prodControl']").val());
		
// 		$("td[name='prodDiscD']").text($("input[name='"+ btnId +"prodDisc']").val());
// 		$("td[name='prodPriceD']").text($("input[name='"+ btnId +"prodPrice']").val());
// 		$("td[name='prodControlD']").text("自排");
// 		$("td[name='prodCarrierD']").text($("input[name='"+ btnId +"prodCarrier']").val());
// 		$("td[name='prodCcD']").text($("input[name='"+ btnId +"prodCc']").val());
		
// 		//for edit btn and delete btn 'id
// 		$("a[name='editD']").attr("id",btnId);
// 		$("a[name='delD']").attr("id",btnId);
		
// 		//control CC CARRIER 
// 		var type = $("input[name='"+ btnId +"prodType']").val();
// 		$("tr[name='"+type+"']").empty();
// })
// 		// Stop carousel
// 		$('.carousel').carousel({
// 			interval : false
// 		});
// $("a[data-target='#editProduct']").click(function() {
//  		var btnId = this.id; 
// //  		alert(btnId);
//  		var prodName = $("input[name='"+ btnId +"prodName']").val();
//  		var prodDisc = $("input[name='"+ btnId +"prodDisc']").val();
//  		var prodPrice = $("input[name='"+ btnId +"prodPrice']").val();
//  		$("input[name='prodName']").val(prodName);
//  		$("input[name='prodDisc']").val(prodDisc);
//  		$("input[name='prodPrice']").val(prodPrice);
//  		$("input[name='prodPlate']").val($("input[name='"+ btnId +"prodPlate']").val());
//  		$("input[name='prodCarrier']").val($("input[name='"+ btnId +"prodCarrier']").val());
//  		$("input[name='prodCc']").val($("input[name='"+ btnId +"prodCc']").val());
//  		$("textarea[name='prodArticle']").val($("input[name='"+ btnId +"prodArticle']").val());
//  		$("input[name='prodId']").val($("input[name='"+ btnId +"prodId']").val());
// });

// $("a[data-target='#delProduct']").click(function() {
// 	var btnId = this.id; 
// // 	alert(btnId);
// 	$("#idForSent").val(btnId);
// });
</script>
</body>
</html>