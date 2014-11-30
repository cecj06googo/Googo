<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

	<form name="resetpwd_form" id="resetpwd_form" action="<%=request.getContextPath()%>/link" method="post" >
             
            <div class="control-group form-group ">
                    <label>帳號:</label>
                    <div class="controls input-group">
                        <input type="text" class="form-control" id="mem_account" name="mem_account" value="${memVO.mem_account}" disabled>
                   		<span class="input-group-addon"><i class="fa fa-ban"></i></span>
                    </div>
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
                <font color="red" size="-1">${errMsgs.errorPwdCheck}</font>
            </div>
              <input type="hidden" name="mem_qq" value="${memVO.mem_qq}">
          	  <button type="reset" class="btn btn-danger" >取消 </button>
              <button type="submit" class="btn btn-success" form="resetpwd_form">送出 </button>

           	
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
	            $('#resetpwd_success').modal('show');
	        });

		});
   
	 })(jQuery)
</script>
