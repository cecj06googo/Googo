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
            <div class="col-lg-12">
                <h2 class="page-header"> 註冊 </h2>
            </div>
            </div><!--/.標頭-->
           <!--會員註冊內容-->
       		<div class="row">
            <div class="col-lg-12">
			<!--標籤-->
            <ul id="myTab" class="nav nav-tabs nav-justified">
                    <li class="active"><a href="#register-one" data-toggle="tab"><i class="fa fa-user"></i> 註冊會員</a>
                    </li>
                    <li class=""><a href="#register-two" data-toggle="tab"><i class="fa fa-briefcase"></i> 註冊商家</a>
                    </li>
                </ul><!--/.標籤-->
			<!--內容-->
            <div id="myTabContent" class="tab-content">
    		<!--標籤1內容-->
            <div class="tab-pane fade active in" id="register-one"><br>
            	<div class="row">
                    <div class="col-lg-12">
               			<img class="img-responsive" src="${pageContext.request.contextPath}/img/41.png" alt="">
        			</div></div>
        		<div class="row">
        		<div class="col-lg-5 col-lg-offset-1"><br>
            	<!--註冊會員form-->
            	<jsp:include page="/_02_register/registerMem.jsp" />
                </div><!--/.col-lg-5-->
                </div><!--/.ROW-->
                </div><!--/.標籤1內容-->
                    
           <!--標籤2內容-->
           <div class="tab-pane fade" id="register-two"><br>
           		<div class="row">
                <div class="col-lg-12">
               			<img class="img-responsive" src="${pageContext.request.contextPath}/img/42.jpg" alt="">
        		</div>
        		</div>
        		<div class="row">
        		<div class="col-lg-5 col-lg-offset-1">
            			<br>
            	<!--註冊商家form-->			
            	<jsp:include page="/_02_register/registerCom.jsp" />
                </div><!--/.col-lg-5-->
                </div><!--/.row-->
                </div><!--/.標籤2內容-->
           </div><!--/.內容-->
                    
        </div><!--/.註冊-->

     </div> <!-- /.row -->
     
     	<!-- 註冊成功 -->
        <jsp:include page="/_02_register/registerSuccess.jsp" />
        <hr>
        <!-- Footer -->
        <jsp:include page="/_00_fragment/footer.jsp" />

    </div>
    <!-- /.container -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</body>

</html>