<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orders.model.*"%>
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
                	<form class="form-inline" role="form" action="<%=request.getContextPath()%>/ActionCom.do" method="post" >
                      <div class="form-group">
                           <span style="font-size:20px;">請選擇搜尋條件</span> 
                           <select class="form-control input-lg"  autofocus name="orderStatus"  >
                                <option >訂單狀態</option>
                                <option value="0" selected>所有</option>
                                <option value="1">未處理</option>
                                <option value="2">已接受</option>
                                <option value="3">已出車</option>
                                <option value="4">已完成</option>
                                <option value="5">會員取消</option>
								<option value="6">商家取消</option>
								<option value="7">會員逾時</option>
								<option value="8">商家逾時</option>
								<option value="9">異常未還</option>
                            </select>
                        </div>
                        <div class="form-group">
                       		
                            <select class="form-control input-lg" name="orderTime" >
                            	<option >訂購時間</option>
                                <option value="all" selected>所有</option>
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
                         <c:if test="${not empty ErrMsg.ErrOrderStatus}">
                         <font size="-1" color="#FF0000">${ErrMsg.ErrOrderStatus}</font>
                         <br>
                         </c:if>
                    	 <font size="-1" color="#FF0000">${ErrMsg.ErrOrderTime}</font>
                    	 </div>
							<input type="hidden" name="action" value="selectCom">
                    </form> 
                    <c:if test="${not empty ordVO}">
                </div>
                <a  title="收縮" ><span id="aa" >一鍵收縮<i class="glyphicon glyphicon-resize-small"></i></span></a>
            </div>
            </c:if>
        </div>
        <!-- /.Search bar -->
        

        <!-- 訂單搜尋結果 -->
        <div class="row">
    	<div class="col-lg-12">
        <div class="table-responsive">
        <c:if test="${not empty MsgOK}">
        <center style="font-weight:bold; font-size: 14pt">${MsgOK.SearchNull} </center>
        </c:if>
        <c:if test="${not empty ordVO}">
        <%@ include file="orderPage.file"%>

		<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th style="text-align: center;">訂單編號</th>
				<th style="text-align: center;">租訂時間</th>
<!-- 				<th style="text-align: center;">車種</th> -->
				<th style="text-align: center;">商品名稱</th>
				<th style="text-align: center;">金額</th>
				<th style="text-align: center;">處理狀態</th>
				<th colspan="2" style="text-align: center;">訂單動作</th>

			</tr>
		</thead>
		
			<c:forEach var="ordVO" items="${ordVO}" 
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">			
				<tr align='center' valign='middle'>    
					<td>${ordVO.ord_id}</td>
					<td><fmt:formatDate value="${ordVO.ord_time}" pattern="yyyy-MM-dd HH:mm:ss" /><br>  
                    <a class="accordion-toggle" data-toggle="collapse" data-target="#collapseOne${ordVO.ord_id}" data-parent="#accordion"  id="${ordVO.ord_id}">完整明細</a>     
					</td>
<!-- 					<td>汽車</td> -->
					<td><a href="#">${ordVO.prod_name}</a></td>
					<td><a href="#">${ordVO.item_total}</a></td>
					<c:if test="${ordVO.status_char == '異常未還'}">
						<td style="color:red">${ordVO.status_char}</td>
					</c:if>
					<c:if test="${ordVO.status_char != '異常未還'}">
						<td>${ordVO.status_char}</td>
					</c:if>
<!--td 7 訂單正常流程動作按鈕樣式 -->
					<c:if test="${ordVO.status_char == '未處理'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" id="AcceptBtn${ordVO.ord_id}">
							<input class="btn btn-success" type="button" value="接受訂單 "title="接受訂單" name="AcceptBtn${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
							<input type="hidden" name="action" value="accept">
						</FORM>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '已接受'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" id="minusCarBtn${ordVO.ord_id}">
							<input class="btn btn-primary" type="button" value="取車確認 "title="取車確認" name="minusCarBtn${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
							<input type="hidden" name="action" value="minusCar">
						</FORM>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '已出車'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" id="plusCarBtn${ordVO.ord_id}">
							<input class="btn btn-warning" type="button" value="還車確認 "title="還車確認" name="plusCarBtn${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
							<input type="hidden" name="action" value="plusCar">
						</FORM>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '已完成'}">
					<td  colspan="2" >
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" >
							<input class="btn btn-info" type="button" value="訂單詳情 "title="訂單詳情" name="CompleteBtn${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
							<input type="hidden" name="lastuptime${ordVO.ord_id}" value="${ordVO.ord_lastuptime}">
						</FORM>
					</td>
					</c:if>
