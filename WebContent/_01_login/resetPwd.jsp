<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

<!-- 重設密碼 -->
        <div class="modal fade"  id="resetpwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		  	<div class="modal-content ">
		  	<!-- header-->
		  	<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		 <h3 class="modal-title" id="myModalLabel">Goo-go 重設密碼 <small>reset password</small></h3>
      		</div><!-- /.header-->
      		<!-- body-->
      		<div class="modal-body">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- form-->
		      <form role="form" id="reset_form" action="<%=request.getContextPath()%>/member.do" method="post">
		        <div class="form-group">
		          <label > E-mail:</label>
		          <input type="text" class="form-control" id="resetPwdMail" name="resetPwdMail">
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
                 <font color="red" size="-1">${errorMsgs.errorPwd}</font>
            </div>
            <div class="control-group form-group">
                <label  class="control-label">密碼確認:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="newpwdcheck" placeholder="請再次輸入密碼" >
                </div>
            </div>
                <input type="hidden" name="action" value="resetpwd">
		        <button type="submit" class="btn btn-lg btn-primary pull-right">確認修改</button>
		      </form><!-- /.form-->
 			</div>
 		    </div>
 		</div><!-- /.body-->
 		</div>
		</div>
		</div>
		<!-- /.忘記密碼-->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<script>
 (function($){
	  
	  
	   $(document).ready(function() {
		    $('#test').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
	        	
		        fields: {
		        	resetpwdinputEmail: {
		        		trigger: 'keyup blur',
		                message: '此E-mail無效',
		                validators: {
		                    notEmpty: {
		                        message: '帳號不可空白，請填入E-mail'
		                    },
		                    emailAddress: {
		                        message: '此E-mail無效,請輸入正確格式'
		                    },
		                    /*remote: {
                                url: 'memAccountCheck.jsp',
                                type: "post",
                                async: false,
                                message: '帳號重複，請重新輸入',
                            },*/
		                    
		                }
		            },
		            mem_pwd0: {
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
		                        field: 'mem_pwd',
		                        message: '與確認密碼不相同'
		                    },
		                    
		                }
		            },
		            mem_pwd: {
		            	trigger: 'keyup blur',
		                validators: {
		                	notEmpty: {
		                        message: '密碼確認不可空白'
		                    },
		                    identical: {
		                        field: 'mem_pwd0',
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
	            $('#test').modal('show');
	        });

		});
   
	 })(jQuery)
</script>