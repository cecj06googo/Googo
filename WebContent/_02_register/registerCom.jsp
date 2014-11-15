<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">

<style>
#cropContainerHeader {
    width: 750px;
    height: 450px;
    position:relative; /* or fixed or absolute */
}

</style>

      	<form name="register_company" id="registerComForm" action="<%=request.getContextPath()%>/Company.Register"
      	      method="POST">
              <div class="control-group form-group ">
                  <label class="control-label">帳號:</label>
                  <div class="controls">
                      <input type="text" class="form-control" name="comAccount" id="com_account"
                       placeholder="請輸入e-mail" value="${companyVO.comAccount}"
                       data-toggle="tooltip" data-placement="top" title="請輸入email"  >
                   </div>
                   <span><font color="red" size="-1">${errorMsgs.errorAccount}</font></span>
               </div>
               <div class="control-group form-group">
                   <label class="control-label">密碼:</label>
                   <div class="controls ">
                       <input type="password" class="form-control" name="comPwd" id="com_pwd"
                        placeholder="請輸入6~12，包含英文與數字" value="${companyVO.comPwd}" >
                   </div>
                    <span><font color="red" size="-1">${errorMsgs.errorPwd}</font></span>
               </div>
               <div class="control-group form-group">
                <label class="control-label">密碼確認:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="comPwdConfirm" 
                     placeholder="請再次輸入密碼" value="${companyVO.comPwd}" >
                </div>
            </div>
               <div class="control-group form-group">
                   <label>商家名稱:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" name="comName" id="com_name"
                        value="${companyVO.comName}" >
                   </div>
                   <span><font color="red" size="-1">${errorMsgs.errorName}</font></span>
               </div>
               <div class="control-group form-group">
                   <label>負責人:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" name="comOwner" id="com_owner"
                        value="${companyVO.comOwner}">
                   </div>
                   <span><font color="red" size="-1">${errorMsgs.errorOwner}</font></span>
               </div>
               <div class="control-group form-group">
                   <label>營業統編:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" name="comVAT" id="com_vat"
                        value="${companyVO.comVAT}">
                   </div>
                   <span><font color="red" size="-1">${errorMsgs.errorVAT}</font></span>
               </div>
			   <div class="control-group form-group">
                   <label>地址:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" name="comAddr" id="com_address"
                        value="${companyVO.comAddr}">
                   </div>
                   <span><font color="red" size="-1">${errorMsgs.errorAddr}</font></span>
               </div>
               <div class="control-group form-group">
                   <label>電話:</label>
                   <div class="controls ">
                       <input type="tel" class="form-control" name="comTel" id="com_tel"
                        value="${companyVO.comTel}">
                   </div>
                   <span><font color="red" size="-1">${errorMsgs.errorTel}</font></span>
               </div>
               <div class="control-group form-group">
                   <label>fax:</label>
                   <div class="controls ">
                       <input type="tel" class="form-control" name="comFax" id="com_fax"
                        value="${companyVO.comFax}">
                   </div>
                   <span><font color="red" size="-1">${errorMsgs.errorFax}</font></span>
               </div>
              
              <br> 
              <button type="submit" class="btn btn-success" 
               data-toggle="modal" data-target="#register_success" >送出</button>
               <input type="reset" class="btn" value="重填"/>
              <input type="button" class="btn btn-danger" value="取消" 
               onclick="self.location.href='<%=request.getContextPath()%>/index.jsp'" />
          </form>
          
          <div id="yourimg"></div>
          
<!--           <div class="col-lg-12"> -->
<%--               <img id="comPicture" class="img-responsive" src='<%=request.getContextPath()%>/img/ComDefaultPic.jpg' alt=""> --%>
<!-- 			  <span></span> -->
<!--           </div> -->
          
<!-- jQuery Version 1.11.0 -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script> --%>

<!-- Bootstrap Core JavaScript -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>


