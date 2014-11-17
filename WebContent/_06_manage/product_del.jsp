<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!--刪除商品-->
<div id="delProduct" class="modal fade" role="dialog" aria-labelledby="register_success" aria-hidden="true">
	<div class="modal-dialog modal-sm">
  	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		    <h3 class="modal-title">刪除商品 <small>delete</small></h3>
		</div>
	    <div class="modal-body">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<form role="form" id="prodDelete" name="prodDelete" action="<%=request.getContextPath()%>/prod.delete" method="post">
		        <div class="form-group">
			   		<input type="hidden" name="action" value="prodDelete"/>
			   		<input type="hidden" name="prodId" id="idForSent" value="0">
			   	<h4 style="color:red;font-weight:bold;">確定要刪除此商品?</h4>
			    <button type="submit" class="btn btn-lg btn-danger pull-right">確認</button>
		        <button type="reset" class="btn btn-lg btn-success pull-right" data-dismiss="modal">取消</button>
		    	</div>
		    </form>
		    </div>
			</div>
<!-- 		毫無反應，只是兩個BUTTON -->
		</div>
	</div>	
	</div>
</div>
<!--/.刪除商品-->
			