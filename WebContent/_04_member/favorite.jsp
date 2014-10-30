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
    	<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">收藏清單<small>favorite</small></h1>
            </div>
        </div>
    	
         <div class="row">
        
        <div class="col-md-4 col-sm-6">
          <div class="thumbnail">
          	<div class="caption"><button class="btn btn-default pull-right"><i class="fa fa-times"></i></button></div>
            <img src="${pageContext.request.contextPath}/img/19.jpg" alt="">
              <div class="caption">
                <a href="company.html"><h3>拉拉租車行</h3></a>
                <h4>NISSAN LAVINA</h4>
                <p>車種:休旅車</p>
                <p>地址:台北市復興南路一段369號</p>
                <p>電話:02-3698-5698</p>
                <p><a href="#" class="btn btn-danger center-block" role="button">我要租</a> </p>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-6">
          <div class="thumbnail">
          	<div class="caption"><button class="btn btn-default pull-right"><i class="fa fa-times"></i></button></div>
            <img src="${pageContext.request.contextPath}/img/20.jpg" alt="">
              <div class="caption">
                <a href="company.html"><h3>拉拉租車行</h3></a>
                <h4>NISSAN LAVINA</h4>
                <p>車種:休旅車</p>
                <p>地址:台北市復興南路一段369號</p>
                <p>電話:02-3698-5698</p>
                <p><a href="#" class="btn btn-danger center-block" role="button">我要租</a></p>
            </div>
          </div>
        </div>

        
       


<!--***************-->

        <div class="col-md-4 col-sm-6">
          <div class="thumbnail">
          	<div class="caption"><button class="btn btn-default pull-right"><i class="fa fa-times"></i></button></div>
            <img src="${pageContext.request.contextPath}/img/20.jpg" alt="">
              <div class="caption">
                <a href="company.html"><h3>拉拉租車行</h3></a>
                <h4>NISSAN LAVINA</h4>
                <p>車種:休旅車</p>
                <p>地址:台北市復興南路一段369號</p>
                <p>電話:02-3698-5698</p>
                <p><a href="#" class="btn btn-danger center-block" role="button">我要租</a></p>
            </div>
          </div>
        </div>
        
        <div class="col-md-4 col-sm-6">
          <div class="thumbnail">
          	<div class="caption"><button class="btn btn-default pull-right"><i class="fa fa-times"></i></button></div>
            <img src="${pageContext.request.contextPath}/img/20.jpg" alt="">
              <div class="caption">
                <a href="company.html"><h3>拉拉租車行</h3></a>
                <h4>NISSAN LAVINA</h4>
                <p>車種:休旅車</p>
                <p>地址:台北市復興南路一段369號</p>
                <p>電話:02-3698-5698</p>
                <p><a href="#" class="btn btn-danger center-block" role="button">我要租</a></p>
            </div>
          </div>
        </div>
        
        
        
        <div class="col-md-2 col-sm-6 ">
         <div class="row">
          <div class="alert alert-success">
                <h4>沒有喜歡的嗎?</h4>
                <p><a href="#" class="btn btn-success center-block" role="button">找車車</a>
             </div>
          </div>
        </div>
      
   </div><!-- End row -->
   <hr>
   <!-- Footer -->
   <jsp:include page="/_00_fragment/footer.jsp" />

    </div>
    <!-- /.container -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</body>

</html>