<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<!-- 實測結果，include會把上層的.js吃掉，
-----若.js是包在下層的include內，一樣不認得 (*原因不明)
-----問題根源在於jsp背後的編碼內情   -->
<jsp:include page="/_00_fragment/top1.jsp" />
<jsp:include page="/_00_fragment/css.jsp" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- 順序不可動 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/_07_order/order.css" rel="stylesheet">
<title>訂單頁面</title>
</head>

<body>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-xs-12">
				<h1 class="page-header">
<!-- 				在此comVO是用振瑋的VO -->
					${comVO.comName}  <small>租車小舖</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

<!-------------- 流程顯示 ------------------>

<div class="stepwizard div-mar-left">
    <div class="stepwizard-row setup-panel">
        <div class="stepwizard-step">
            <a href="#step-1" type="button" class="btn btn-default" id="circle" disabled="disabled">1</a>
            <p class="p-width">&nbsp訂車資訊&nbsp</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-2" type="button" class="btn btn-default" id="circle" disabled="disabled">2</a>
            <p class="p-width">駕駛人資訊</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-3" type="button" class="btn btn-default" id="circle" disabled="disabled">3</a>
            <p class="p-width">&nbsp&nbsp其他資訊&nbsp&nbsp</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-4" type="button" class="btn btn-primary" id="circle" >4</a>
            <p class="p-width">&nbsp&nbsp&nbsp&nbsp完成&nbsp&nbsp&nbsp&nbsp</p>
        </div>
    </div>
</div>

<!-------------- /.流程顯示 ---------------->

<!-------------- 訂單第四頁 ------------------>
<!-- submit後回來顯示第四頁  (最簡單的方法是連到另一支樣式一模一樣的jsp) -->
<!-- c:if (訂單新增ok(Map物件) != null    -->
    <div class="row setup-content div-border x-border x-border" >
        <div class="col-xs-12 div-back div-height x-border">
            <div class="col-xs-12 div-css x-border">
                <span class="harder-font">完成</span>
                <div>
                
                <div class="col-xs-12 div-css x-border">
                <br><br>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </div>
                
              <div class="col-xs-12 div-css x-border">
                <button class="btn btn-success btn-lg pull-right" type="button">返回首頁</button>
                <button class="btn btn-success btn-lg pull-right" type="button">訂單管理</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-------------- /.訂單第四頁 ---------------->	







		<hr>
		<!-- Footer -->
		<jsp:include page="/_00_fragment/footer.jsp" />

	</div>
	<!-- /.container -->

</body>

</html>