<!--td 7+8 訂單異常流程動作按鈕樣式 -->
					<c:if test="${ordVO.status_char == '商家取消' || ordVO.status_char == '會員取消'}">
					<td  colspan="2" >
						<input class="btn btn-info" type="button" value="訂單詳情 "title="訂單詳情 " name="userCancelBtn${ordVO.ord_id}" /> 
						<input type="hidden" name="mem_account${ordVO.ord_id}" value="${ordVO.mem_account}"/>
						<input type="hidden" name="lastuptime${ordVO.ord_id}" value="${ordVO.ord_lastuptime}"/>
						<input type="hidden" name="status${ordVO.ord_id}" value="${ordVO.ord_status}"/>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '會員逾時' || ordVO.status_char == '商家逾時'}">
					<td  colspan="2" >
						<input class="btn btn-info" type="button" value="訂單詳情 "title="訂單詳情 " name="userTimeOutBtn${ordVO.ord_id}" /> 
						<input type="hidden" name="mem_account${ordVO.ord_id}" value="${ordVO.mem_account}"/>
						<input type="hidden" name="lastuptime${ordVO.ord_id}" value="${ordVO.ord_lastuptime}"/>
						<input type="hidden" name="status${ordVO.ord_id}" value="${ordVO.ord_status}"/>
						<input type="hidden" name="ord_getday${ordVO.ord_id}" value="${ordVO.ord_getday}"/>
						<input type="hidden" name="ord_time${ordVO.ord_id}" value="${ordVO.ord_time}"/>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '異常未還'}">
					<td  colspan="2" >
						<input class="btn btn-danger" type="button" value="網路報案 "title="網路報案 " name="110Btn${ordVO.ord_id}" /> 	
						<input type="hidden" name="ord_reday${ordVO.ord_id}" value="${ordVO.ord_reday}"/>
						<input type="hidden" name="lastuptime${ordVO.ord_id}" value="${ordVO.ord_lastuptime}"/>
					</td>
					</c:if>
<!--td 8  訂單非正常流程按鈕樣式 -->					
					<c:if test="${ordVO.status_char == '未處理'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" id="cancelBtn${ordVO.ord_id}">
							<input class="btn btn-danger" type="button" value="取消訂單 "title="取消訂單" name="cancelBtn${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}"/>
							<input type="hidden" name="action" value="cancelCom" id="action${ordVO.ord_id}"/>
							<input type="hidden" name="ord_getday${ordVO.ord_id}" value="${ordVO.ord_getday}"/>			
							<input type="hidden" name="ord_time${ordVO.ord_id}" value="${ordVO.ord_time}"/>
						</FORM>
					</td>
					</c:if>

					<c:if test="${ordVO.status_char == '已接受'}">
					<td>
					<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" id="MTOBtn${ordVO.ord_id}">
						<input class="btn btn-danger" type="button" value="逾時未取" title="逾時未取" name="MTOBtn${ordVO.ord_id}">
						<input type="hidden" name="ord_id" value="${ordVO.ord_id}"/>
						<input type="hidden" name="ord_getday${ordVO.ord_id}" value="${ordVO.ord_getday}"/>
						<input type="hidden" name="action" value="MemTimeOut"/>	
					</FORM>
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '已出車'}">
					<td>
					<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionCom.do" id="MNRBtn${ordVO.ord_id}">
						<input class="btn btn-danger" type="button" value="逾時未還" title="逾時未還" name="MNRBtn${ordVO.ord_id}">
						<input type="hidden" name="ord_id" value="${ordVO.ord_id}"/>
						<input type="hidden" name="ord_reday${ordVO.ord_id}" value="${ordVO.ord_reday}"/>
						<input type="hidden" name="action" value="MemNotReturn"/>	
					</FORM>
					</td>
					</c:if>

					
				</tr>
