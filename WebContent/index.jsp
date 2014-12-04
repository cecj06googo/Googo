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
                    <h2>一家人歡樂旅行</h2>
                    <p>老爸~老爸~我們去哪裡呀~</p>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/img/2.jpg');"></div>
                <div class="carousel-caption">
                    <h2>騎車奔馳在山間</h2>
                    <p>催樓去~~~~~~</p>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/img/4.JPG');"></div>
                <div class="carousel-caption">
                    <h2>綠色隧道騎腳踏車</h2>
                    <p>繞來繞去騎　阮的腳踏車</p>
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
        	<!-- 圖一 1200*1000 -->
            <div class="col-md-4 col-sm-6 ">
                <a href="<c:url value='/PlaceRecommend.do'/>" class="portfolio-link" >
                	<div class="caption">
                            <div class="caption-content">
                               <h1>宜蘭童玩節</h1>
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
                <h2 class="page-header">Goo-go簡介</h2>
            </div>
            <div class="col-md-6">
                <p><h4>Goo-go提供給您的便捷服務:</h4></p><br>
                <ul>
                    <li><h4><strong>簡約大方的使用介面，讓您能快速上手。</strong></h4>
                    </li>
                    <li><h4><strong>根據地區及車種，快速找到符合您需求的交通工具。</strong></h4>
                    </li>
                    <li><h4><strong>景點推薦，讓您不需煩惱假日去處，並幫您搜尋附近的商店。</strong></h4>
                    </li>
                    <li><h4><strong>利用Google地圖，幫您快速找到離您最近的商家。</strong></h4>
                    </li>
                    <li><h4><strong>貼心的價格搜尋與多視角商品圖片，讓您找到最適合的車輛。</strong></h4>
                    </li>
                    <li><h4><strong>簡便的租車流程，省略繁複的租車步驟，節省您的時間與心力。</strong></h4>
                    </li>
                </ul><br>
                <p>Goo-go的中心主旨是為了帶給使用者透明化的價格，讓租車市場更符合供需原則以達價格公平與公正。在此平台的商家，經過條件的篩選，提升平台商家的素質，讓使用者能更安心租車。</p>
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
                <h1 class="page-header">智慧而親切的管理後台</h1>
            </div>
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>簡易操作的商品管理</h4>
                    </div>
                    <div class="panel-body">
                        <p style="font-size:16px">簡單的管理介面，讓身為商家會員的您可以輕易上手，結合商品圖片讓您對每項商品瞭如指掌。設計器技術能讓您客製化訂單，製作最適合您產品的訂單畫面，搭配簡潔的流程設計，為您打造最有效率的商品管理操作。</p>
<!--                         <a href="#" class="btn btn-default">Learn More</a> -->
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i>智慧化的訂單管理</h4>
                    </div>
                    <div class="panel-body">
                        <p style="font-size:16px">自動幫你歸類各種訂單狀態，無論是未處理的訂單或逾時未還的商品以及不同時間的訂單，透過簡易的過濾搜尋，清楚明瞭呈現你所需的資訊，圖像化的車輛調度，讓您了解車輛的出借情形，用簡易拖拉的方式，即可調度車輛。</p>
<!--                         <a href="#" class="btn btn-default">Learn More</a> -->
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i>數據化的報表分析</h4>
                    </div>
                    <div class="panel-body">
                        <p style="font-size:16px">資料即是金礦，我們提供數據化的報表分析，讓您得知哪幾樣商品是您當紅炸子雞，並且圖形化的呈現讓您對數據一目了然，讓您知道在不同時間與各車種的業績，幫助您決策判斷，有足夠的資訊才能做出最佳的決定。</p>
<!--                         <a href="#" class="btn btn-default">Learn More</a> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <!-- well -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p style="font-size:16px">心動不如馬上行動!加入後有一個月的免費試用，試用期後每筆交易只抽取2%的費用，適應性的收費方式，能減輕商家在淡季的負擔。</p>
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