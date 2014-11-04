<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<div class="modal fade"  id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		  	<div class="modal-content ">
		  	<!-- header-->
		  	<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		 <h3 class="modal-title" id="myModalLabel">Goo-go登入 <small>login</small></h3>
      		</div><!--/. header-->
      		<!-- body-->
      		<div class="modal-body">
     		<div class="row">
       			 <div class="col-md-10 col-md-offset-1">
         		 <a href="#" class="btn btn-lg btn-primary btn-block"><i class="fa fa-facebook-square"></i>  Facebook</a>
       		 	</div>
      		</div>
			  <div class="login-or">
			    <hr class="hr-or">
			    <span class="span-or">or</span>
			  </div>
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- form-->	
		      <form role="form" action="<%=request.getContextPath()%>/Login.gg" method="post">
		        <div class="form-group">
		          <label > E-mail:</label><font size="-1" color="#FF0000">${ErrorMsg.errorLogin}</font>
		          <input type="text" class="form-control" id="inputEmail" name="user_account">
		        </div>
		        <div class="form-group">
		          <a class="pull-right" href="#" data-toggle="modal" data-target="#forgetpwd" id="forget" data-dismiss="modal">忘記密碼?</a>
		          <label>密碼:</label>
		          <input type="password" class="form-control" id="inputPassword" name="user_pwd">
		        </div>
		        <div class="form-group">
                        <label><input type="radio" name="optionsRadios" id="member" value="Mem" checked >一般會員</label>
                        <label><input type="radio" name="optionsRadios" id="company" value="Com">商家會員</label>
                </div>
		        <div class="login-or">
			    <hr class="hr-or">
			    <span class="span-or"></span>
			 	</div>
		        <div class="form-group pull-left">
		          <label><input type="checkbox">自動登入 </label>
		        </div>
		        <button type="submit" class="btn btn-lg btn-primary pull-right">登入</button>
		        <input type="hidden" name="action" value="login">
		      </form>
		      <!--/. form-->
 		    </div>
 		  </div>
 		   <!--尚未註冊-->
 		  <div class="row" style="margin-top: 20px;">
 		  <div class="well col-md-10 col-md-offset-1">
            <div class="row ">
                <div class="col-md-8">
                    <h4>還沒註冊嗎?</h4>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-default btn-block" href="register.html">註冊會員</a>
                </div>
            </div>
          </div> 
 		  </div><!--/.尚未註冊-->
 		  	
 		</div><!-- body-->
 		</div>
		</div>
		</div>
		<!-- /.登入-->