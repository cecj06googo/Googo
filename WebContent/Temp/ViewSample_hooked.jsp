<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.template.model.Prototype_OrderTemp_VO, com.member.model.MemVO, java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<% Prototype_OrderTemp_VO tempVo = (Prototype_OrderTemp_VO)request.getAttribute("tempVo"); %>

<jsp:include page="/_00_fragment/inspectSession.jsp" />

<!-- 此為測試用程式碼，在後端 console 檢查 session 內容物 -->
<%
Enumeration e = request.getSession().getAttributeNames();
while (e.hasMoreElements()){
	System.out.println(e.nextElement());
}
MemVO mem = (MemVO) request.getSession().getAttribute("LoginMemOK");
System.out.println(mem.getMem_id());
System.out.println(request.getRequestURI());
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單頁面</title>
</head>
<body>
<jsp:include page="/_00_fragment/top1.jsp" />

<h2>Current Mem: ${LoginMemOK.mem_id}</h2>

<p>訂單</p>
<form action="<%=request.getContextPath()%>/SimAddOrder" method="post">
	<p>訂購時間: <input type="text" name="ord_time" value="2014-10-20 07:06:32" />${ErrorMsg.errorOrd_time}</p>
	<p>取車日期: <input type="text" name="ord_getday"	value="2014-01-01 14:15:00" />${ErrorMsg.errorOrd_getday}</p>
	<p>還車日期: <input type="text" name="ord_reday" value="2014-03-01 14:35:00" />${ErrorMsg.errorOrd_reday}</p>
	<p>訂單總額: <input type="text" name="item_total" value="3000" />${ErrorMsg.errorItem_total}</p>
	<p>------------------- 訂單明細-------------------</p>
	<p>商品編號: <input type="text" name="prod_id" value="1" />${ErrorMsg.errorProd_id}</p>
	<p>配備編號: <input type="text" name="acc_id" value="1" />${ErrorMsg.errorAcc_id}</p>
	<p>領車人姓名: <input type="text" name="item_name" value="john" />${ErrorMsg.errorItem_name}</p>
	<p>領車人行動電話: <input type="text" name="item_phone"	value="0987654321" />${ErrorMsg.errorPhone}</p>
	<p>${ErrorMsg.errorPT}</p>
	<p>領車人市內電話: <input type="text" name="item_tel" value="" />${ErrorMsg.errorTel}</p>
	<p>領車人e-mail: <input type="text" name="item_email" value="gg@ya.123" />${ErrorMsg.errorEmail}</p>
	<p>商品配備: <textarea name="pritem_acc">stand by for input</textarea></p>
	<p>優惠: <input type="text" name="item_all" value="優惠方案1:租車送塔位" /></p>
	<p>服務廠商id: <input type="text" name="vendor_id" value="1" /></p>
	<input type="hidden" name="action" value="insert"> 
	<p><input type="submit" value="下訂" />${ErrorMsg.errTitle}</p>
	<p><input type="reset" value="恢復" /></p>
	<p>------------------- 帶入店家設計欄位-------------------</p>
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			${tempVo.content}
		</div>
	</div>
</form>
<hr>

<form role="form" action="<%=request.getContextPath()%>/DesignAccessDB" method="post">
	com_id<input type="text" id="com_id_view" name="com_id_form_view" /><br>
	command<input type="text" id="command" name="command" value="retrieve" readonly /><br>
	<input type="submit" /><br>
</form>

<hr>
<input type="button" id="inspectCust" value="inspect cust fields" />

<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<script>
$(document).ready(function(){
	var custFieldArray = $('[id^="custField"]');
	$("#inspectCust").on("click", function(){
		
		if(custFieldArray.length > 0){
			
			var custFieldsBundle = {custFields:[]};
			
			for(i = 0; i < custFieldArray.length; i++){
				
				var fieldObj = {};
				
				var field = $(custFieldArray[i]);
				var fieldType = (field.prop("id")).split("_").slice(2,3)[0];
				var fieldLabel = '';
				var fieldValue = '';
				var fieldValueDescriptionArray = '';
				var fieldValueDescription = '';
				var fieldChecked = '';
				
				if(fieldType == "text"){
					fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label").text();
					fieldValue = field.val();
				}else if(fieldType == "textarea"){
					fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label").text();
					fieldValue = field.val();
				}else if(fieldType == "SelectBasic"){
					fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label").text();
					fieldValue = field.val();
					fieldValueDescription = field.find("option:selected").text();
				}else if(fieldType == "SelectMultiple"){
					fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label").text();
					fieldValue = field.val();
					fieldValueDescriptionArray = field.find("option:selected");
					fieldValueDescription = [];
					if(fieldValueDescriptionArray.length > 0){
						for(j = 0; j < fieldValueDescriptionArray.length; j++){
							fieldValueDescription.push(fieldValueDescriptionArray[j].textContent);
						}
					}
				}else if(fieldType == "checkbox"){
					if(!field.prop("checked")){
						continue;
					}
					fieldChecked = field.prop("checked");
					fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label.control-label").text();
					fieldValue = field.val();
					fieldValueDescription = field.parent().text().trim();
				}else if(fieldType == "radio"){
					if(!field.prop("checked")){
						continue;
					}
					fieldChecked = field.prop("checked");
					fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label.control-label").text();
					fieldValue = field.val();
					fieldValueDescription = field.parent().text().trim();
				}
				
				fieldObj.id = field.prop("id");
				fieldObj.type = fieldType;
				fieldObj.label = fieldLabel;
				fieldObj.value = fieldValue;
				fieldObj.valueDescription = fieldValueDescription;
				
				console.log("ID: " + field.prop("id"));
				console.log("Field Type: " + fieldType);
				console.log("Field Label: " + fieldLabel);
				console.log("Field Value: " + fieldValue);
				console.log("Field Value Description: " + fieldValueDescription);
				console.log("Field Checked: " + fieldChecked);
				console.log("corresponding obj: " + JSON.stringify(fieldObj) + "\n");
				
				custFieldsBundle.custFields.push(fieldObj);
			};// end fields-to-object conversion process
		}else {
			console.log("No customized field detected.");
		}// end if
		
		console.log(JSON.stringify(custFieldsBundle));
		$('textarea[name="pritem_acc"]').text(JSON.stringify(custFieldsBundle));
		
	});// end of event handler
});// end of document ready
</script>

</body>
</html>