<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css2.jsp" />
<title>Goo-go</title>

</head>
<script type="text/javascript">
<%-- 	<% int prod= Integer.parseInt(prodId); %> --%>
<%-- 	<% session.setAttribute("prodId", prod); %> --%>
function loadIn(prodId){
	alert(prodId);
}
</script>
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
                        <th>優惠</th>
                        <th>價格</th>
                        <th>車號</th>
                        <th class="text-center ath">修改/刪除</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="ProductVO" items="${car}">
                   	<tr>
                    	<td>${ProductVO.prodName}</td>
                    	<td>${ProductVO.prodDisc}</td>
                    	<td>${ProductVO.prodPrice}</td>
                    	<td>${ProductVO.prodPlate}</td>
                    	<td class="text-center">
                        	<a onclick="loadIn(${ProductVO.prodId})" class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct" ><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                       		<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    	</tr>
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
                    	<tr>
                    	<td>${ProductVO.prodName}</td>
                    	<td>${ProductVO.prodDisc}</td>
                    	<td>${ProductVO.prodPrice}</td>
                    	<td>${ProductVO.prodPlate}</td>
                    	<td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    	</tr>
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
                    	<tr>
                    	<td>${ProductVO.prodName}</td>
                    	<td>${ProductVO.prodDisc}</td>
                    	<td>${ProductVO.prodPrice}</td>
                    	<td>${ProductVO.prodPlate}</td>
                    	<td class="text-center">
                        	<a class='btn btn-info' href="#" data-toggle="modal" data-target="#editProduct"><span class="glyphicon glyphicon-edit"></span> 修改</a> 
                        	<a href="#" class="btn btn-danger " data-toggle="modal" data-target="#delProduct"><span class="glyphicon glyphicon-remove"></span> 刪除</a>
                        </td>
                    	</tr>
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

$("td[class!=text-center]").click(function(){
	$("td[class!=text-center]").attr( "data-toggle", "modal" );
	$("td[class!=text-center]" ).attr( "data-target", "#prod_detail" );
})

</script>

</body>
</html>