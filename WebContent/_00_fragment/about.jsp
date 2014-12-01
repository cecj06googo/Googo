<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <jsp:include page="/_00_fragment/css.jsp" /> --%>
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
                <h1 class="page-header">關於
                    <small>About</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="##">CECJ06</a>
                    </li>
                    <li class="active">第一組</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Image Header -->
        <div class="row">
            <div class="col-lg-12">
                <img class="img-responsive" src="http://placehold.it/1200x300" alt="">
            </div>
        </div>
        <!-- /.row -->
		<!-- Service Tabs -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Goo-go<small>租車平台</small></h2>
            </div>
            <div class="col-lg-12">

                <ul id="myTab" class="nav nav-tabs nav-justified">
                    <li class="active"><a href="#service-one" data-toggle="tab"><i class="fa fa-tree"></i> 緣起</a>
                    </li>
                    <li class=""><a href="#service-two" data-toggle="tab"><i class="fa fa-car"></i> 特色</a>
                    </li>
                    <li class=""><a href="#service-three" data-toggle="tab"><i class="fa fa-support"></i> 屁話</a>
                    </li>
                    <li class=""><a href="#service-four" data-toggle="tab"><i class="fa fa-database"></i> 吃吃便當</a>
                    </li>
                </ul>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="service-one">
                        <h4>屁話區</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                    </div>
                    <div class="tab-pane fade" id="service-two">
                        <h4>Service Two</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                    </div>
                    <div class="tab-pane fade" id="service-three">
                        <h4>Service Three</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                    </div>
                    <div class="tab-pane fade" id="service-four">
                        <h4>Service Four</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                    </div>
                </div>

            </div>
        </div>

       <!-- 開發人員 -->
        <div class="row" id="accessoriesRoW">
            <div class="col-lg-12">
                <h2 class="page-header">開發人員<small>developers</small></h2><h4>CECJ06_第一組</h4>
            </div>
            <!-- 開發人員1 500*400-->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                    	<h5>組長</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                    </div>
                </div>
            </div>
            <!-- 開發人員2 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                        <h5>組員</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                    </div>
                </div>
            </div>
            <!-- 開發人員3 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                        <h5>組員</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                     </div>
                </div>
            </div>
            <!-- 開發人員4 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                        <h5>組員</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                    </div>
                </div>
            </div>
            <!-- 開發人員5 -->
            <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                        <h5>組員</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                    </div>
                </div>
            </div>
            <!-- 開發人員6 -->
            <div class="col-md-3 col-sm-6">
            <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                        <h5>組員</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                    </div>
                </div>
            </div>
            <!-- 開發人員7 -->
              <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                        <h5>組員</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                    </div>
                </div>
            </div>
            <!-- 開發人員8 -->
              <div class="col-md-3 col-sm-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/05.jpg" alt="">
                    <div class="caption">
                        <h5>組員</h5>
                        <h4>李安泰</h4>
                        <li>email驗證</li>
                        <li>容易shutdown</li>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.開發人員-->
        <!-- 開發工具-->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">開發工具   <small> develop tool</small></h2>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                       <img src="${pageContext.request.contextPath}/img/java.png" class="img-rounded" style="height:56px;width:56px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Java</h4>
                        <p>Java是一種電腦程式設計語言，擁有跨平台、物件導向、泛型程式設計的特性，廣泛應用於企業級Web應用開發和行動應用開發。</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <img src="${pageContext.request.contextPath}/img/hibernate.png" class="img-rounded" style="height:56px;width:56px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Hibernate</h4>
                        <p>Java語言下的物件關聯對映解決方案。它為物件導向的領域模型到傳統的關聯型資料庫的對映，提供了一個使用方便的框架。</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <img src="${pageContext.request.contextPath}/img/git.png" class="img-rounded" style="height:56px;width:56px"> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Git</h4>
                        <p>Git為開放源碼、分散式的版本控制系統，具有分散式、效能好、本地存取、無痛分支的特性。</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                         <img src="${pageContext.request.contextPath}/img/eclipse.png" class="img-rounded" style="height:56px;width:56px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Ecilpse</h4>
                        <p>著名的跨平台開源整合式開發環境，本身為一個框架平台，搭配眾多外掛模組的支援，使得Eclipse擁有較佳的靈活性。</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <img src="${pageContext.request.contextPath}/img/aptana.png" class="img-rounded" style="height:56px;width:56px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Aptana</h4>
                        <p>是一個基於Eclipse的集成式Web開發環境，其最廣為人知的是它非常強悍的JavaScript 編輯器和調試器。</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <img src="${pageContext.request.contextPath}/img/bootstrap.png" class="img-rounded" style="height:56px;width:56px"> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Bootstrap</h4>
                        <p>是Twitter推出的強大前端框架。有12列嚮應式 網格、豐富的元件、JavaScript外掛、佈局、表單控制項、還有 基於網頁客製化工具。</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                         <img src="${pageContext.request.contextPath}/img/azure.png" class="img-rounded" style="height:56px;width:56px"> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Microsoft Windows Azure</h4>
                        <p>是開放且彈性的雲端平台，可讓您跨全球Microsoft 管理的資料中心網路，快速建置、部署及管理平台。</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <img src="${pageContext.request.contextPath}/img/SQLServer.png" class="img-rounded" style="height:56px;width:56px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">MSSQL</h4>
                        <p>Microsoft SQL Server是由美國微軟公司所推出的關聯式資料庫，在處理海量數據的效率佳，後台開發的具靈活性，可擴展性等。</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <img src="${pageContext.request.contextPath}/img/tomcat.png" class="img-rounded" style="height:56px;width:56px"> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Tomcat</h4>
                        <p>是由Apache軟體基金會下屬的Jakarta專案開發的一個Servlet容器，提供了一個Jasper編譯器用以將JSP編譯成對應的Servlet。</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.開發工具-->
        
        <!-- 發問 -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">我想問問題
                    <small>FAQ</small>
                </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-group" id="accordion">
                <!-- 發問 1-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">李安泰為什麼容易shutdown?</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                	因為bla bla bla
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <!-- 發問 2-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">你們在資策會中午都吃什麼?</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                	安泰愛訂便當，其他人會去外面吃，最喜歡訂吃吃便當，詩芸愛吃秋刀魚!
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <!-- 發問 3-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">你有趣測過你的智商?</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                                                                             這是褒還是貶?
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <!-- 發問 4-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Lorem ipsum dolor sit amet, consectetur adipiscing elit?</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <!-- 發問 5-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Curabitur eget leo at velit imperdiet varius. In eu ipsum vitae velit congue iaculis vitae at risus?</a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.panel-group -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.發問 -->
		<!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">與我們聯絡
                    <small>Contact</small>
                </h2>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- Map Column -->
            <div class="col-md-8">
                <!-- Embedded Google Map -->
                <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=25.0337622,121.5432827&amp;spn=25.0337622,121.5432827&amp;t=m&amp;z=10&amp;output=embed"></iframe>
            </div>
            <!-- Contact Details Column -->
            <div class="col-md-4">
                <h3>聯絡資訊</h3>
                <p>台北市復興南路一段390號3樓305室<br>
                </p>
                <p><i class="fa fa-phone"></i> 
                    <abbr title="Phone">電話</abbr>: (+886) 2-6631-8168</p>
                <p><i class="fa fa-envelope-o"></i> 
                    <abbr title="Email">E-mail</abbr>: <a href="mailto:googocar@gmail.com">googocar@gmail.com</a>
                </p>
                <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Hours">聯絡時間</abbr>: 星期一 ~ 星期五: 上午 9:00 至  下 午5:00 </p>
                <ul class="list-unstyled list-inline list-social-icons">
                    <li>
                        <a href="#"><i class="fa fa-facebook-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-twitter-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->
		<!-- Contact Form -->
		<jsp:include page="/_00_fragment/contact.jsp" />
        <hr>
        <!-- Footer -->
        <jsp:include page="/_00_fragment/footer.jsp" />
 	</div>
    <!-- /.container -->
    
 
</body>
</html>