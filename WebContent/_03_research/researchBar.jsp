<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<!--Search bar-->

	<form class="form-inline" role="form" action="SearchServlet.do" method="post" id="research">
				<div class="form-group control-group">
				<div class="controls" >
					<select class="form-control input-lg" name="location">
						<option>地區</option>
						<option value="臺北">臺北</option>
						<option value="桃園">桃園</option>
						<option value="宜蘭">宜蘭</option>
						<option value="高雄">高雄</option>
						<option value="墾丁">墾丁</option>
					</select>
				</div></div>
				<div class="form-group control-group">
				<div class="controls" >
					<select class="form-control input-lg" name="prod_type">
						<option>交通工具</option>
						<option value="1">汽車</option>
						<option value="2">機車</option>
						<option value="3">腳踏車</option>
					</select>
				</div></div>

				<div class="form-group  control-group">
				<div class="controls" >
					<input type="text" class="form-control input-lg" name="keySearch" placeholder="商店名、地址、商品名">
	
				</div></div>
				
					<button class="btn btn-default btn-lg" type="submit">
						<i class="fa fa-search"></i>
					</button>
				
				<div>
					<Font color="red">${ErrMsg}</Font>
				</div>
			</form>

<!-- jQuery Version 1.11.0 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>

<script>
 (function($){
	   $(document).ready(function() {
		    $('#research').bootstrapValidator({
		    	container: 'tooltip',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
		            
		        },
	        	
		        fields: {
		        	keySearch: {
		        		trigger: 'keyup blur',
		                validators: {
		                	regexp: {
		                        regexp: /^(?=.*\d).{6,12}$/,
		                        message: '需包含英文及數字'
		                    },		                    
		                }
		            },
		            
		       },
		    })
		    .on('error.field.bv', function(e, data) {
	            // Get the tooltip
	            var $parent = data.element.parents('.form-group'),
	                $icon   = $parent.find('.form-control-feedback[data-bv-icon-for="' + data.field + '"]'),
	                title   = $icon.data('bs.tooltip').getTitle();

	            // Destroy the old tooltip and create a new one positioned to the right
	            $icon.tooltip('destroy').tooltip({
	                html: true,
	                placement: 'bottom',
	                title: title,
	                container: 'body'
	            });
	        });
		});
   
	 })(jQuery)
</script>
