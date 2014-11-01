<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<%-- <script src="${pageContext.request.contextPath}/js/test_js/ordersSearch.js"></script> --%>
<script>
$(document).ready(function(){
	var formId ;
	//
	
	$("input[name^='deleteForm']").click(function() {
//		alert(this.name);
		formId = this.name;
//		alert(name);
		$('#deleteOrder').modal('toggle');

	});
	
	$("button[name='deletecheck']").click(function() {
//		alert(this.name);
//		alert(name);
		document.forms[formId].submit();

	});
	
});
</script>

<title>我的訂單</title>
</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />
	<jsp:include page="/_00_fragment/css.jsp" />
	<!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
    <!--Search bar-->
        <br>
        <div class="well" >
        <div class="row" >
        <div class="col-lg-12 text-center">
                	<form class="form-inline" role="form" action="<%=request.getContextPath()%>/Select.gg" method="post" >
                      <div class="form-group">
                      <font size="-1" color="#FF0000">${ErrorMsg.errorUser_id}</font>
                           <span style="font-size:20px;">請選擇搜尋條件</span> 
                           <select class="form-control input-lg"  autofocus name="sel_stus" >
                                <option selected>訂單狀態</option>
                                <option value="0">所有</option>
                                <option value="1">未處理</option>
                                <option value="2">已接受</option>
                                <option value="3">已出車</option>
                                <option value="4">已結單</option>
                                <option value="5">會員取消</option>
								<option value="6">商家取消</option>

                            </select>
                        </div>
                        <div class="form-group">
                       		
                            <select class="form-control input-lg" name="sel_time" >
                            	<option selected>訂購時間</option>
                                <option value="all">所有</option>
								<option value="1W">最近一個禮拜</option>
								<option value="1M">最近一個月</option>
								<option value="3M">最近三個月</option>   
                            </select>
                        </div>
            
                         <div class="form-group input-group">
                               <button class="btn btn-default btn-lg" type="submit"><i class="fa fa-search"></i></button>      	   	 	
                         </div>
                         <br>
                         <div class="form-group input-group">
                         <c:if test="${not empty ErrorMsg.errorSel_stus}">
                         <font size="-1" color="#FF0000">${ErrorMsg.errorSel_stus}</font>
                         <br>
                         </c:if>
                    	 <font size="-1" color="#FF0000">${ErrorMsg.errorSel_time}</font>
                    	 </div>
							<input type="hidden" name="action" value="select">
                    </form> 
                </div>
            </div> 
        </div>
        <!-- /.Search bar -->
        

        <!-- 訂單搜尋結果 -->
        <div class="row">
    	<div class="col-lg-12">
        <div class="table-responsive">
        
        
        <c:if test="${not empty ordVO}">
		<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th>訂單編號</th>
				<th>租訂時間</th>
				<th>車種</th>
				<th>商品名稱</th>
				<th>訂單金額</th>
				<th>處理狀態</th>
<!-- 				會員不能修改訂單狀態， <th>假按鈕</th>這欄要判斷session內登入的是商家才顯示-->
				<th>取消訂單</th>
			</tr>
		</thead>
		
			<c:forEach var="ordVO" items="${ordVO}">
				<tr align='center' valign='middle'>
					<td>${ordVO.ord_id}</td>
					<td>${ordVO.ord_time}</td>
					<td>汽車</td>
					<td><a href="#">HONDA-Accord進口新登場</a></td>
					<td><a href="#">${ordVO.item_total}</a></td>
					<td>${ordVO.status_char}</td>
					
					<c:if test="${ordVO.status_char != '未處理'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/emp/${ordVO.ord_id}" >
							<input class="btn btn-default" type="submit" value="取消訂單" disabled >
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
							<input type="hidden" name="action" value="delete">
						</FORM>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '未處理'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/Delete.gg" id="deleteForm${ordVO.ord_id}">
							<input class="btn btn-danger" type="button" value="取消訂單 "title="取消訂單" name="deleteForm${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}"/>
							<input type="hidden" name="action" value="delete"/>
							<input type="submit" class="hide"  />
							
											
						</FORM>
					</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
