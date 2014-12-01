<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/* Main carousel style */
.carousel {
	max-width: 500px;
	width: 100%;
}

/* Indicators list style */
.article-slide .carousel-indicators {
	bottom: 0;
	left: 0;
	margin-left: 5px;
	width: 100%;
}
/* Indicators list style */
.article-slide .carousel-indicators li {
	border: medium none;
	border-radius: 0;
	float: left;
	height: 54px;
	margin-bottom: 5px;
	margin-left: 0;
	margin-right: 5px !important;
	margin-top: 0;
	width: 100px;
}
/* Indicators images style */
.article-slide .carousel-indicators img {
	border: 2px solid #FFFFFF;
	float: left;
	height: 54px;
	left: 0;
	width: 100px;
}
/* Indicators active image style */
.article-slide .carousel-indicators .active img {
	border: 2px solid #428BCA;
	opacity: 0.3;
}

.btn-cons {
	margin-right: 5px;
	min-width: 120px;
	margin-bottom: 8px;
}


</style>



<!--商品明細-->

<div class="modal fade" id="prod_detail" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content ">
			<!-- header-->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="myModalLabel">
					<small></small>
				</h3>
			</div>
			<!-- /.header-->
			<!-- body-->
			<div class="modal-body ">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<!-- 商品圖片-->
						<div class="carousel slide article-slide center"
							id="article-photo-carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner cont-slider">

								<div class="item active">
									<img alt="" title="" id="picDe">
								</div>
								<div class="item">
									<img alt="" title="" id="subPicDe1"
										src="${pageContext.request.contextPath}/img/39.jpg">
								</div>
								<div class="item">
									<img alt="" title="" id="subPicDe2"
										src="${pageContext.request.contextPath}/img/36.jpg">
								</div>
								<div class="item">
									<img alt="" title="" id="subPicDe3"
										src="${pageContext.request.contextPath}/img/37.jpg">
								</div>
							</div>
							<!-- /.Wrapper for slides -->
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li class="active" data-slide-to="0"
									data-target="#article-photo-carousel"><img alt="" id="picDeS" src="">
								</li>
								<li class="" data-slide-to="1"
									data-target="#article-photo-carousel"><img alt="" id="subPicDe1S" src="">
								</li>
								<li class="" data-slide-to="2"
									data-target="#article-photo-carousel"><img alt="" id="subPicDe2S" src="">
								</li>
								<li class="" data-slide-to="3"
									data-target="#article-photo-carousel"><img alt="" id="subPicDe3S" src="">
								</li>
							</ol>
						</div>
					</div>
				</div>
				<!--/.row-->
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td>折扣</td>
									<td name="prodDiscD"></td>
								</tr> 
								<tr>
									<td>租金</td>
									<td name="prodPriceD"></td>
								</tr> 
								<tr id="ControlD" name="3">
									<td>手/自排:</td>
									<td name="prodControlD"></td>
								</tr>
								<tr id="CarrierD" name="3">
									<td>乘載人數:</td>
									<td name="prodCarrierD"></td>
								</tr>
								<tr id="CcD" name="3">
									<td>排氣量</td>
									<td name="prodCcD"></td>
								</tr>
							</tbody>
						</table>
						<p>
							<a class='btn btn-success btn-cons' href="#" data-toggle="modal"
								data-target="#editProduct" data-dismiss="modal" name="editD"><span
								class="glyphicon glyphicon-edit"></span> 修改</a> <a href="#"
								class="btn btn-danger btn-cons " data-toggle="modal"
								data-target="#delProduct" data-dismiss="modal" name="delD"><span
								class="glyphicon glyphicon-remove"></span> 刪除</a>
						</p>
					</div>
				</div>
			</div>
			<!-- /.body-->
		</div>
		<!-- /.content-->
	</div>
</div>
<!-- /.商品明細-->

<!-- jQuery Version 1.11.0 -->
<script src="js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>


<script>

</script>

