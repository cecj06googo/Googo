<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      	<form name="register_company" id="register_company" action="Company.Register" method="get" novalidate>
              <div class="control-group form-group ">
                  <label>帳號:</label>
                  <div class="controls input-group">
                      <input type="text" class="form-control" id="com_account" placeholder="請輸入e-mail" >
                 	<span class="input-group-addon"><i class="fa fa-thumbs-o-up"></i></span><!-- fa fa-ban-->
                   </div>
               </div>
               <div class="control-group form-group">
                   <label>密碼:</label>
                   <div class="controls ">
                       <input type="password" class="form-control" id="com_pwd" placeholder="請輸入6~12，包含英文與數字" >
                   	
                   </div>
               </div>
               <div class="control-group form-group">
                <label>密碼確認:</label>
                <div class="controls ">
                    <input type="password" class="form-control" name="com_pwd" placeholder="請再次輸入密碼" >
                </div>
            </div>
               <div class="control-group form-group">
                   <label>商家名稱:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" id="com_name">
                   </div>
               </div>
               <div class="control-group form-group">
                   <label>負責人:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" id="com_owner">
                   </div>
               </div>
<div class="control-group form-group">
                   <label>地址:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" id="com_address">
                   </div>
               </div>
               <div class="control-group form-group">
                   <label>電話:</label>
                   <div class="controls ">
                       <input type="tel" class="form-control" id="com_tel">
                   </div>
               </div>
               <div class="control-group form-group">
                   <label>fax:</label>
                   <div class="controls ">
                       <input type="tel" class="form-control" id="com_fax">
                   </div>
               </div>
               <div class="control-group form-group">
                   <label>營業統編:</label>
                   <div class="controls ">
                       <input type="text" class="form-control" id="com_vat">
                   </div>
               </div>
               <!--選取檔案-->
            	<div class="control-group form-group">
                  <label>商家封面圖片:</label>
                  <input type="file">
              </div>
              <br> 
              <button type="submit" class="btn btn-success" >送出</button>
              <button type="submit" class="btn btn-danger">取消 </button>
          
          </form>
     
       <!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>