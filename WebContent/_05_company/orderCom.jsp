<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>我的訂單</title>
</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top2.jsp" />
	<jsp:include page="/_00_fragment/css2.jsp" />
	<!-- Page Content -->
	 <div id="wrapper">
	<div id="page-wrapper">
    <div class="container-fluid">

<!--                     <div class="col-lg-4"> -->
        <!-- Page Heading/Breadcrumbs -->
    <!--Search bar-->
        <br>
        <div class="well" >
        <div class="row" >
        <div class="col-lg-12 text-center">
                	<form class="form-inline" role="form" action="<%=request.getContextPath()%>/SelectCom.gg" method="post" >
                      <div class="form-group">
                      <font size="-1" color="#FF0000">${ErrorMsg.errorUser_id}</font>
                           <span style="font-size:20px;">請選擇搜尋條件</span> 
                           <select class="form-control input-lg"  autofocus name="orderStatus" >
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
                       		
                            <select class="form-control input-lg" name="orderTime" >
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
                         <c:if test="${not empty ErrorMsg.ErrOrderStatus}">
                         <font size="-1" color="#FF0000">${ErrorMsg.ErrOrderStatus}</font>
                         <br>
                         </c:if>
                    	 <font size="-1" color="#FF0000">${ErrorMsg.ErrOrderTime}</font>
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
				<th>金額</th>
				<th>處理狀態</th>
<!-- 				會員不能修改訂單狀態， <th>假按鈕</th>這欄要判斷session內登入的是商家才顯示-->
				<th>訂單動作</th>
				<th>取消訂單</th>
			</tr>
		</thead>
		
			<c:forEach var="ordVO" items="${ordVO}">			
				<tr align='center' valign='middle'>
					<td>${ordVO.ord_id}</td>
					<td><fmt:formatDate value="${ordVO.ord_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>汽車</td>
					<td><a href="#">HONDA-Accord進口新登場</a></td>
					<td><a href="#">${ordVO.item_total}</a></td>
					<td>${ordVO.status_char}</td>
<!--td 7 訂單動作 -->
					<c:if test="${ordVO.status_char == '未處理'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/emp/${ordVO.ord_id}" >
							<input class="btn btn-success" type="button" value="接受訂單 "title="接受訂單" name="AcceptForm${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
							<input type="hidden" name="action" value="delete">
						</FORM>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '已出車'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/emp/${ordVO.ord_id}" >
							<input class="btn btn-warning" type="button" value="確認還車 "title="確認還車" name="deleteForm${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
							<input type="hidden" name="action" value="cancel">
						</FORM>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '商家取消' || ordVO.status_char == '會員取消'}">
					<td>
						<input class="btn btn-info" type="button" value="訂單詳情 "title="訂單詳情 " name="ordDetail${ordVO.ord_id}" /> 
						<input type="hidden" name="mem_account${ordVO.ord_id}" value="${ordVO.mem_account}"/>
						<input type="hidden" name="cancel${ordVO.ord_id}" value="${ordVO.ord_cancelTime}"/>
					</td>
					</c:if>
<!--td 8  取消訂單按鈕樣式 -->					
					<c:if test="${ordVO.status_char != '未處理'}">
					<td>
						<input class="btn btn-default" type="submit" value="取消訂單" disabled >
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '未處理'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/cancelCom.gg" id="deleteForm${ordVO.ord_id}">
							<input class="btn btn-danger" type="button" value="取消訂單 "title="取消訂單" name="deleteForm${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}"/>
							<input type="hidden" name="action" value="cancelCom"/>
							<input type="submit" class="hide"  />				
						</FORM>
					</td>
					</c:if>
					
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	
		</div>
	</div>
        <br>
	</div>
    <!-- /.container -->
   <hr>
   <!-- Footer -->
   <jsp:include page="/_00_fragment/footer.jsp" />
    <!-- /.container -->
</div>
</div>
</div>

		<!-- 取消訂單對話框 -->
		 <div id="deleteOrder" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
		  	<div class="modal-content">
			<div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h3>取消訂單</h3>
			</div>
			  <div class="modal-body">
			  	<p>訂單取消的需符合下列條件之一:</p>
			  	<p style="font-weight:bold; font-size: 14pt">1.取車日期前3天以上</p>
			  	<p style="font-weight:bold; font-size: 14pt">2.會員下訂後24小時之內</p>
			    <p>確定要取消此筆訂單嗎?</p>   
			  </div>
			  <div class="modal-footer">
			  	<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
   				<button class="btn btn-danger"  data-dismiss="modal" name="deletecheck">確認</button>
			  </div></div></div></div>
		<!-- /.取消訂單對話框 -->

		<!-- 接受訂單對話框 -->
		 <div id="AcceptOrder" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
		  	<div class="modal-content">
			<div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h3>接受訂單</h3>
			</div>
			  <div class="modal-body">
			    <p style="font-weight:bold; font-size: 14pt">提醒您：已詳閱訂單明細後再作確認</p>
			    <p>確定要接受此筆訂單嗎?</p> 
			  </div>
			  <div class="modal-footer">
			  	<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
   				<button class="btn btn-danger"  data-dismiss="modal" name="Acceptcheck">確認</button>
			  </div></div></div></div>
		<!-- /.接受訂單對話框 -->

		<!-- 訂單詳情對話框 -->
		 <div id="ordDetail" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
		  	<div class="modal-content">
			<div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h3>訂單詳情</h3>
			</div>
			  <div class="modal-body">
			   
			    <p id="memAccount" style="font-weight:bold; font-size: 14pt"></p> 
			    <p id="cancelTime" style="font-weight:bold; font-size: 14pt"></p> 
			    <p style="font-weight:bold; font-size: 14pt">取消了這筆訂單。</p>
			  </div>
			  <div class="modal-footer">
			  	<button class="btn btn-action" data-dismiss="modal" aria-hidden="true">關閉</button>
			  </div></div></div></div>
		<!-- /.訂單詳情對話框 -->


<% 
    request.removeAttribute("ordVO"); // 顯示MsgOK.InsertOK後，就要立刻移除，以免每次回到首 頁都會顯示新增成功的訊息 
 %>

</body>
<script>
$(document).ready(function(){
	var formId;
	var ordId;
	var mem_account;
	var cancelTime;
	//-----取消訂單---------
	$("input[name^='deleteForm']").click(function() {
		formId = this.name;
		$('#deleteOrder').modal('toggle');
	});
	
	$("button[name='deletecheck']").click(function() {
		document.forms[formId].submit();
	});
	//-----接受訂單--------
	$("input[name^='AcceptForm']").click(function() {
		formId = this.name;
		$('#AcceptOrder').modal('toggle');
	});
	
	$("button[name='Acceptcheck']").click(function() {
		document.forms[formId].submit();
	});
	//-----訂單詳情--------
	$("input[name^='ordDetail']").click(function() {
		var ordId = this.name.substring(9);
		mem_account = $("input[name='mem_account"+ ordId +"']").val();
		cancelTime = $("input[name='cancel"+ ordId +"']").val();
		$("p[id='memAccount']").html("會員："+ mem_account);
		$("p[id='cancelTime']").html("於"+ cancelTime.substring(0,19));
		$('#ordDetail').modal('toggle');
	});
	
});
</script>
</html>