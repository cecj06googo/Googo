<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
String donutString = (String)request.getAttribute("donutString");
String barString = (String)request.getAttribute("barString");
String areaString = (String)request.getAttribute("areaString");
%>
<c:set value="<%= donutString %>" var="donutString" />
<c:set value="<%= barString %>" var="barString" />
<c:set value="<%= areaString %>" var="areaString" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">

<jsp:include page="/_00_fragment/css2.jsp" />
<%-- <jsp:include page="/_07_order/order_setInterval.jsp" /> --%>
<title>Goo-go</title>
<script type="text/javascript" charset="utf-8">
       	var donutString =<%= donutString %>;
    	var barString =<%= barString %>;
    	var areaString =<%= areaString %>;
</script>

</head>
<body>
 <div id="wrapper">
	<!-- top2 -->
	<jsp:include page="/_00_fragment/top2.jsp" />

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"> 報表分析     <small>statistics</small></h1>
                    </div>
                </div>
                <!-- /.row -->
 			<!-- 重點 -->
                <div class="row">
                	<!--訂單-->
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-envelope-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id ="newOrd">${newOrd}</div>
                                        <div>新訂單喔!</div>
                                    </div>
                                </div>
                            </div>
                            <FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" name="newOrd">
                            <a href="#" onclick="document.newOrd.submit();">
                                <div class="panel-footer">
                                    <span class="pull-left">訂單管理</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                            <input type="hidden" name="action" value="newOrdCom"/>
                           </FORM>
                        </div>
                    </div><!--/.訂單-->
                    <!--取車-->
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-car fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${prodCount}</div>
                                        <div>車輛數目</div>
                                    </div>
                                </div>
                            </div>                        
                            <FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/prod.show" name="prodShow">
                            <a href="#" onclick="document.prodShow.submit();">                        
                                <div class="panel-footer">
                                    <span class="pull-left">庫存管理</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                            <input type="hidden" name="action" value="prodShow"/>
                            </FORM>
                        </div>
                    </div>
                    <!--/.取車-->
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa  fa-exclamation-triangle fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${noReCar}</div>
                                        <div>尚未還車!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="<c:url value='/scheduler'/>" >
                                <div class="panel-footer">
                                    <span class="pull-left">車輛調度</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div><!--/.取車-->
                    <!--問券-->
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"> &nbsp; </div>
                                        <div>付費功能</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">前往商城</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div> <!--/.問券-->
                </div>
               <!-- /.重點 --> 
     
				<!-- 曲線圖 --> 
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel  panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i>近一個月的銷售額</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-area-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.曲線圖  -->
 				<!-- 三大圖  -->
                <div class="row">
                <!-- Bar圖  -->
                    <div class="col-lg-4">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>近一個月商品租借次數</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>
                	<!-- 甜甜圈圖  -->
                    <div class="col-lg-4">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i>近一個月訂單狀態</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>
                    
                    <!--錢錢-->
                    <div class="col-lg-4">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>最新訂單列表</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>訂單#</th>
                                                <th>下訂日期</th>
                                                <th>下訂時間</th>
                                                <th>金額</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="DordersVO" items="${orderList}">
                                            <tr>
                                                <td># ${DordersVO.ord_id}</td>
                                                <td>${DordersVO.ord_time_day}</td>
                                                <td>${DordersVO.ord_time_time}</td>
                                                <td>$ ${DordersVO.item_total}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.三大圖row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->


</body>
<script>
// top2左方功能列選項
$("#selectManage").addClass("active");
</script>
   <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/js/plugins/morris/morris.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/morris/morris-data.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/morris/raphael.min.js"></script>
    


</html>