<!-- 取消訂單對話框 -->
		 <div id="deleteOrder" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
		  	<div class="modal-content">
			<div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h3>取消訂單</h3>
			</div>
			  <div class="modal-body">
			    <p>確定要取消訂單嗎？</p>
			  </div>
			  <div class="modal-footer">
			  	<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
   				<button class="btn btn-danger"  data-dismiss="modal" name="deletecheck">確認</button>
   				
   				
			  </div>
			</div></div></div>
		<!-- /取消訂單對話框  -->
        
<!--         <table class="table table-bordered table-hover table-condensed"> -->
<!--         <thead> -->
<!-- 	         <tr> -->
<!-- 			    <th></th> -->
<!-- 			    <th>訂單編號</th> -->
<!-- 			    <th>租訂時間</th> -->
<!-- 			    <th>車種</th> -->
<!-- 			    <th>商品名稱</th> -->
<!-- 			    <th>訂單金額</th> -->
<!-- 			    <th>處理狀態</th> -->
<!-- 	         </tr> -->
<!-- 		</thead> -->
<!--         <tbody> -->
<!--         	<tr> -->
<!-- 		        <td>1</td> -->
<!-- 		        訂單明細連結 -->
<!-- 		        <td>20140601009243<br><a href="#myModal"  data-toggle="modal" data-target="#myModal">看完整內容</a></td> -->
<!-- 		        /訂單明細連結  -->
<!-- 		        <td>2014/06/01 19:22:59</td> -->
<!-- 		        <td>汽車</td> -->
<!-- 		        商品明細連結 -->
<!-- 		        <td><a href="#">TOYOTA-超大YARIS玩超大</a></td> -->
<!-- 		        /商品明細連結 -->
<!-- 		        金額小計 -->
<!-- 		        <td><a href="#" data-toggle="modal" data-target="#myModal3">2500</a></td> -->
<!-- 		        /金額小計 -->
<!-- 		        取消訂單btn需有條件顯示 -->
<!-- 		        <td>未處理<a href="#" role="button" class="glyphicon  glyphicon-remove"  data-toggle="modal" data-target="#myModal2" title="取消訂單"><a></td> -->
<!-- 		        /取消訂單btn需有條件顯示 -->
<!--         	</tr> -->
        
<!--         	<tr> -->
<!-- 	        	<td>2</td> -->
<!-- 		        訂單明細連結 -->
<!-- 		        <td>20140821022333<br><a href="#myModal"  data-toggle="modal" data-target="#myModal">看完整內容</a></td> -->
<!-- 		        /訂單明細連結  -->
<!-- 		        <td>2014/08/21 14:27:08</td> -->
<!-- 		        <td>汽車</td> -->
<!-- 		        商品明細連結 -->
<!-- 		        <td><a href="#">HONDA-Accord進口新登場</a></td> -->
<!-- 		        /商品明細連結 -->
<!-- 		        金額小計 -->
<!-- 		        <td><a href="#" data-toggle="modal" data-target="#myModal3">3200</a></td> -->
<!-- 		        /金額小計 -->
<!-- 		        取消訂單btn需有條件顯示 -->
<!-- 		        <td>已接受<a href="#" role="button" class="glyphicon  glyphicon-remove" data-toggle="modal" data-target="#myModal2"  title="取消訂單"></a></td> -->
<!-- 		        /取消訂單btn需有條件顯示 -->
<!--       		</tr> -->

<!--  			<tr> -->
<!-- 		        <td>3</td> -->
<!-- 		        訂單明細連結 -->
<!-- 		        <td>20140905000954<br><a href="#"  data-toggle="modal" data-target="#myModal">看完整內容</a></td> -->
<!-- 		        /訂單明細連結  -->
<!-- 		        <td>2014/09/05 06:52:21</td> -->
<!-- 		        <td>汽車</td> -->
<!-- 		        商品明細連結 -->
<!-- 		        <td><a href="#">Ford-Focus</a></td> -->
<!-- 		        /商品明細連結 -->
<!-- 		        金額小計 -->
<!-- 		        <td><a href="#" data-toggle="modal" data-target="#myModal3">5200</a></td> -->
<!-- 		        /金額小計 -->
<!-- 		        取消訂單btn需有條件顯示 -->
<!-- 		        <td>已結單</td> -->
<!-- 		        /取消訂單btn需有條件顯示 -->
<!-- 	        </tr> -->
<!--         </tbody> -->
<!--         </table> -->
		</div>
		</div>
