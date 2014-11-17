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
	          <input type="text" class="form-control" name="prodName" value="${ProductsVO.prodName}" placeholder="請輸入商品名稱">
	        </div>
	        <div class="form-group ">
	          <label > 價格:</label>
	          <div class="form-inline">
	          <input type="text" class="form-control" name="prodPrice" value="${ProductsVO.prodPrice}" placeholder="請輸入商品價格">元
	          </div>
	        </div>
	        <div class="form-group ">
	          <label > 優惠:</label>
	          <div class="form-inline">
	          <input type="text" class="form-control" name="prodDisc" value="${ProductsVO.prodDisc}" placeholder="請輸入商品優惠">折
	          </div>
	        </div>
	        <div class="form-group">
	          <label > 呱呱:</label>
	          <input type="text" class="form-control"  placeholder="呱呱呱" >
	        </div>
	        
	        <button type="submit" class="btn btn-lg btn-danger pull-right" data-dismiss="modal">確認</button>
	        <button type="reset" class="btn btn-lg btn-success pull-right" data-dismiss="modal">取消</button>
	        
	      </form><!-- /.form-->
		</div>
	    </div>
 		</div><!-- /.body-->
	</div>
  </div>
</div>
		<!--/.修改商品-->