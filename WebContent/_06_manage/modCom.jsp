<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.company.model.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:include page="/_00_fragment/css2.jsp" />
<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">

<title>Goo-go</title>

</head>
<body>
 <div id="wrapper">
	<!-- top2 -->
	<jsp:include page="/_00_fragment/top2.jsp" />
	
	<!-- page-wrapper -->
    <div id="page-wrapper">
	<!-- container-fluid -->
    <div class="container-fluid">

       <!--修改-->
       <div class="row">
     	<!--標頭-->
         <div class="col-lg-12">
             <h2 class="page-header"><i class="fa  fa-briefcase"></i> 修改商家資料 <small>modification</small> </h2>
         </div><!--/.標頭-->
         
         <div id="successInfo"></div>
         
        <!--商家修改資料內容-->
         <div class="col-lg-12">
		<!--內容-->
        <div id="myTabContent" class="tab-content">
 	   	<!--標籤2內容-->
        <div class="tab-pane fade active in" id="register-two">
                     <br>
<!--      		<div class="col-lg-5 col-lg-offset-1"> -->
<!--          			<br> -->
        
        <div class="col-sm-12 col-sm-offset-1">
			<img class="img-responsive" id="comImg"
				src='${pageContext.servletContext.contextPath}/image?comID=${LoginComOK.comID}' alt=""> <!-- http://placehold.it/750x450  -->
				
				<br><br>
		   </div>
         				
     	<!--修改商家form-->
     	<form name="Update_company" enctype="multipart/form-data" id="updateComForm" 
     			action="<%=request.getContextPath()%>/Company.Update" method="POST">
     	      <div class="col-lg-4">
                 <div class="control-group form-group">
                     <label class="control-label">帳號:</label>
                     <div class="controls">
                         <input type="text" class="form-control" name="comAccount" id="com_account" 
                          value="${LoginComOK.comAccount}" disabled>
