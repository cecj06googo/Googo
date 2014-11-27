<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<title>Goo-go</title>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9 ]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->



</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />
    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/img/01.jpg');"></div>
                <div class="carousel-caption">
                    <h1>One more for good measure.</h1>
              		<p>123</p>
          		    <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/img/2.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/img/4.JPG');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">
		<br>
		<!-- Search bar -->
		<div class="well">
		<div class="row">
		<div class="col-lg-12 text-center">
     	<jsp:include page="/_03_research/researchBar.jsp" />
      
		</div>
		</div>
		</div>
		<!-- /.Search bar -->

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">ad</h2>
            </div>
        	<!-- 圖一 1200*1000 -->
            <div class="col-md-4 col-sm-6 ">
                <a href="<c:url value='/PlaceRecommend.do'/>" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>宜蘭衝浪</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/img/07.jpg" alt="">
                </a>
            </div>
        	<!-- 圖二 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="<c:url value='/_03_research/site.jsp'/>" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>熱氣球</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/img/08.jpg" alt="">
                </a>
            </div>
        	<!-- 圖三 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="<c:url value='/_03_research/site.jsp'/>" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>高雄愛河</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/img/09.jpg" alt="">
                </a>
            </div>
       		<!-- 圖四 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="<c:url value='/_03_research/site.jsp'/>" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>台北101</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/img/10.jpg" alt="">
                </a>
            </div>
            <!-- 圖五 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="<c:url value='/_03_research/site.jsp'/>" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>海洋公園</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/img/11.jpg" alt="">
                </a>
            </div>
            <!-- 圖六 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="<c:url value='/_03_research/site.jsp'/>" class="portfolio-link">
                	<div class="caption">
                            <div class="caption-content">
                               <h1>天空之城</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/img/12.jpg" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->

        <!-- Features Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">簡介Goo-go</h2>
            </div>
            <div class="col-md-6">
                <p>The Modern Business template by Start Bootstrap includes:</p>
                <ul>
                    <li><strong>Bootstrap v3.2.0</strong>
                    </li>
                    <li>jQuery v1.11.0</li>
                    <li>Font Awesome v4.1.0</li>
                    <li>Working PHP contact form with validation</li>
                    <li>Unstyled page elements for easy customization</li>
                    <li>17 HTML pages</li>
                </ul>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
            </div>
            <div class="col-md-6">
                <img class="img-responsive" src="${pageContext.request.contextPath}/img/40.jpg" alt="">
            </div>
        </div>
        <!-- /.row -->

        <hr>
		<!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">如何開店?開店好處</h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> Free &amp; Open Source</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> Easy to Use</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <!-- well -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-default btn-block" href="<c:url value='/_02_register/register2.jsp'/>">註冊商家</a>
                </div>
            </div>
        </div>  <!--/. well -->
		<br>
<hr>
		<br>
        <!-- Footer -->
        <jsp:include page="/_00_fragment/footer.jsp" />

    </div>
    
    <!-- /.container -->
    
    
<!-- jQuery Version 1.11.0 -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script> --%>

<!-- Bootstrap Core JavaScript -->
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<script>

    $('.carousel').carousel({
        interval: 3500 //changes the speed
    })
  
 
</script>

</body>

</html>