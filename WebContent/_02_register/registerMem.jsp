<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

	<form name="register_member" id="register_member" action="<%=request.getContextPath()%>/member.do" method="post" >
             <div class="control-group form-group ">
                <label class="control-label">帳號:</label>
                <div class="controls" >
                    <input type="text" class="form-control " id="mem_account" name="mem_account" value="${memVO.mem_account}" placeholder="請輸入e-mail" >
                </div>
                <font color="red" size="-1">${errorMsgs.errorAccount}</font>
            </div>
            <div class="control-group form-group">
                <label  class="control-label">密碼:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="mem_pwd0" value="${memVO.mem_pwd}" placeholder="請輸入6~12，包含英文與數字" >
                </div>
                 <font color="red" size="-1">${errorMsgs.errorPwd}</font>
            </div>
            <div class="control-group form-group">
                <label  class="control-label">密碼確認:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="mem_pwd" value="${memVO.mem_pwd}" placeholder="請再次輸入密碼" >
                </div>
            </div>
            <div class="control-group form-group">
                <label>姓名:</label>
                <div class="controls ">
                    <input type="text" class="form-control" name="mem_name" value="${memVO.mem_name}" required >
                </div>
                <font color="red" size="-1">${errorMsgs.errorName}</font>
            </div>
            <div class="control-group form-group">
            	<input type="hidden"  id="mem_gender1" value="${memVO.mem_gender}">
                <label class="control-label"><input type="radio" name="mem_gender" id="mem_gender" value="1" >先生</label>
                <label class="control-label"><input type="radio" name="mem_gender" id="mem_gender" value="0">小姐</label>
                <br><font color="red" size="-1">${errorMsgs.errorGender}</font>
            </div>
           
<!--日期===================================-->
            <div class="control-group form-group">
                <label>生日:</label>
                <div class="controls" >
					 <input class="form-control form_datetime" name="mem_bdate" id="mem_bdate" value="${memVO.mem_bdate}"  type="text" readonly >
				</div>
				<font color="red" size="-1">${errorMsgs.errorDate}</font>
			</div>
			<div class="control-group form-group">
                   <label>身分證:</label>
                   <div class="controls ">
                       <input type="text" class="form-control"  name="mem_idnumber"  value="${memVO.mem_idnumber}">
                   </div>
                   <font color="red" size="-1">${errorMsgs.errorIdnumber}</font>
              </div>
              <div class="control-group form-group">
                  <label>電話:</label>
                  <div class="controls ">
                      <input type="tel" class="form-control" name="mem_tel"  value="${memVO.mem_tel}">
                  </div>
                  <font color="red" size="-1">${errorMsgs.errorTel}</font>
              </div>
              <div class="control-group form-group">
                  <label>行動電話:</label>
                  <div class="controls ">
                      <input type="tel" class="form-control" name="mem_phone"  value="${memVO.mem_phone}">
                  </div>
                  <font color="red" size="-1">${errorMsgs.errorPhone}</font>
              </div>
              <div class="control-group form-group">
                  <label>地址:</label>
                  <div class="controls ">
                      <input type="text" class="form-control" name="mem_address"  value="${memVO.mem_address}">
                  </div>
              </div>
              <br>
               <input type="hidden" name="action" value="insertMem">
          	  <button type="reset" class="btn btn-primary" >取消 </button>
              <button type="submit" class="btn btn-danger" form="register_member">送出 </button>

           	
          </form>
       
<!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>


<script>
 (function($){
	   $("#mem_bdate").datetimepicker({
	       format: "yyyy-mm-dd",
	       autoclose: true,
	       forceParse:true,
	       initialDate:new Date(),
	       pickerPosition: "bottom-left",
	       minView:2,});
	      
	   $("#mem_bdate").css('cursor','default');
	   $("#mem_bdate").css('background-color','white');
		
	    
	   $(document).ready(function() {
		   var gender =  $('#mem_gender1').val();
		   $("input[name='mem_gender'][value='"+gender+"']").prop("checked",true);
		  
		    $('#register_member').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
	        	
		        fields: {
		        	mem_account: {
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
		            mem_name: {
		            	trigger: 'keyup blur',
		                validators: {
		                	notEmpty: {
		                        message: '姓名不可空白'
		                    },
		                    regexp: {
		                        regexp:  /^[\u4e00-\u9fa5]+$/,
		                        message: '只能填寫中文'
		                    },
		                }
		            },
		          
		            mem_gender: {
		                validators: {
		                	trigger: '',
		                    notEmpty: {
		                        message: '請選擇性別'
		                    }
		                }
		            },
		            
		            mem_idnumber: {
		            	trigger: 'keyup blur',
		                validators: {
		                	notEmpty: {
		                        message: '身分證不可空白'
		                    },
		                    regexp: {
		                        regexp:  /^[a-zA-Z]{1}[1-2]{1}[0-9]{8}$/,
		                        message: '身分證格式錯誤'
		                    },
		                }
		            },
		            mem_bdate: {
		            	trigger: 'change',
		                validators: {
		                	notEmpty: {
		                        message: '生日不可空白'
		                    },
		                }
		            },
		            mem_tel: {
		            	trigger: 'keyup blur',
		                validators: {
		                	notEmpty: {
		                        message: '電話不可空白'
		                    },
		                    regexp: {
		                        regexp:  /^[0-9]{8,12}$/,
		                        message: '電話格式錯誤'
		                    },
		                }
		            },
		            mem_phone: {
		            	trigger: 'keyup blur',
		                validators: {
		                	notEmpty: {
		                        message: '行動電話不可空白'
		                    },
		                    regexp: {
		                        regexp:  /^[0-9]{10,15}$/,
		                        message: '行動電話格式錯誤'
		                    },
		                }
		            },
		        }}
		    ).on('success.form.bv', function() {
	            $('#register_success').modal('show');
	        });

		});
   
	 })(jQuery)
</script>

