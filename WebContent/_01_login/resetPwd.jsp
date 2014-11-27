<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

    
<!-- 重設密碼-->
		<div class="modal fade"  id="forgetpwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		  	<div class="modal-content ">
		  	<!-- header-->
		  	<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		 <h3 class="modal-title" id="myModalLabel">Goo-go 重設密碼 <small>Reset password</small></h3>
      		</div><!-- /.header-->
      		<!-- body-->
      		<div class="modal-body">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- form-->
		      <form role="form" name="resetpwd" id="resetpwd" action="<%=request.getContextPath()%>/resetpwd.gg" method="post" >
		        <div class="form-group">
		          <label > E-mail:</label>
		          <input type="text" class="form-control" id="user_account" name="user_account" placeholder="請輸入e-mail">
		          <font color="red" size="-1">${errMsgs.errAccount}${checkAccountError}</font>
		        </div>
		        <div class="form-group">
                        <label><input type="radio" name="optionsRadios" id="member" value="Mem">一般會員</label>
                        <label><input type="radio" name="optionsRadios" id="company" value="Com">商家會員</label>
                </div>
                <div class="control-group form-group">
                <label  class="control-label">密碼:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="newpwd" placeholder="請輸入6~12，包含英文與數字" >
                </div>
                 <font color="red" size="-1">${errMsgs.errorPwd}</font>
            </div>
            <div class="control-group form-group">
                <label  class="control-label">密碼確認:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="newpwdcheck" placeholder="請再次輸入密碼" >
                </div>
            </div>
                
		        <br>
          	  <button type="reset" class="btn btn-primary" >取消 </button>
              <button type="submit" class="btn btn-danger" form="register_member">送出 </button>
		      </form><!-- /.form-->
 			</div>
 		    </div>
 		</div><!-- /.body-->
 		</div>
		</div>
		</div>
		<!-- /.忘記密碼-->

<!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>


<script>
 (function($){
	  
	   $(document).ready(function() {
		  $('#resetpwd').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
	        	
		        fields: {
		        	user_account: {
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
		            newpwd: {
		            	trigger:'keyup blur',
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
		                    identical: {
		                        field: 'newpwdcheck',
		                        message: '與確認密碼不相同'
		                    },
		                    
		                }
		            },
		            newpwdcheck: {
		            	trigger: 'keyup blur',
		                validators: {
		                	notEmpty: {
		                        message: '密碼確認不可空白'
		                    },
		                    identical: {
		                        field: 'newpwd',
		                        message: '與密碼不相同'
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 12,
		                        message: '密碼長度限6~12字數'
		                    },
		                    regexp: {
		                        regexp: /^(?=.*\d)(?=.*[a-z]).{6,12}$/,
		                        message: '需包含英文及數字'
		                    }
		                }
		            },
		            optionsRadios: {
		                validators: {
		                	trigger: '',
		                    notEmpty: {
		                        message: '請選擇會員身分'
		                    }
		                }
		            },
		            
		            
		       
		          
		        }}
		    ).on('success.form.bv', function() {
	            $('#resetPwdSuccess').modal('show');
	        });

		});
   
	 })(jQuery)
</script>