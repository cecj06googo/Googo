<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<title>Goo-go</title>
</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />
	<!-- Page Content -->
    <div class="container">
        <!--註冊 -->
        <div class="row">
        	<!--標頭-->
            <div class="col-lg-5 col-lg-offset-2">
                <h2 class="page-header"> 重設密碼 </h2>
            </div>
            </div><!--/.標頭-->
           <!--會員註冊內容-->
       		<div class="row">
            <div class="col-lg-5 col-lg-offset-2">
				
            	<jsp:include page="/_01_login/resetPwd.jsp" />
                </div><!--/.col-lg-5-->
                </div><!--/.row-->
                
     	<!-- 註冊成功 -->
        <jsp:include page="/_01_login/resetPwdSuccess.jsp" />
        <hr>
        <!-- Footer -->
        <jsp:include page="/_00_fragment/footer.jsp" />

    </div>
    <!-- /.container -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</body>

</html>