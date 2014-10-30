<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!--修改商品-->
<div class="modal fade"  id="editProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  	<div class="modal-content ">
	  	<!-- header-->
	  	<div class="modal-header">
   			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
       		 <h3 class="modal-title" id="myModalLabel">修改商品 <small>modification</small></h3>
   		</div><!-- /.header-->
   		<!-- body-->
   		<div class="modal-body">
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
		  <!-- form-->
	      <form role="form" action="#">
	        <div class="form-group">
	          <label > 商品名稱:</label>
	          <input type="text" class="form-control"  placeholder="NISSAN" >
	        </div>
	        <div class="form-group ">
	          <label > 價格:</label>
	          <div class="form-inline">
	          <input type="text" class="form-control"  placeholder="2500">元
	          <select class="form-control">
                               <option>小時</option>  
                               <option>一天</option>
                               <option>半天</option>
                 </select>
                 </div>
	        </div>
	        <div class="form-group">
	          <label > 呱呱:</label>
	          <input type="text" class="form-control"  placeholder="呱呱呱" >
	        </div>
	        
	        <button type="submit" class="btn btn-lg btn-danger pull-right">確認</button>
	        <button type="reset" class="btn btn-lg btn-success pull-right">取消</button>
	        
	      </form><!-- /.form-->
		</div>
	    </div>
 		</div><!-- /.body-->
	</div>
  </div>
</div>
		<!--/.修改商品-->