<!--                     	<span class="input-group-addon"><i class="fa fa-ban"></i></span>fa fa-ban -->
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorAccount}</font></span>
                 </div>
                 <div class="control-group form-group">
                     <label class="control-label">修改新密碼:</label>
                     <div class="controls">
                         <input type="password" class="form-control" name="comPwd" id="com_pwd" 
                          placeholder="修改請輸入新密碼" value=""
                          data-toggle="tooltip" data-placement="top" title="<h5>請輸入6-12個字元，英文數字至少各一。<h5>"  >
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorPwd}</font></span>
                 </div>
                 <div class="control-group form-group">
                     <label class="control-label">確認新密碼:</label>
                     <div class="controls">
                         <input type="password" class="form-control" name="comPwdConfirm" id="com_pwd"
                          placeholder="請再次輸入新密碼" value=""
                          data-toggle="tooltip" data-placement="top" title="<h5>請再次輸入新密碼<h5>" >
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>商家名稱:</label>
                     <div class="controls">
                         <input type="text" class="form-control" name="comName" id="com_name"
                          placeholder="" value="${LoginComOK.comName}" >
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorName}</font></span>
                 </div>
                 <div class="control-group form-group">
                     <label>負責人:</label>
                     <div class="controls">
                         <input type="text" class="form-control" name="comOwner" id="com_owner"
                          placeholder="" value="${LoginComOK.comOwner}">
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorOwner}</font></span>
                 </div>
             </div><!-- 分列 -->
             <div class="col-lg-5 col-lg-offset-1">
            	<div class="control-group form-group">
                     <label>營業統編:</label>
                     <div class="controls">
                         <input type="text" class="form-control" name="comVAT" id="com_vat" 
                         placeholder="" value="${LoginComOK.comVAT}" disabled>
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorVAT}</font></span>
                 </div>
				<div class="control-group form-group">
                     <label>地址:</label>
                     <div class="controls">
                         <input type="text" class="form-control" name="comAddr" id="com_address" 
                         placeholder="" value="${LoginComOK.comAddr}">
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorAddr}</font></span>
                 </div>
                 <div class="control-group form-group">
                     <label>電話:</label>
                     <div class="controls">
                         <input type="tel" class="form-control" name="comTel" id="com_tel"
                          placeholder="" value="${LoginComOK.comTel}">
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorTel}</font></span>
                 </div>
                 <div class="control-group form-group">
                     <label>fax:</label>
                     <div class="controls">
                         <input type="tel" class="form-control" name="comFax" id="com_fax"
                          placeholder="" value="${LoginComOK.comFax}">
                     </div>
                     <span><font color="red" size="-1">${errorMsgs.errorFax}</font></span>
                 </div>
                 <div class="control-group form-group">
					 <label>商家封面圖片:</label> 
					 <input type="file" name="comPic" id="comLogo" onchange="fileShow();" accept="image/*">
				 </div>
                </div> <!-- 分列 --> 
                 
           	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" 
           				aria-labelledby="ComfirmModalLabel" aria-hidden="true">
  				<div class="modal-dialog modal-sm">
    				<div class="modal-content"> 
    					<div class="modal-header">
    						<h4 class="modal-title" id="ComfirmModalLabel">確認修改?</h4>
    					</div>
    					<div class="modal-footer">
                			<input type="hidden" name="action" value="update"> 
							<input type="hidden" name="comID" value="${LoginComOK.comID}"> 
							<input type="hidden" name="comAccount" value="${LoginComOK.comAccount}">
							<input type="hidden" name="comVAT" value="${LoginComOK.comVAT}">
							<input type="hidden" name="comStatus" value="${LoginComOK.comStatus}">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                			<button type="submit" data-loading-text="Loading..." class="btn btn-danger">確認</button>
               			</div>
           			</div>
           		</div>
           	</div>
		</form> <!--  商家修改資料Form -->
            
            
        <!-- 確認修改彈出視窗 -->
        <div class="col-lg-12">
        		<br>
			<button type="button" class="btn btn-primary" data-toggle="modal" 
				data-target=".bs-example-modal-sm">儲存</button>
				<br><br>
		</div>
<!-- 				選取檔案 -->
<!-- 				<form name="imageupload" enctype="multipart/form-data" action="image" method="POST"> -->
<!-- 					<div class="control-group form-group"> -->
<!-- 						<label>商家封面圖片:</label> <input type="file" name="file">  -->
<%-- 						<input type="hidden" name="comID2" value="<%=companyVO.getComID()%>"> --%>
<!-- 					</div> -->
<!-- 				</form> -->
		  	
        </div><!--/.標籤2內容-->
                 
        </div><!--/.內容-->
                 
   		</div><!--/.商家修改資料內容-->
            
        </div><!--/.修改-->
        
        
        </div><!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->

<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>


<script>
//top2左方功能列選項
$("#selectModCom").addClass("active");
</script>

<script>
$("[data-toggle='tooltip']").tooltip({html : true });


// 即時顯示圖片
function fileShow() {
	var reader = new FileReader();
	reader.onload = function(e) {
		var fileContent = e.target.result;
		var show = document.getElementById("comImg");
		show.setAttribute("src", fileContent);
	}
	file = document.getElementById("comLogo").files[0];
	reader.readAsDataURL(file);
}



(function($){
	$(document).ready(function() {
	    $("#updateComForm").bootstrapValidator({
	    	feedbackIcons: {
	    		valid : 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
	    	},
	    	
	    	fields: {
	    		comPwd: {
					trigger: 'keyup blur',
					validators: {
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
							regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9)]+$/,
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
							regexp: /^[(\u4e00-\u9fa5)\-(a-zA-Z0-9_)]+$/,
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
	    	} // end fields
	    }); // end bootstrapValidator
	}); // end ready 

})(jQuery)

</script>

</body>
</html>