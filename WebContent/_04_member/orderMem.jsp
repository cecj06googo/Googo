<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orders.model.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<jsp:include page="/_00_fragment/top1.jsp" />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單管理</title>
</head>
<body>
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
    <!--Search bar-->
        <br>
        <div class="well" >
        <div class="row" >
        <div class="col-lg-12 text-center">
                	<form class="form-inline" role="form" action="<%=request.getContextPath()%>/ActionMem.do" method="post" >
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
							<input type="hidden" name="action" value="selectMem">
                    </form>  
                </div>
                 <c:if test="${not empty ordVO}">
                <a  title="收縮" ><span id="aa">一鍵收縮<i class="glyphicon glyphicon-resize-small"></i></span></a>
            </c:if>
            </div> 
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
         <%@ include file="/_05_company/orderPage.file"%>
		<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th style="text-align: center;">訂單編號</th>
				<th style="text-align: center;">租訂時間</th>
				<th style="text-align: center;">商品名稱</th>
				<th style="text-align: center;">金額</th>
				<th style="text-align: center;">處理狀態</th>
				<th style="text-align: center;">訂單動作</th>
			</tr>
		</thead>
		
			<c:forEach var="ordVO" items="${ordVO}" 
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<tr align='center' valign='middle'>
					<td>${ordVO.ord_id}</td>
					<td><fmt:formatDate value="${ordVO.ord_time}" pattern="yyyy-MM-dd HH:mm:ss" /><br>  
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne${ordVO.ord_id}" id="${ordVO.ord_id}">完整明細</a>     
					</td>
					<td><a href="#">${ordVO.prod_name}</a></td>
					<td><a href="#">${ordVO.item_total}</a></td>
					<td>${ordVO.status_char}</td>
					
					<c:if test="${ordVO.status_char != '未處理'}">
					<td>
						<input class="btn btn-default" type="button" value="取消訂單" disabled >
					</td>
					</c:if>
					
					<c:if test="${ordVO.status_char == '未處理'}">
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActionMem.do" id="deleteForm${ordVO.ord_id}">
							<input class="btn btn-danger" type="button" value="取消訂單 "title="取消訂單" name="deleteForm${ordVO.ord_id}" /> 
							<input type="hidden" name="ord_id" value="${ordVO.ord_id}"/>
							<input type="hidden" name="action" value="cancelMem"/>
							<input type="hidden" name="orderStatus" value="${orderStatusMem}"/>
							<input type="hidden" name="orderTime" value="${orderTimeMem}"/>
						</FORM>
					</td>
					</c:if>
				</tr>
<!--訂單明細位置------------------------------- -->
				<tr>
				<td style="padding:0" colspan="6">
				<div id="collapseOne${ordVO.ord_id}" class="panel-collapse collapse">
                        <div class="panel-body">
                        <div class="col-xs-12">
                     	   <div class="col-xs-6">
                     	   <label>訂車資訊</label><br>
                        	<span>訂單編號: ${ordVO.ord_id}</span><br>
                        	<span>訂購時間: <fmt:formatDate value="${ordVO.ord_time}" pattern="yyyy-MM-dd HH:mm:ss" /></span><br>
                        	<span>取車日期: <fmt:formatDate value="${ordVO.ord_getday}" pattern="yyyy-MM-dd HH:mm:ss" /></span><br>
                        	<span>還車日期: <fmt:formatDate value="${ordVO.ord_reday}" pattern="yyyy-MM-dd HH:mm:ss" /></span><br>
                        	<span>取車地點: ${ordVO.com_address}</span><br>
                        	<br>
                        	</div>
                        	<div class="col-xs-6">
                        	<label>駕駛人資訊</label><br>
                        	<span>連絡人姓名: ${ordVO.item_name  		== null ? "無": ordVO.item_name }</span><br>
                        	<span>連絡人市話: ${ordVO.item_tel 			== null ? "無": ordVO.item_tel }</span><br>
                        	<span>連絡人行動: ${ordVO.item_phone 		== null ? "無": ordVO.item_phone }</span><br>
                        	<span>連絡人信箱: ${ordVO.item_email  		== null ? "無": ordVO.item_email }</span><br>
                        	<br>
                        	<br>
                        	</div>
                        	
                        	<div class="col-xs-6">
                        	<label>其他資訊</label><br>
                        	<span class="pritem_acc">${ordVO.pritem_acc  		== null ? "無": ordVO.pritem_acc }</span>
                        	<br>
                        	<br>
                        	</div>
                        	
                        	<div class="col-xs-6">
                        	<label>商品資訊</label><br>
                        	<span>商家名稱: ${ordVO.com_name}</span><br>
                        	<span>商家e-mail: ${ordVO.com_account}</span><br>
                        	<span>車輛名稱: ${ordVO.prod_name}</span><br>
                        	<span>商品折扣: ${ordVO.prod_disc == null ? "無": ordVO.prod_disc }</span><br>
                        	<span>商品原價: ${ordVO.prod_price}</span><br>
                        	<span>車牌: ${ordVO.prod_plate}</span><br>
							</div>
                        </div>
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
									href="${pageContext.request.contextPath}/ActionMem.do?whichPage=${i}
									&orderStatus=${orderStatusMem}&orderTime=${orderTimeMem}">${i}</a></li>
							</c:if>
							<c:if test="${i != whichPage}">
								<li><a
									href="${pageContext.request.contextPath}/ActionMem.do?whichPage=${i}
									&orderStatus=${orderStatusMem}&orderTime=${orderTimeMem}">${i}</a></li>
							</c:if>
						</c:forEach>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.頁數-->
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
			  	<button class="btn btn-default"  style="background-color:#c0c0c0" data-dismiss="modal" aria-hidden="true">返回</button>
   				<button class="btn btn-danger"  data-dismiss="modal" name="deletecheck">確認</button>
   				
   				
			  </div>
			</div></div></div>
		
		</div>
		</div>
   
        <br>

	</div>
    <!-- /.container -->
   <hr>
   <!-- Footer -->
   <jsp:include page="/_00_fragment/footer.jsp" />

   
    <!-- /.container -->

