<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">

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
         		 <a href="#" class="btn btn-lg btn-primary btn-block"><i class="fa fa-facebook-square"></i>  Facebook</a>
       		 	</div>
      		</div>
			  <div class="login-or">
			    <hr class="hr-or">
			    <span class="span-or">or</span>
			  </div>
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- form-->	
		      <form role="form" id="login_form" action="<%=request.getContextPath()%>/Login.gg" method="post">
		        <div class="form-group">
		          <label > E-mail:</label><font size="-1" color="#FF0000">${ErrorMsg.errorLogin}</font>
		          <input type="text" class="form-control" id="inputEmail" name="userAccount" value="eee@abc.com.tw">
		        </div>
		        <div class="form-group">
		          <a class="pull-right" href="#" data-toggle="modal" data-target="#forgetpwd" id="forget" data-dismiss="modal">忘記密碼?</a>
		          <label>密碼:</label>
		          <input type="password" class="form-control" id="inputPassword" name="userPwd" value="aaa123">
		        </div>
		        <div class="form-group">
                        <label><input type="radio" name="optionsRadios" id="member" value="Mem" checked >一般會員</label>
                        <label><input type="radio" name="optionsRadios" id="company" value="Com">商家會員</label>
                </div>
		        <div class="login-or">
			    <hr class="hr-or">
			    <span class="span-or"></span>
			 	</div>
		        <div class="form-group pull-left">
		          <label><input type="checkbox" name="rememberMe">
<%-- 		          <c:if test='${sessionScope.remeberMe==true}'>checked='checked'</c:if> --%>
<!-- 		          value="true"> -->
					自動登入 </label>
		        </div>
		        <button type="submit" class="btn btn-lg btn-primary pull-right">登入</button>
		      </form>
		      <!--/. form-->
 		    </div>
 		  </div>
 		  <div><Font color='red' size="-1">${ErrorMsg.LoginError}</Font></div>
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
$(document).ready(function() {
	$("#login_form").bootstrapValidator({
		feedbackIcons: {
	     	valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	userAccount: {
	    		trigger: 'keyup blur',
	            message: '此E-mail無效',
	            validators: {
	    			notEmpty: {
                    	message: '帳號不可空白，請填入E-mail'
                	},
                	emailAddress: {
                    	message: '此E-mail無效,請輸入正確格式'
                	},
	    		},
	    	},
	    	userPwd: {
	    		trigger: 'keyup blur',
	    		validators: {
	    			notEmpty: {
	    				message: '密碼不可空白'
	    			},
	    			stringLength: {
                    	min: 6,
                    	max: 12,
                    	message: '密碼長度限6~12字數'
            		},
            		regexp: {
                    	regexp: /^(?=.*\d)(?=.*[a-z]).{6,12}$/,
                    	message: '需包含英文及數字'
                	},
	    		},
	    	}
	    }
	});
	});
})(jQuery)
</script>