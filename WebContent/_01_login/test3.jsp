<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

	<form name="resetpwd_form" id="resetpwd_form" <%=request.getContextPath()%>/resetpwd.gg" method="post" >
             <div class="control-group form-group ">
                <label class="control-label">帳號:</label>
                <div class="controls" >
                    <input type="text" class="form-control " id="user_account" name="user_account" placeholder="請輸入e-mail" >
                </div>
                <font color="red" size="-1">${errMsgs.errAccount}${checkAccountError}</font>
            </div>
            <div class="control-group form-group">
                <label class="control-label"><input type="radio" name="optionsRadios" id="member" value="Mem" >一般會員</label>
                <label class="control-label"><input type="radio" name="optionsRadios" id="company" value="Com">商家會員</label>
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
          	  <button type="reset" class="btn btn-primary" >取消 </button>
              <button type="submit" class="btn btn-danger" form="resetpwd_form">送出 </button>

           	
          </form>
       
<!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>


<script>
 (function($){
	   $(document).ready(function() {
		   
		  
		    $('#resetpwd_form').bootstrapValidator({
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
		                    remote: {
                                url: 'memAccountCheck.jsp',
                                type: "post",
                                async: false,
                                message: '帳號重複，請重新輸入',
                            },
		                    
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

		        }}
		    ).on('success.form.bv', function() {
	            $('#register_success').modal('show');
	        });

		});
   
	 })(jQuery)
</script>