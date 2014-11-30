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
	      <form role="form" enctype="multipart/form-data" id="productEdit" action="<%=request.getContextPath()%>/prod.edit" 
     	      method="POST">
	        <div class="form-group">
	          <label > 商品名稱:</label>
	          <input type="hidden" name="prodId" >
<!-- 	          COM_ID +4PIC + STATUS   = +6  需要 11個--> 
<!-- 	          <input type="hidden" name="prodType" > -->
	          <input type="text" class="form-control" name="prodName"  placeholder="請輸入商品名稱">
	        </div>
	         <div class="form-group ">
                <label class="control-label">商品車號:</label>
                <div class="controls" >
                    <input type="text" class="form-control" name="prodPlate"  placeholder="請輸入商品名稱" >
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdName}</font>
                <div id="div1"></div>
            </div>
	        <div class="form-group ">
	          <label > 價格:</label>
	          <div class="form-inline">
	          <input type="text" class="form-control" name="prodPrice"  placeholder="請輸入商品價格">元
	          </div>
	        </div>
	        <div class="form-group ">
	          <label > 優惠:</label>
	          <div class="form-inline">
	          <input type="text" class="form-control" name="prodDisc" placeholder="請輸入商品優惠">折
	          </div>
	        </div>
<!--             <div class="form-group "> -->
<!--              	<label >車輛類型:</label> -->
<!--                 <select class="form-control" name="prodKind"> -->
<!--                     <option value="1">轎車</option> -->
<!-- 					<option value="2">休旅車</option> -->
<!-- 					<option value="3">大型重型機車</option> -->
<!-- 					<option value="4">普通重型機車</option> -->
<!-- 					<option value="5">普通輕型機車</option> -->
<!-- 					<option value="6">越野腳踏車</option> -->
<!-- 					<option value="7">摺疊腳踏車</option> -->
<!-- 					<option value="8">電動腳踏車</option> -->
<!-- 					<option value="9">一般腳踏車</option> -->
<!--                 </select> -->
<%--                 <font size="-1" color="#FF0000">${ErrorMsg.errorProdKind}</font> --%>
<!--             </div> -->
<!--              <div class="control-group  form-group"> -->
<!--                 <label >乘載人數:</label> -->
<!--                 <select class="form-control" name="prodCarrier"> -->
<!--                     <option value="2">2</option> -->
<!-- 					<option value="3">3</option> -->
<!-- 					<option value="4" selected>4</option> -->
<!-- 					<option value="5">5</option> -->
<!-- 					<option value="6">6</option> -->
<!-- 					<option value="7">7</option> -->
<!-- 					<option value="8">8</option> -->
<!--                 </select> -->
<%--                 <font size="-1" color="#FF0000">${ErrorMsg.errorProdCarrier}</font> --%>
<!--             </div> -->
<!--             <div class="form-group "> -->
<!--                 <label>排氣量:</label> -->
<!--                 <div class="controls "> -->
<!--                     <input type="text" class="form-control" name="prodCc" placeholder="請輸入排氣量"> -->
<!--                 </div> -->
<%--                 <font size="-1" color="#FF0000">${ErrorMsg.errorProdCc}</font> --%>
<!--             </div> -->
<!-- 			<div class="form-group "> -->
<!--                 <label>手自排:</label> -->
<!--                 <div class="controls "> -->
<!--                 <select name="prodControl"> -->
<!-- 					<option value="1" selected>手排</option> -->
<!-- 					<option value="2">自排</option> -->
<!-- 					<option value="3">手自排</option> -->
<!-- 				</select> -->
<%-- 					<font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font> --%>
<!-- 			</div> -->
<%--                  	<font size="-1" color="#FF0000">${ErrorMsg.errorProdControl}</font> --%>
<!--             </div> -->
            <div class="form-group ">
                <label>商品說明:</label>
                <div class="controls ">
                    <textarea  rows="5" class="form-control" name="prodArticle" ></textarea>
                </div>
                <font size="-1" color="#FF0000">${ErrorMsg.errorProdArticle}</font>
            </div>
	        <button type="reset" class="btn btn-lg btn-danger pull-right" data-dismiss="modal">取消</button>
	        <button type="submit" class="btn btn-lg btn-success pull-right">確認</button>
	         
	      </form><!-- /.form-->
		</div>
	    </div>
 		</div><!-- /.body-->
	</div>
  </div>
</div>
		<!--/.修改商品-->