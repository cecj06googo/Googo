<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*"%>

<%
	MemVO memVO = (MemVO) request.getAttribute("memVO");
%>    
    
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

<title>Goo-go</title>
</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />
	
	 <!-- Page Content -->
    <div class="container">
        <!--註冊 -->
        <div class="row">
        	<!--標頭-->
            <div class="col-lg-12">
                <h2 class="page-header"><i class="fa fa-user"></i> 修改會員資料   <small>modification</small></h2>
            </div><!--/.標頭-->
           <!--會員註冊內容-->
            <div class="col-lg-12">
				<!--內容-->
                <div id="myTabContent" class="tab-content">
        		<!--標籤1內容-->
                <div class="tab-pane fade active in" id="register-one"><br>
                    <div class="col-lg-12">
               			<img class="img-responsive" src="${pageContext.request.contextPath}/img/41.png" alt="">
        			</div>
            		<div class="col-lg-1"></div>
        		<div class="col-lg-5"><br>
            				
           	<!--修改會員form-->
           	<form name="mod_member" id="mod_member" action="<%=request.getContextPath()%>/member.do" method="post" >
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
                    <input type="password" class="form-control" name="mem_pwd0" value="${memVO.mem_pwd}">
                </div>
                 <font color="red" size="-1">${errorMsgs.errorPwd}</font>
	            </div>
	            <div class="control-group form-group">
	                <label  class="control-label">密碼確認:</label>
	                <div class="controls ">
	                    <input type="password" class="form-control" name="mem_pwd" value="${memVO.mem_pwd}">
	                </div>
	            </div>
	            <div class="control-group form-group">
	                <label>姓名:</label>
	                <div class="controls ">
	                    <input type="text" class="form-control" name="mem_name" value="${memVO.mem_name}" >
	                </div>
	                <font color="red" size="-1">${errorMsgs.errorName}</font>
	            </div>
	            <div class="control-group form-group">
	                <label class="control-label"><input type="radio" name="mem_gender" id="mem_gender" value="1">先生</label>
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
	                <input type="hidden" name="action" value="updateMem">
	                <input type="hidden" name="mem_id" value="${memVO.mem_id}">
	               <!--	<div id="modConfirm" class="modal fade" role="dialog" aria-labelledby="modConfirm" aria-hidden="false">
					<div class="modal-dialog modal-sm">
				  	<div class="modal-content">
					<div class="modal-header">
					    <h3>註冊成功</h3>
					</div>
					  <div class="modal-body">
					    <p>確認修改?</p>
					    <p><button type="submit" class="btn btn-danger ">送出 </button></p>
					  </div>
					</div></div></div>	 -->
	               
	              
	            
	              <button type="reset" class="btn btn-primary" >取消 </button>
	              <button type="submit" class="btn btn-danger ">送出 </button>
	             <!-- <a class="btn btn-danger" data-toggle="modal" data-target="#modConfirm">確定 </a>-->
	           	
	          </form>
                </div>
                </div>
                </div><!--/.標籤1內容-->
                    
           
            </div><!--/.內容-->
                    
        </div><!--/.row-->

        <hr>
        <!-- Footer -->
        <jsp:include page="/_00_fragment/footer.jsp" />

    </div>
    <!-- /.container -->
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
		    $('#mod_member').bootstrapValidator({
		        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
	        	
		        fields: {
		        	
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
		    );
		});
})(jQuery)
</script>


</body>
</html>