<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/css/loginStyle.css" rel="stylesheet"> --%>

<style>
.right-inner-addon {
    position: relative;
}
.right-inner-addon input {
    padding-right: 30px;    
}
.right-inner-addon i {
	color:#a94442;
    position: absolute;
    right: 0px;
    padding: 10px 12px;
    pointer-events: none;
}
</style>

	<div class="modal fade"  id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		  	<div class="modal-content ">
		  	<!-- header-->
		  	<div class="modal-header">
		  	 
       			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		 <h3 class="modal-title" id="myModalLabel">Goo-go登入 <small>login</small></h3>
      		
      		</div><!--/. header-->
      		<!-- body-->
      		<div class="modal-body">
     		<div class="row">
     		<div class="col-md-10 col-md-offset-1">
			    <img class="img-responsive" src="${pageContext.request.contextPath}/img/bar.jpg" alt="">
			  </div></div>
			 
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- form-->	
		      <form role="form" id="login_form" action="<%=request.getContextPath()%>/Login.gg" method="post">
		        <div id="inputEmailDiv" class="form-group">
		          <label > E-mail:</label><font size="-1" color="#FF0000">${ErrorMsg.errorLogin}</font>
		          <c:choose>
		           	<c:when test="${not empty errorAccount}">
		           		<div class="right-inner-addon">
		           			<input type="text" class="form-control" id="inputEmail" name="userAccount" value="${errorAccount}">
		           			<i class="glyphicon glyphicon-remove"></i>
		           		</div>
		           	</c:when>
		           	<c:otherwise>
		           		<input type="text" class="form-control" id="inputEmail" name="userAccount" value="${sessionScope.user}">
		           	</c:otherwise>
		           </c:choose>
		        </div>
		        <div id="inputPasswordDiv" class="form-group">
		          <a class="pull-right" href="#" data-toggle="modal" data-target="#forgetpwd" id="forget" data-dismiss="modal">忘記密碼?</a>
		          <label>密碼:</label>
		           <c:choose>
		           	<c:when test="${not empty errorPassword}">
		           		<div class="right-inner-addon">
		           			<input type="password" class="form-control" id="inputPassword" name="userPwd" value="${errorPassword}">
		           			<i class="glyphicon glyphicon-remove"></i>
		           		</div>
		           	</c:when>
		           	<c:otherwise>
		           		<input type="password" class="form-control" id="inputPassword" name="userPwd" value="${sessionScope.password}">
		           	</c:otherwise>
		           </c:choose>
		        </div>
		        <div class="form-group">
                        <label><input type="radio" name="optionsRadios" id="member" value="Mem" checked >一般會員</label>
                        <label><input type="radio" name="optionsRadios" id="company" value="Com">商家會員</label>
                </div>
		        <div class="login-or">
		        <div id="errorMessage"><Font style="color:red; font-size:16px">${LoginError} ${timeOut}</Font></div>
			    <hr class="hr-or">
			    <span class="span-or"></span>
			 	</div>
		        <div class="form-group pull-left">
		          <label><input type="checkbox" name="rememberMe"
		          <c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if>
		          value="true">
					記住密碼 </label>
		        </div>
		        <button type="submit" class="btn btn-lg btn-primary pull-right">登入</button>
		      </form>
		      <!--/. form-->
 		    </div>
 		  </div>
 		   <!--尚未註冊-->
 		  <div class="row" style="margin-top: 20px;">
 		  <div class="well col-md-10 col-md-offset-1">
            <div class="row ">
                <div class="col-md-8">
                    <h4>還沒註冊嗎?</h4>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-default btn-block" href="<c:url value='/_02_register/register.jsp'/>">註冊會員</a>
                </div>
            </div>
          </div> 
 		  </div><!--/.尚未註冊-->
		  
		  <div class="row"><div class="col-md-10 col-md-offset-1">
		    <img class="img-responsive" src="${pageContext.request.contextPath}/img/bar2.jpg" alt="">
		  </div></div>
 		</div><!-- body-->
 		</div>
		</div>
		</div>
		<!-- /.登入-->
		
<!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
		


<script>
(function($){
	var radios = '<%=session.getAttribute("userIdentity")%>';
	if (radios != null) {
		$('input:radio[name=optionsRadios]').filter('[value="' + radios +'"]').prop('checked',true);
	}
	
	var loginerror = '<%=session.getAttribute("LoginError")%>';
	if (loginerror != 'null') {
		$('#inputEmailDiv').addClass('has-error');
		$('#inputPasswordDiv').addClass('has-error');
	}
	else {
		$('#inputEmailDiv').removeClass('has-error');
		$('#inputPasswordDiv').removeClass('has-error');
	}
	
})(jQuery)
</script>