<script>
(function($){ 
 	$("[data-toggle='tooltip']").tooltip();
 	
 	
 	
 	
	$(document).ready(function() {
		$("#registerComForm").bootstrapValidator({
			feedbackIcons: {
				valid : 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
			},
			
			fields: {
				comAccount: {
					trigger: 'keyup blur',
					message: '此電子郵件地址無效',
					validators: {
						notEmpty: {
							message: '帳號欄請勿空白，請填入E-mail'
						},
						emailAddress: {
							message: '此E-mail無效,請輸入正確格式'
						},
// 						regexp: {
// 							regexp:/^\\S+@\\S+\\.\\S{2,4}$/,
// 							message: '此E-mail無效,請輸入正確格式'
// 						},
	 					remote: {
	 						 url: 'comAccountCheck.jsp',
	                          type: "post",
	                          async: false,
// 	                          data: function(validator) {
// 	                              return {
// 	                                  email: validator.getFieldElements('comAccount').val()
// 	                              };
// 	                          },
	                          message: '帳號重複，請重新輸入',
	 					},
					} //end validators
				}, // end comAccount
				
				comPwd: {
					trigger: 'keyup blur',
					validators: {
						notEmpty: {
							message: '密碼欄請勿空白'
						},
						stringLength: {
							min: 6,
							max: 12,
							message: '密碼長度限6至12字數'
						},
						regexp: {
							regexp: /^(?=.*\d)(?=.*[a-z]).{6,12}$/,
		                    message: '需包含英文及數字'
						},
						identical: {
							field: 'comPwdConfirm',
							message: '與密碼不相符, 再試一次?'
						},
					} // end validators
				}, // end comPwd
				
				comPwdConfirm: {
					trigger: 'keyup blur',
					validators: {
						notEmpty: {
							message: '密碼確認不可空白'
						},
						identical: {
							field: 'comPwd',
							message:'與密碼不相符, 再試一次?'
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
					} // end validators
				}, // end comPwdConfirm	
				
				comName: {
					trigger: 'keyup blur',
					validators: {
						notEmpty: {
							message: '姓名不可空白'
						},
						stringLength: {
							min: 1,
							max: 32,
							message: '姓名長度限1~32字數'
						},
						regexp : {
							regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9-)]+$/,
							message: '只能是中、英文字母、數字和-'
						},
					} // end validators
				}, // end comName
				
				comOwner: {
					trigger: 'keyup blur',
					validators: {
						notEmpty: {
							message:'公司負責人姓名請勿空白'
						},
						stringLength: {
							min: 1,
							max: 32,
							message: '姓名長度限1~32字數'
						},
						regexp : {
							regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9)]+$/,
							message: '只能是中、英文字母、數字和-'
						},
					} // end validators
				}, // end comOwner
				
				comAddr: {
					trigger: 'keyup blur',
					validators: {
						notEmpty: {
							message:'地址請勿空白'
						},
						stringLength: {
							min: 5,
							max: 64,
							message: '地址限5~64字數'
						},
						regexp : {
							regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9)]+$/,
							message: '只能是中、英文字母、數字和-'
						},
					} // end validators
				}, // end comAddr
				comTel: {
					trigger: 'keyup blur',
					validators: {
						notEmpty: {
	                        message: '電話請勿空白'
	                    },
	                    stringLength: {
							min: 8,
							max: 15,
							message: '電話號碼至少8碼, 至多15碼'
						},
	                    regexp: {
	                        regexp:  /^[(0-9)-]{8,15}$/,
	                        message: '電話格式錯誤, 只能是數字和-'
	                    },
					} // end validators
				}, // end comTel
				comFax: {
					trigger: 'keyup blur',
					validators: {
						stringLength: {
							min: 8,
							max: 15,
							message: '傳真號碼至少8碼, 至多15碼'
						},
	                    regexp: {
	                        regexp:  /^[(0-9)-]{8,15}$/,
	                        message: '傳真號碼格式錯誤, 只能是數字和-'
	                    },
					} // end validators
				}, // end comFax
				comVAT: {
					trigger: 'keyup blur',
					validators: {
						notEmpty: {
	                        message: '公司統編請勿空白'
	                    },
	                    stringLength: {
							min: 8,
							max: 8,
							message: '公司統編為8碼'
						},
	                    regexp: {
	                        regexp:  /^[(0-9)]{8}$/,
	                        message: '只能是數字'
	                    },
	                    remote: {
	 						 url: 'comVATCheck.jsp',
	                          type: "post",
	                          async: false,
//	                          data: function(validator) {
//	                              return {
//	                                  email: validator.getFieldElements('comAccount').val()
//	                              };
//	                          },
	                          message: '此統一編號已存在，請重新輸入',
	 					},
					} // end validators
				}, // end comVAT
			} // end fields
		}).on('success.form.bv', function() {
            $('#register_success').modal('show');
		});
	});
	
})(jQuery)

</script>