<!--訂單明細位置------------------------------- -->
				<tr>
				<td style="padding:0" colspan="7">
				<div id="collapseOne${ordVO.ord_id}" class="panel-collapse collapse">
                        <div class="panel-body">
                        	<span>訂單編號: ${ordVO.ord_id}</span><br>
                        	
                        	<span>訂購時間: ${ordVO.ord_time}</span><br>
                        	<span>取車日期: ${ordVO.ord_getday}</span><br>
                        	<span>還車日期: ${ordVO.ord_reday}</span><br>
                        	<span>最後修改日期: ${ordVO.ord_lastuptime 	== null ? "無": ordVO.ord_lastuptime }</span><br>
                        	<br>
                        	<span>連絡人姓名: ${ordVO.item_name  		== null ? "無": ordVO.item_name }</span><br>
                        	<span>連絡人市話: ${ordVO.item_tel 			== null ? "無": ordVO.item_tel }</span><br>
                        	<span>連絡人行動: ${ordVO.item_phone 		== null ? "無": ordVO.item_phone }</span><br>
                        	<span>連絡人信箱: ${ordVO.item_email  		== null ? "無": ordVO.item_email }</span><br>
                        	<span>配件名稱: ${ordVO.pritem_acc  		== null ? "無": ordVO.pritem_acc }</span><br>
                        	<span>商家自訂欄位(目前無): ${ordVO.item_all  == null ? "無": ordVO.item_all }</span><br>
                        	<span>會員帳號: ${ordVO.mem_account}</span><br>
                        	<span>商品名稱: ${ordVO.prod_name}</span><br>
                        	<span>車牌: ${ordVO.prod_plate}</span><br>
                        	<span>商品價格: ${ordVO.prod_price}</span><br>
                        	<span>商品折扣: ${ordVO.prod_disc  		== null ? "無": ordVO.prod_disc }</span><br>
                        	<span>配件價格: ${ordVO.acc_price}</span><br>
                        	<span>配件名稱: ${ordVO.acc_detail  		== null ? "無": ordVO.acc_detail }</span><br>
                        </div>
                    </div>
				</td>
				</tr>
<!--/.訂單明細位置------------------------------- -->
			</c:forEach>
			
		</table>
		
		    <!-- 頁數 -->
			<div class="row text-center">
				<div class="col-lg-12">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<c:forEach var="i" begin="1" end="<%=pageNumber%>">
							<c:if test="${i == whichPage}">
								<li class="active"><a
									href="${pageContext.request.contextPath}/ActionCom.do?whichPage=${i}">${i}</a></li>
							</c:if>
							<c:if test="${i != whichPage}">
								<li><a
									href="${pageContext.request.contextPath}/ActionCom.do?whichPage=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.頁數-->

		<br>
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
<!-- </div> -->
	<!-- 綜合對話框(改由jQuery控制內容) -->
	 <div id="ordmodal" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
	  	<div class="modal-content">
		<div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		    <h3 id="hard3"></h3>
		</div>
		  <div class="modal-body">
		  	<p id="modalp1"></p>
		  	<p id="modalp2"></p>
		  	<p id="modalp3"></p>
		    <p id="modalp4"></p>
		    <a href="http://web110.ntpd.gov.tw/#" target="_blank" title="開啟新視窗前往報案台" class="hide"><span><i class="glyphicon glyphicon-earphone"></i>110網路報案</span></a>
		  </div>
		  <div class="modal-footer">
		  	<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" name="close">取消</button>
  				<button class="btn btn-danger"  data-dismiss="modal" name="check">確認</button>
		  </div></div></div></div>
	<!-- /.綜合對話框(改由jQuery控制內容) -->
<% 
    request.removeAttribute("ordVO"); // 顯示MsgOK.InsertOK後，就要立刻移除，以免每次回到首 頁都會顯示新增成功的訊息 
 %>
 <!-- 位置放錯會掛掉(一定要在body內) -->
<jsp:include page="/_05_company/ordComScript.jsp" />
 <!-- /.位置放錯會掛掉 -->
</body>

</html>