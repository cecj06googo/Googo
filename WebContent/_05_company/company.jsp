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

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">拉拉  <small>租車小舖</small></h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Intro Content -->
        <div class="row">
        	<!-- 店家圖片 -->
            <div class="col-md-6">
                <img class="img-responsive" src="${pageContext.request.contextPath}/img/13.jpg" alt="">
            </div>
            <!-- /店家圖片 -->
            <div class="col-md-6">
               <div class="col-lg-12">
				<!-- 標籤 -->
                <ul id="myTab" class="nav nav-tabs nav-justified">
                    <li class="active"><a href="#service-one" data-toggle="tab"><i class="fa fa-tag"></i> 店家位置</a>
                    </li>
                    <li class=""><a href="#service-two" data-toggle="tab"><i class="fa  fa-phone"></i> 店家資訊</a>
                    </li>
                    <li class=""><a href="#service-three" data-toggle="tab"><i class="fa fa-book"></i> 優惠方案</a>
                    </li>
                    
                </ul>
				<!-- /標籤 -->
				<!-- 標籤內容 -->
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="service-one">
                        	<img src="${pageContext.request.contextPath}/img/06_1.jpg">
                    </div>
                    <div class="tab-pane fade" id="service-two">
                        <<ul>
                        	<li><h3>地址:台北市復興南路一段390號</h3></li>
                        	<li><h3>Service One</h3></li>
                        	<li><h3>Service One</h3></li>
                        	<li><h3>Service One</h3></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade" id="service-three">
                    	<h4>Service</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                        <a href="#accessoriesRoW">配件配件配件</a>
                    </div>
                </div>
				<!-- /標籤內容 -->
            </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Team Members -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">車車</h2>
            </div>
            <!-- 車車1 -->
            <div class="col-md-4 text-center">
                <div class="thumbnail"><a href="" data-toggle="modal" data-target="#prod_detail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/19.jpg" alt="">
                    <div class="caption">
                        <h3>Nissan LIVINA</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                    </div></a>
                </div>
            </div>
            <!-- 車車2 -->
            <div class="col-md-4 text-center">
                <div class="thumbnail"><a href="" data-toggle="modal" data-target="#prod_detail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/20.jpg" alt="">
                    <div class="caption">
                        <h3>tobe m'car</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                    </div></a>
                </div>
            </div>
            <!-- 車車3 -->
            <div class="col-md-4 text-center">
                <div class="thumbnail"><a href="" data-toggle="modal" data-target="#prod_detail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/24.jpg" alt="">
                    <div class="caption">
                        <h3>Panda car</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                    </div></a>
                </div>
            </div>
            <!-- 車車4 -->
            <div class="col-md-4 text-center">
                <div class="thumbnail"><a href="" data-toggle="modal" data-target="#prod_detail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/22.jpg" alt="">
                    <div class="caption">
                        <h3>箱型休旅車</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                    </div></a>
                </div>
            </div>
            <!-- 車車5 -->
            <div class="col-md-4 text-center">
                <div class="thumbnail"><a href="" data-toggle="modal" data-target="#prod_detail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/21.jpg" alt="">
                    <div class="caption">
                        <h3>重型機車</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                    </div></a>
                </div>
            </div>
            <!-- 車車6 -->
            <div class="col-md-4 text-center">
                <div class="thumbnail"><a href="" data-toggle="modal" data-target="#prod_detail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/23.jpg" alt="">
                    <div class="caption">
                        <h3>三陽機車</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                    </div></a>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- 配件 -->
        <div class="row" id="accessoriesRoW">
            <div class="col-lg-12">
                <h2 class="page-header">配件</h2>
            </div>
            <!-- 配件1 500*400-->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/25.jpg" alt="">
                    <div class="caption">
                        <h4>安全帽</h4>
                    </div>
                </div>
            </div>
            <!-- 配件2 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/32.jpg" alt="">
                    <div class="caption">
                        <h4>兒童安全座椅</h4>
                    </div>
                </div>
            </div>
            <!-- 配件3 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/26.jpg" alt="">
                    <div class="caption">
                        <h4>衝浪板</h4>
                     </div>
                </div>
            </div>
            <!-- 配件4 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/27.jpg" alt="">
                    <div class="caption">
                        <h4>野餐用具</h4>
                    </div>
                </div>
            </div>
            <!-- 配件5 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/28.jpg" alt="">
                    <div class="caption">
                        <h4>帳篷</h4>
                    </div>
                </div>
            </div>
            <!-- 配件6 -->
            <div class="col-md-3 col-sm-6">
            <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/29.jpg" alt="">
                    <div class="caption">
                        <h4>游泳圈</h4>
                    </div>
                </div>
            </div>
            <!-- 配件7 -->
              <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/30.jpg" alt="">
                    <div class="caption">
                        <h4>滑板</h4>
                    </div>
                </div>
            </div>
            <!-- 配件8 -->
              <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/31.jpg" alt="">
                    <div class="caption">
                        <h4>遊樂園門票</h4>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.配件 -->
        <!-- 商品明細 -->
		<jsp:include page="/_05_company/prod_detail.jsp" />
        <hr>
	   <!-- Footer -->
        <jsp:include page="/_00_fragment/footer.jsp" />

    </div>
    <!-- /.container -->
    
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>