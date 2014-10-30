<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

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
                <a class="navbar-brand page-scroll" href="<c:url value='/index.jsp'/>" id="logo">
                    <i class="fa fa-car"></i><span class="light"> 租車網</span> Goo-go
                </a>

            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="<c:url value='/_02_register/register.jsp'/>">註冊</a>
                    </li>
                    <li>
                        <a href="#myModal" data-toggle="modal" data-target="#login" >登入</a>
                    </li>
                    <li>
                        <a href="<c:url value='/_00_fragment/about.jsp'/>">關於</a>
                    </li>
                    <li class="dropdown">
                        <a  class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>會員專區<b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                        	<li>
	                            <a href="<c:url value='/_04_member/favorite.jsp'/>"><i class="fa fa-fw fa-heart"> </i>我的收藏</a>
	                        </li>
                            <li>
	                            <a href="<c:url value='/_04_member/orderMem.jsp'/>"><i class="fa fa-fw fa-book"> </i>我的訂單</a>
	                        </li>
	                        <li>
	                            <a href="<c:url value='/_04_member/modMem.jsp'/>"><i class="fa fa-fw  fa-pencil"> </i>修改會員資料</a>
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

    	<!-- 登入 -->
		<jsp:include page="/_01_login/login.jsp" />
		<!-- 忘記密碼 -->
		<jsp:include page="/_01_login/forgetPwd.jsp" />
	
	