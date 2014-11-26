<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style> 
/* Main carousel style */
.carousel {
    max-width:500px;
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
</style>    
    
    
    
 <!--商品明細--> 
 
<div class="modal fade"  id="prod_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  	<div class="modal-content ">
	  	<!-- header-->
	  	<div class="modal-header">
   			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    		 <h3 class="modal-title" id="myModalLabel">商品名稱<small>productName</small></h3>
  		</div><!-- /.header-->
  		<!-- body-->
  		<div class="modal-body ">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- 商品圖片-->
			<div class="carousel slide article-slide center" id="article-photo-carousel">
		       <!-- Wrapper for slides -->
			<div class="carousel-inner cont-slider">
			
			<div class="item active">
			  <img alt="" title="" src="${pageContext.request.contextPath}/img/19.jpg">
			</div>
			<div class="item">
			  <img alt="" title="" src="${pageContext.request.contextPath}/img/39.jpg">
			</div>
			<div class="item">
			  <img alt="" title="" src="${pageContext.request.contextPath}/img/36.jpg">
			</div>
			<div class="item">
			  <img alt="" title="" src="${pageContext.request.contextPath}/img/37.jpg">
			</div>
			</div><!-- /.Wrapper for slides -->
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
				<li class="active" data-slide-to="0" data-target="#article-photo-carousel">
				  <img alt="" src="${pageContext.request.contextPath}/img/19.jpg">
				</li>
				<li class="" data-slide-to="1" data-target="#article-photo-carousel">
				  <img alt="" src="${pageContext.request.contextPath}/img/39.jpg">
				</li>
				<li class="" data-slide-to="2" data-target="#article-photo-carousel">
				  <img alt="" src="${pageContext.request.contextPath}/img/36.jpg">
				</li>
				<li class="" data-slide-to="3" data-target="#article-photo-carousel">
				  <img alt="" src="${pageContext.request.contextPath}/img/37.jpg">
				</li>
			  </ol><!--/ndicators -->
			</div>
 			</div>
 			</div><!--/.row-->
 		    <div class="row">
 		    <div class="col-md-10 col-md-offset-1">	
 		    	<table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>折扣</td>
                        <td>75折</td>
                      </tr>
                      <tr>
                        <td>租金</td>
                        <td>2500元 /天</td>
                      </tr>
                      <tr>
                        <td>手/自排:</td>
                        <td>自排</td>
                      </tr>
                      <tr>
                        <td>乘載人數:</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td>排氣量(c.c.):</td>
                        <td>1,598</td>
                      </tr>              
                    </tbody>
                  </table>
                  <form role="form"  action="<%=request.getContextPath()%>/PlaceOrder.do" method="post">
                  <p><button type="submit" class="btn btn-danger center-block" role="button">我要租</button></p>
 		    	  <input type="hidden" name="detail_com_id" value="${comVO.comID}" />
 		    	  <input type="hidden" name="detail_prod_id" value="" />
 		    	  <input type="hidden" name="action" value="placeOrder" />
 		    	  </form>
 		    </div>
 		    </div>
 		    </div><!-- /.body-->
	</div><!-- /.content-->
  </div>
</div>
<!-- /.商品明細-->

<!-- jQuery Version 1.11.0 -->
<script src="js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>


<script>
// Stop carousel
$('.carousel').carousel({
  interval: false
});
function detailRentCar(){
	
}
detailRentCar();
</script>

