<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/modern-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- jQuery Version 1.11.0 -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script> --%>

<!-- Bootstrap Core JavaScript -->
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>

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
                    	<c:if test="${empty LoginMemOK && empty LoginComOK}">
                       		<a href="<c:url value='/_02_register/register.jsp'/>">註冊</a>
                       	</c:if>
                    </li>
                    <li>
                    	<c:if test="${empty LoginMemOK && empty LoginComOK}">
	                        <a href="#myModal"  data-toggle="modal" data-target="#login" >登入</a>
	                    </c:if>
                    </li>
                    <li>
                        <a href="<c:url value='/_00_fragment/about.jsp'/>">關於</a>
                    </li>
                    <li class="dropdown">
                        <a  class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-user"></i>
                        	<c:choose>
                        		<c:when test="${!empty LoginMemOK}">
                        		${LoginMemOK.mem_name}
                        		</c:when>
                        		<c:otherwise>
                        		會員專區
                        		</c:otherwise>
                        	</c:choose>
                        <b class="caret"> </b></a>
                        <ul class="dropdown-menu">
                        	<li>
	                            <a href="<c:url value='/_04_member/favorite.jsp'/>"><i class="fa fa-fw fa-heart"> </i>我的收藏</a>
	                        </li>
                            <li>
	                            <a href="<c:url value='/Temp/fakeLogin_Mem.jsp'/>"><i class="fa fa-fw fa-book"> </i>我的訂單</a>
	                        </li>
	                        <li>
	                            <a href="<c:url value='/_04_member/modMem.jsp'/>"><i class="fa fa-fw  fa-pencil"> </i>修改會員資料</a>
	                        </li>
	                        <li class="divider"> </li>
	                        <li>
	                        	<c:if test="${not empty LoginMemOK}">
	                            	<a href="${pageContext.request.contextPath}/_01_login/logout.jsp"><i class="fa fa-fw fa-power-off"> </i>登出</a>
	                            </c:if>
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
		<!-- 重設密碼 -->
		<jsp:include page="/_01_login/resetPwd.jsp"/>
	
<script>
(function($) {
	var errorMsg = '<%= session.getAttribute("LoginError") %>';
	var timeOut = '<%= session.getAttribute("timeOut") %>';
	var mustMemLogin = '<%= session.getAttribute("mustMemLogin") %>';
	var mustComLogin = '<%= session.getAttribute("mustComLogin") %>';
	
//  	alert("errorMsg = " + errorMsg + ", timeOut = " + timeOut 
//  			+ ", mustMemLogin = " + mustMemLogin + ", mustComLogin = " + mustComLogin);
	
	// 登入的彈出視窗判斷
	if (mustMemLogin != "null") {
//  		alert(mustMemLogin);
		$('#login').modal('show');
		<% session.removeAttribute("mustMemLogin"); %>
	} 
	else if (mustComLogin != "null") {
//  		alert(mustComLogin);
		$('#login').modal('show');
	    <% session.removeAttribute("mustComLogin"); %>
	}
	else if (timeOut != 'null') {
		$('#login').modal('show');
	} 
	else if (errorMsg != 'null') {
		$('#login').modal('show');
		<% session.removeAttribute("LoginError"); %>
		<% session.removeAttribute("errorAccount"); %>
		<% session.removeAttribute("errorPassword"); %>
	}
	else {
//  		alert("不用彈出登入");
	}
	
	var errMsgs = '<%= session.getAttribute("checkAccountError") %>';
	if(errMsgs != 'null'){
		alert("請重填");
		$('#forgetpwd').modal('show');
		<% session.removeAttribute("checkAccountError"); %>
		<% session.removeAttribute("noExistAccount"); %>
	}

    
})(jQuery)


</script>
	