</body>
<script>
$(document).ready(function(){
	
	console.log("enter retrieval block");
	
	var displayFields = $(".pritem_acc");
	
	for(i = 0; i < displayFields.length; i++){
		
		var displayResult = "";
		var displayField = displayFields[i];
		var entryData = '';
		var type = '';
		var label = '';
		var value = '';
		var valueDescription = '';
		
		if(displayField.textContent.trim().length > 2){
			
			var jsonBundle = $.parseJSON($(displayField).text());
			console.log(jsonBundle);
			
			for(j = 0; j < jsonBundle.custFields.length; j++){
				
				label = jsonBundle.custFields[j]['label'];
				value = jsonBundle.custFields[j]['value'];
				
				if("text" == jsonBundle.custFields[j]['type']){
					entryData = (label + "： " + value + "\n");
				}else if("textarea" == jsonBundle.custFields[j]['type']){
					entryData = (label + "： " + value + "\n");
				}else if("SelectBasic" == jsonBundle.custFields[j]['type']){
					valueDescription = jsonBundle.custFields[j]['valueDescription'];
					entryData = (label + "： " + value + ", " + valueDescription + "\n");
				}else if("SelectMultiple" == jsonBundle.custFields[j]['type']){
					valueDescription = jsonBundle.custFields[j]['valueDescription'];
					entryData = (label + "： " + value + ", " + valueDescription + "\n");
				}else if("checkbox" == jsonBundle.custFields[j]['type']){
					valueDescription = jsonBundle.custFields[j]['valueDescription'];
					entryData = (label + "： " + value + ", " + valueDescription + "\n");
				}else if("radio" == jsonBundle.custFields[j]['type']){
					valueDescription = jsonBundle.custFields[j]['valueDescription'];
					entryData = (label + "： " + value + ", " + valueDescription + "\n");
				}else if("AdditionalInsuranceName" == jsonBundle.custFields[j]['type']){
					entryData = (label + "： " + value + "\n");
				}else if("AdditionalInsurancePhone" == jsonBundle.custFields[j]['type']){
					entryData = (label + "： " + value + "\n");
				}else if("AdditionalInsuranceMail" == jsonBundle.custFields[j]['type']){
					entryData = (label + "： " + value + "\n");
				}else if("AdditionalInsuranceID" == jsonBundle.custFields[j]['type']){
					entryData = (label + "： " + value + "\n");
				}else if("PreSelectBasic" == jsonBundle.custFields[j]['type']){
					valueDescription = jsonBundle.custFields[j]['valueDescription'];
					entryData = (label + "： " + value + "元, " + valueDescription + "\n");
				}else if("PreBox" == jsonBundle.custFields[j]['type']){
					valueDescription = jsonBundle.custFields[j]['valueDescription'];
					entryData = (label + "： " + value + "元, " + valueDescription + "\n");
				}else {
					entryData = '';
				}
				
				console.log(entryData);	
				
				displayResult += (entryData + "<br/>");
			}// end for: process each customized field data
		}// end if: inspect if there is any customized field
		
		$(displayField).empty();
		$(displayField).html(displayResult);
		
	}// end for: process each order
	
});
</script>
<script>
$(document).ready(function(){
	//-----訂單狀態預設改成user選擇---------
	$("select[name^='orderStatus'] option:selected").attr("selected",null);
	$("select[name^='orderStatus'] option[value='${orderStatusMem}']").attr("selected","selected");
	//-----訂單時間預設改成user選擇---------
	$("select[name^='orderTime'] option:selected").attr("selected",null);
	$("select[name^='orderTime'] option[value='${orderTimeMem}']").attr("selected","selected");
	
	// 一鍵收縮
	$("span[id='aa']").click(function() {
		$("div[id^='collapseOne']").collapse({
			toggle:false
		})
		$("div[id^='collapseOne'").collapse('hide');
	});
	// End 一鍵收縮
	
	var formId ;	
	$("input[name^='deleteForm']").click(function() {
		formId = this.name;
		$('#deleteOrder').modal('toggle');
	});
	
	$("button[name='deletecheck']").click(function() {
		document.forms[formId].submit();
	});
});
</script>
</html>