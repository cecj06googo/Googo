<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- js -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>

<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="<c:url value='/manage'/>" id="logo">
                    <i class="fa fa-car"></i><span class="light"> 租車網</span> Goo-go
                </a>
            </div>
            <!-- 提醒 -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                    <!-- 提醒1 -->
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <span class="label label-default">取消訂單</span>
                                        <p class="medium text-muted"><i class="fa fa-clock-o"></i>
                                        	Yesterday at 4:32 PM<br>會員:李安泰<br>訂單編號:11111</p>
                                   </div>
                                </div>
                            </a>
                        </li> 
                     <!-- 提醒2 -->
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <span class="label label-primary">收到訂單</span>
                                        <p class="medium text-muted"><i class="fa fa-clock-o"></i>
                                        	Yesterday at 5:32 PM<br>會員:李安泰<br>訂單編號:22222</p>
                                   </div>
                                </div>
                            </a>
                        </li>
                    <!-- 提醒3-->
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <span class="label label-danger">尚未還車</span> 
                                        <p class="medium text-muted"><i class="fa fa-clock-o"></i>
                                        	Yesterday at 4:32 PM<br>會員:李安泰<br>訂單編號:33333</p>
                                   </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">查看訂單</a>
                        </li>
                    </ul>
                </li>
             <!-- /.提醒 -->
             <!-- 商家專區 -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-briefcase"></i> 
                    	<c:choose>
                        	<c:when test="${!empty LoginComOK}">
                        		${LoginComOK.comName}
                        	</c:when>
                        	<c:otherwise>
                        		商家專區
                        	</c:otherwise>
                        	</c:choose> 
                    <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<c:url value='/_06_manage/modCom.jsp'/>"><i class="fa fa-fw fa-pencil"></i> 修改商家資訊</a>
                        </li>
                         <li>
                            <a href="<c:url value='/_06_manage/help.jsp'/>"><i class="fa fa-fw fa-info"></i> 幫助</a>
                        </li>
                     
                        <li class="divider"></li>
                        <li>
                            <c:if test="${not empty LoginComOK}">
	                        	<a href="${pageContext.request.contextPath}/_01_login/logout.jsp"><i class="fa fa-fw fa-power-off"> </i>登出</a>
	                        </c:if>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li id="selectManage">
                        <a href="<c:url value='/manage'/>"><i class="fa fa-fw fa-bar-chart-o"></i> 報表分析</a>
                    </li>
                    <li id="selectOrder">
                        <a href="<c:url value='/_05_company/orderCom.jsp'/>"><i class="fa fa-fw fa-book"></i> 訂單管理</a>
                    </li>
                    <li id="scheduler">
                        <a href="<c:url value='/scheduler'/>"><i class="fa fa-calendar"></i> 車輛調度</a>
                    </li>
                    <li id="Survey">
                        <a href="#"><i class="fa fa-fw fa-file-text-o"></i> 新功能</a>
                    </li>
                    <li id="selectStock">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-th-list"></i> 庫存管理 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="<c:url value='/_06_manage/productInsert.jsp'/>">新品上架</a>
                            </li>
                            <li>
                                <a href="<c:url value='/prod.show'/>">商品管理</a>
                            </li>
                            <li>
                                <a href="<c:url value='/_06_manage/AccInsert.jsp'/>">配件上架</a>
                            </li>
                            <li>
                                <a href="<c:url value='/acc.show'/>">配件管理</a>
                            </li>
                        </ul>
                    </li>
                    <li id="selectDesignOrder">
                        <a href="<c:url value='/Temp/ApplySample_hooked.jsp' />"><i class="fa fa-fw fa-clipboard"></i> 設計訂單</a>
                    </li>
                    <li id="selectModCom" >
                        <a href="<c:url value='/_06_manage/modCom.jsp'/>"><i class="fa fa-fw fa-pencil"></i> 修改商家資訊</a>
                    </li>
                    <li id="selectDesignStock">
                        <a href="#"><i class="fa fa-fw fa-shopping-cart"></i> Goo-go商城</a>
                    </li > 
                     <li id="selectHelp">
                        <a href="<c:url value='/_06_manage/help.jsp'/>"><i class="fa fa-fw fa-info"></i> 幫助</a>
                    </li>
                    <li>
                    	<c:if test="${not empty LoginComOK}">
	                    	<a href="${pageContext.request.contextPath}/_01_login/logout.jsp"><i class="fa fa-fw fa-power-off"> </i>登出</a>
	                    </c:if>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
<!-- js -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>

