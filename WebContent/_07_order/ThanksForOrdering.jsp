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
    <div class="row setup-content div-border" >
        <div class="col-xs-12 div-back">
            <div class="col-xs-12 div-css div-center">
                <h1>租訂完成</h1>
                <div class="col-xs-12 div-css div-center">
 					<form name="ord_form"  action="<%=request.getContextPath()%>/ActionMem.do" method="post">
					<h4>
					<span>親愛的 ${LoginMemOK.mem_name} 您好：</span><br><br>
					<span>系統已將您的訂單明細寄發至您的信箱中</span><br><br>
					<span>也可至「</span><a href="#" onclick="document.ord_form.submit();">我的訂單</a><span>」瀏覽訂單資訊</span><br><br>
					<span>期待您再度光臨 </span><br>
					   </h4>
 					
               
	                <input type="hidden" name="action" value="mem_ord"/>
	                </form>
                <br><br><br>
                <div class="col-xs-12">
                <a href="<c:url value='/index.jsp'/>"><button class="btn btn-default btn-lg" type="button">回首頁</button></a>
                </div>
                <br><br><br><br>
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