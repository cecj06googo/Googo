<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css2.jsp" />
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
        <!--商家修改資料內容-->
         <div class="col-lg-12">
		<!--內容-->
        <div id="myTabContent" class="tab-content">
 	   <!--標籤2內容-->
        <div class="tab-pane fade active in" id="register-two">
                     <br>
           <div class="col-lg-12">
          	  <img class="img-responsive" src="http://placehold.it/1200x300" alt="">
   			</div>
     		<div class="col-lg-5 col-lg-offset-1">
         			<br>
         				
     	<!--修改商家form-->
     	<form name="register_company" id="register_company" action="#" method="get" novalidate>
                 <div class="control-group form-group ">
                     <label>帳號:</label>
                     <div class="controls input-group">
                         <input type="text" class="form-control" id="com_account" placeholder="e810616@yahoo.com.tw" disabled >
                    	<span class="input-group-addon"><i class="fa fa-ban"></i></span><!-- fa fa-ban -->
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>密碼:</label>
                     <div class="controls ">
                         <input type="password" class="form-control" id="com_pwd" placeholder="******" >
                     	
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>密碼確認:</label>
                     <div class="controls ">
                         <input type="password" class="form-control" id="com_pwd" placeholder="請再次輸入密碼" >
                     	
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>商家名稱:</label>
                     <div class="controls ">
                         <input type="text" class="form-control" id="com_name" placeholder="拉拉租車小舖">
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>負責人:</label>
                     <div class="controls ">
                         <input type="text" class="form-control" id="com_owner" placeholder="黃詩芸">
                     </div>
                 </div>
				<div class="control-group form-group">
                     <label>地址:</label>
                     <div class="controls ">
                         <input type="text" class="form-control" id="com_address" placeholder="復興南路一段390號">
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>電話:</label>
                     <div class="controls ">
                         <input type="tel" class="form-control" id="com_tel" placeholder="02-22223333">
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>fax:</label>
                     <div class="controls ">
                         <input type="tel" class="form-control" id="com_fax" placeholder="02-22225555">
                     </div>
                 </div>
                 <div class="control-group form-group">
                     <label>營業統編:</label>
                     <div class="controls ">
                         <input type="text" class="form-control" id="com_vat" placeholder="12345678">
                     </div>
                 </div>
                 <!--選取檔案-->
               	<div class="control-group form-group">
                     <label>商家封面圖片:</label>
                     <img src="img/13.jpg">
                     <input type="file">
                 </div>
                 <br> 
                 <button type="submit" class="btn btn-success">送出</button>
                 <button type="submit" class="btn btn-danger">取消 </button>
             
             </form>
           </div>
        </div><!--/.標籤2內容-->
                 
        
        </div><!--/.內容-->
                 
   		</div><!--/.商家修改資料內容-->
            
        </div><!--/.修改-->
        

        </div><!-- /.container-fluid -->

    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->


<script>
//top2左方功能列選項
$("#selectModCom").addClass("active");
</script>


</body>
</html>