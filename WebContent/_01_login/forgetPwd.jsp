<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script> --%>

    
<!-- 忘記密碼-->
		<div class="modal fade"  id="forgetpwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		  	<div class="modal-content ">
		  	<!-- header-->
		  	<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		 <h3 class="modal-title" id="myModalLabel">Goo-go 忘記密碼 <small>forget password</small></h3>
      		</div><!-- /.header-->
      		<!-- body-->
      		<div class="modal-body">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- form-->
		      <form role="form" id="forget_form" action="<%=request.getContextPath() %>/forgetpwd.gg" method="post" >
		        <div class="form-group">
		          <label > E-mail:</label>
		          <input type="text" class="form-control" id="inputEmail" name="inputEmail" placeholder="請輸入E-mail">
		          <font color="red" size="-1">${errMsgs.errAccount}</font>
		        </div>
		        <div class="form-group">
                        <label><input type="radio" name="optionsRadios" id="member" value="Mem">一般會員</label>
                        <label><input type="radio" name="optionsRadios" id="company" value="Com">商家會員</label>
                </div>
                <div id="errorMessage"><font color="red" size="-1">${checkAccountError}</font></div>
		        <button type="submit" class="btn btn-lg btn-primary pull-right" form="forget_form">重新設定</button>
		      </form><!-- /.form-->
 			</div>
 		    </div>
 		</div><!-- /.body-->
 		</div>
		</div>
		</div>
		<!-- /.忘記密碼-->
<!-- jQuery Version 1.11.0 -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script> --%>

<!-- Bootstrap Core JavaScript -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script> --%>
<script>
 (function($){
	  
		
	  
	  
	   $(document).ready(function() {
		    $('#forget_form').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
	        	
		        fields: {
		        	inputEmail: {
		        		trigger: 'keyup blur',
		                message: '此E-mail無效',
		                validators: {
		                    notEmpty: {
		                        message: '帳號不可空白，請填入E-mail'
		                    },
		                    emailAddress: {
		                        message: '此E-mail無效,請輸入正確格式'
		                    },
		                   /* remote: {
                                url: 'userAccountCheck.jsp',
                                type: "post",
                                async: false,
                                message: '帳號重複，請重新輸入',
                            },*/
		                    
		                }
		            },
		            
		            optionsRadios: {
		                validators: {
		                	trigger: '',
		                    notEmpty: {
		                        message: '請選擇'
		                    }
		                }
		            },
		           
		        }}
		    ).on('success.form.bv', function() {
	            $('#sendMailSuccess').modal('show');
	        });

		});
	   
	   
		
	
   
	 })(jQuery)
</script>