<!-- 		<!-- 訂單搜尋結果 --> 
<!-- 		<br> -->
<!-- 		<!-- 頁數 --> 
<!--         <div class="row text-center"> -->
<!--             <div class="col-lg-12"> -->
<!--                 <ul class="pagination"> -->
<!--                     <li> -->
<!--                         <a href="#">&laquo;</a> -->
<!--                     </li> -->
<!--                     <li class="active"> -->
<!--                         <a href="#">1</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">2</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">3</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">4</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">5</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">&raquo;</a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--         </div> -->
<!--         </div> -->
<!--         /.頁數 -->
		
<!-- 		<!-- 金額小計對話框 --> 
<!-- 		 <div id="myModal3" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 		 <div class="modal-dialog"> -->
<!-- 		  	<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
<!-- 			    <h3>小計</h3> -->
<!-- 			</div> -->
<!-- 			  <div class="modal-body"> -->
<!-- 			    <p>主商品.................2000</p> -->
<!-- 			    <p>配備.........+..........500</p> -->
<!-- 			    <p>---------------------------</p> -->
<!-- 			    <p>小計...................2500</p> -->
<!-- 			    <br> -->
<!-- 			    <p>優惠.........-............0</p> -->
<!-- 			    <p>---------------------------</p> -->
<!-- 			    <p>總金額.......=.........2500</p> -->
<!-- 			  </div> -->
<!-- 			  <div class="modal-footer"> -->
<!-- 			  	<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">關閉</button> -->
<!-- 			  </div> -->
<!-- 			</div></div></div> -->
<!-- 		<!-- /金額小計對話框  --> 
		
		
		
		<!-- 訂單明細對話框 --><!--顯示位置要再研究做調整-->
        <!-- class 不要加hide 會無法正常顯示 -->
<!--         <div id="myModal" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!--            <div class="modal-dialog"> -->
<!-- 		  	<div class="modal-content"> -->
<!-- 			<div class="modal-header">     -->
<!--     			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
<!--                 <h4 id="myModalLabel">訂單編號：20140601009243 <br> 租訂時間：2014/06/01 19:22:59</h4> -->
<!--             </div> -->
<!--             <div class="modal-body"> -->
<!--                 <table class="table table-bordered table-hover table-condensed"> -->
<!--                     <tr><th>商家名稱</th><td><a href="#">拉拉租車</a></td></tr> -->
<!--                     <tr><th>取車地點</th><td>台北市信義區</td></tr> google地圖連結? -->
<!--                     <tr><th>取車日期</th><td>2014/10/11 14:30:00</td></tr> -->
<!--                     <tr><th>還車日期</th><td>2014/10/13 12:30:00</td></tr> -->
<!--                     <tr><th>車種</th><td>汽車</td></tr> -->
<!--                     <tr><th>配備</th><td>三支雨傘</td></tr> -->
<!--                     <tr><th></th><td></td></tr> -->
<!--                     <tr><th>領車人姓名</th><td>王小明</td></tr> -->
<!--                     <tr><th>行動電話</th><td>0987654321</td></tr> -->
<!--                     <tr><th>室內電話</th><td>0223456789</td></tr> -->
<!--                     <tr><th>e-mail</th><td>aa@mail.aa123</td></tr> -->
<!--                 </table>                 -->
<!--             </div> -->
<!--             <div class="modal-footer"> -->
<!--                 <button class="btn btn-primary" data-dismiss="modal">關閉</button> -->
<!--             </div> -->
<!--             </div></div></div> -->
        <!-- /訂單明細對話框 -->       
        <br>
        <!-- Footer -->
<!--         <footer> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <p>Copyright &copy; Your Website 2014</p> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </footer> -->
	</div>
    <!-- /.container -->
   <hr>
   <!-- Footer -->
   <jsp:include page="/_00_fragment/footer.jsp" />

   
    <!-- /.container -->
</div>

</body>

</html>