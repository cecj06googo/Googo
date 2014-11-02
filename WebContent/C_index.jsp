<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--
店家圖750*450
商品圖1000*700
配件圖500*400
景點600*500
site 750*500
	-->

    <meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Goo-go</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="C_manage.jsp" id="logo">
                    <i class="fa fa-car"></i><span class="light"> 租車網</span> Goo-go
                </a>

            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="register.html">註冊</a>
                    </li>
                    <li>
                        <a href="#">登入</a>
                    </li>
                    <li>
                        <a href="about.html">關於</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>會員專區<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                        	<li>
	                            <a href="#"><i class="fa fa-fw fa-heart"> </i>收藏清單</a>
	                        </li>
                            <li>
	                            <a href="#"><i class="fa fa-fw fa-book"> </i>訂單查詢</a>
	                        </li>
	                        <li>
	                            <a href="#"><i class="fa fa-fw  fa-pencil"> </i>修改會員資料</a>
	                        </li>
	                        <li class="divider"> </li>
	                        <li>
	                            <a href="#"><i class="fa fa-fw fa-power-off"> </i>登出</a>
	                        </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

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
                <div class="fill" style="background-image:url('img/01.jpg');"></div>
                <div class="carousel-caption">
                    <h1>One more for good measure.</h1>
              		<p>123</p>
          		    <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/02.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/03.jpg');"></div>
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

     <!--Search bar-->
        <br>
        <div class="well" >
        <div class="row" >
        <div class="col-lg-12 text-center">
                	<form class="form-inline" role="form" action="search.html" method="get">
                      <div class="form-group">
                            <select class="form-control input-lg" >
                                <option>地區</option>
                                <option>台北</option>
                                <option>桃園</option>
                                <option>宜蘭</option>
                                <option>高雄</option>
                                <option>墾丁</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control input-lg" >
                                <option>地區</option>
                                <option>汽車</option>
                                <option>機車</option>
                                <option>腳踏車</option>
                                <option>4</option>   
                            </select>
                        </div>
            
                        <div class="form-group input-group">
                                <input type="text" class="form-control input-lg" placeholder="請輸入關鍵字">
                                <span class="input-group-btn"><button class="btn btn-default btn-lg" type="submit"><i class="fa fa-search"></i></button></span>
                         </div>

                    </form> 
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
            <div class="col-md-4 col-sm-6">
                <a href="<%=request.getContextPath()%>/site.html" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>宜蘭衝浪</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="<%=request.getContextPath()%>/img/07.jpg" alt="">
                </a>
            </div>
        	<!-- 圖二 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="site.html" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>熱氣球</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="<%=request.getContextPath()%>/img/08.jpg" alt="">
                </a>
            </div>
        	<!-- 圖三 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="site.html" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>高雄愛河</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="<%=request.getContextPath()%>/img/09.jpg" alt="">
                </a>
            </div>
       		<!-- 圖四 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="site.html" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>台北101</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="<%=request.getContextPath()%>/img/10.jpg" alt="">
                </a>
            </div>
            <!-- 圖五 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="site.html" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>海洋公園</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="<%=request.getContextPath()%>/img/11.jpg" alt="">
                </a>
            </div>
            <!-- 圖六 1200*1000 -->
            <div class="col-md-4 col-sm-6">
                <a href="site.html" class="portfolio-link">
                	<div class="caption">
                            <div class="caption-content">
                               <h1>天空之城</h1>
                            </div>
                    </div> 
                    <img class="img-responsive img-portfolio img-hover" src="<%=request.getContextPath()%>/img/12.jpg" alt="">
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
                <img class="img-responsive" src="http://placehold.it/700x450" alt="">
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
        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-default btn-block" href="<%=request.getContextPath()%>/C_registerCom.jsp">註冊商家</a>
                </div>
            </div>
        </div>

        <hr>


		<h4>UpdateCompany</h4>
		<form method="POST" id="updateCom" action="DisplayProfile">
			<input type="text" name="comID" id="comID" /> <input type="submit"
				id="enter" value="確認"> <input type="hidden" name="action"
				value="getOne_For_Display">
		</form>
		<div>
			<font color="red" size="-1">${errorMsgs.errorComIDEmpty}${errorMsgs.errorComIDFormat}${errorMsgs.errorComIDDup}</font>
		</div>



		<hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.0 -->
    <script src="<%=request.getContextPath()%>/js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

    
    

</body>
</html>