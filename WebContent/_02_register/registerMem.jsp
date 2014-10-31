<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" rel="stylesheet">
	<form name="register_member" id="register_member" action="#" method="get" novalidate>
             <div class="control-group form-group ">
                <label>帳號:</label>
                <div class="controls input-group" >
                    <input type="text" class="form-control " name="mem_account" placeholder="請輸入e-mail" >
               	<span class="input-group-addon"><i class="fa fa-thumbs-o-up"></i></span><!-- fa fa-ban-->
                </div>
            </div>
            <div class="control-group form-group">
                <label>密碼:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="mem_pwd" placeholder="請輸入6~12，包含英文與數字" >
                </div>
            </div>
            <div class="control-group form-group">
                <label>密碼確認:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="mem_pwd" placeholder="請再次輸入密碼" >
                </div>
            </div>
            <div class="control-group form-group">
                <label>姓名:</label>
                <div class="controls ">
                    <input type="text" class="form-control" name="mem_name"  required >
                </div>
            </div>
            <div class="control-group form-group">
                <label><input type="radio" name="mem_gender" id="mem_gender" value="1">先生</label>
                <label><input type="radio" name="mem_gender" id="mem_gender" value="0">小姐</label>
            </div>
<!--日期===================================-->
            <div class="control-group form-group">
                <label>生日:</label>
                <div class="controls" >
                <!--<div class="controls input-group" >
                  <span class="input-group-addon">
				  <span class="glyphicon glyphicon-calendar"></span></span>-->
					 <input class="form-control form_datetime" name="mem_bdate"  id="mem_bdate" type="text" readonly >
				
				</div>
			</div>
			<div class="control-group form-group">
                   <label>身分證:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" name="mem_idnumer" >
                   </div>
              </div>
              <div class="control-group form-group">
                  <label>電話:</label>
                  <div class="controls ">
                      <input type="tel" class="form-control" name="mem_tel">
                  </div>
              </div>
              <div class="control-group form-group">
                  <label>行動電話:</label>
                  <div class="controls ">
                      <input type="tel" class="form-control" name="mem_phone">
                  </div>
              </div>
              <div class="control-group form-group">
                  <label>地址:</label>
                  <div class="controls ">
                      <input type="text" class="form-control" name="mem_address">
                  </div>
              </div>
              <br>
               
              <a class="btn btn-success" data-toggle="modal" data-target="#register_success">送出</a>
          <!--<button type="submit" class="btn btn-success" data-toggle="modal" data-target="#register_success">送出</button>  -->  
              <button type="submit" class="btn btn-danger">取消 </button>
           	
          </form>
           
       
<!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
   <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

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