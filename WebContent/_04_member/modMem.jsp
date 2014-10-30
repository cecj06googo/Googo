<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
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
               			<img class="img-responsive" src="http://placehold.it/1200x300" alt="">
        			</div>
            		<div class="col-lg-1"></div>
        		<div class="col-lg-5"><br>
            				
            	<!--修改會員form-->
            	<form name="register_member" id="register_member" action="#" method="get" novalidate>
                     <div class="control-group form-group ">
                        <label>帳號:</label>
                        <div class="controls input-group">
                            <input type="text" class="form-control" id="mem_account" value="e810616@yahoo.com.tw" disabled>
                       		<span class="input-group-addon"><i class="fa fa-ban"></i></span>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>密碼:</label>
                        <div class="controls ">
                            <input type="password" class="form-control" id="mem_pwd" placeholder="******" >
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>姓名:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" id="mem_name" placeholder="黃詩芸"  required >
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label><input type="radio" name="optionsRadios" id="mem_gender" value="1">先生</label>
                        <label><input type="radio" name="optionsRadios" id="mem_gender" value="0" checked>小姐</label>
                    </div>
    <!--日期===================================-->
    				
                   <div class="control-group form-group">
                		<label>生日:</label>
                		<div class="controls" >
							 <input class="form-control form_datetime" name="mem_bdate"  id="mem_bdate" type="text" readonly>
						</div>
					</div>
					<div class="control-group form-group">
                        <label>身分證:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" id="mem_idnumer" placeholder="A123456789">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>電話:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_tel" placeholder="02-12345678">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <label>行動電話:</label>
                        <div class="controls ">
                            <input type="tel" class="form-control" id="mem_phone" placeholder="0910-666-666">
                        </div>
                    </div>
                     <div class="control-group form-group">
                        <label>地址:</label>
                        <div class="controls ">
                            <input type="text" class="form-control" id="mem_address" placeholder="台北市復興南路一段390號">
                        </div>
                    </div>
                    <br>
                    
                    <button type="submit" class="btn btn-success">送出</button>
                    <button type="submit" class="btn btn-danger">取消 </button>
                 
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
    
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>

<script>
 (function($){
   $("#mem_bdate").datetimepicker({
       format: "yyyy-mm-dd",
       autoclose: true,
       forceParse:true,
       initialDate:new Date(),
       pickerPosition: "bottom-left",
       minView:2,
    });
   $("#mem_bdate").css('cursor','default');
   $("#mem_bdate").css('background-color','white');
 })(jQuery)
</script>

</body>
</html>