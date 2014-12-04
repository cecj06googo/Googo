var subtotalObj = {

	names: [],
	prices: [],
	mainProductName: "",
	mainProductCost: "",
	total: 0,
	
	resetEntry: function(){
		subtotalObj.names = [];
		subtotalObj.prices = [];
	},
	
	refreshDetail: function(){
		$("#subtotal").empty();
		for(i = 0; i < subtotalObj.names.length; i++){
			$("<p></p>").text(subtotalObj.names[i] + ", " + subtotalObj.prices[i] + "元").appendTo("#subtotal");
		}
		$("<p></p>").text(subtotalObj.mainProductName + ", " + subtotalObj.mainProductCost + "元").appendTo("#subtotal");
		$("<p></p>").text("總價： " + subtotalObj.total + "元").appendTo("#subtotal");
	},
	
	pushEntry: function(field){
		subtotalObj.names.push(field.find("option:selected").text());
		subtotalObj.prices.push(field.val());
	}

}

function PackingAndSumup (){
	
	var custFieldArray = $('[id^="custField"]');
	
	var sumUp = 0;
	var mainProductCost = 0;
	
	if(custFieldArray.length > 0){
		
		// bundle contains fieldObj(s), each fieldObj holds data of a customized field
		var custFieldsBundle = {custFields:[]};
		subtotalObj.resetEntry();
		
		// one by one, convert customized field data into json format data and store them into fieldObj
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
			}else if(fieldType == "AdditionalInsuranceName"){
				fieldLabel = field.parents("div[data-type=" + fieldType.substr(0,19) + "]").find("label[for$='AdditionalInsuranceName']").text();
				fieldValue = field.val();
			}else if(fieldType == "AdditionalInsurancePhone"){
				fieldLabel = field.parents("div[data-type=" + fieldType.substr(0,19) + "]").find("label[for$='AdditionalInsurancePhone']").text();
				fieldValue = field.val();
			}else if(fieldType == "AdditionalInsuranceMail"){
				fieldLabel = field.parents("div[data-type=" + fieldType.substr(0,19) + "]").find("label[for$='AdditionalInsuranceMail']").text();
				fieldValue = field.val();
			}else if(fieldType == "AdditionalInsuranceID"){
				fieldLabel = field.parents("div[data-type=" + fieldType.substr(0,19) + "]").find("label[for$='AdditionalInsuranceID']").text();
				fieldValue = field.val();
			}else if(fieldType == "PreSelectBasic"){
				fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label.control-label").text();
				fieldValue = field.val();
				fieldValueDescription = field.find("option:selected").text();
				sumUp += parseInt(fieldValue);
				$(field).unbind().bind("change", PackingAndSumup);
				
				if(parseInt(field.val()) > 0){
					subtotalObj.pushEntry(field);
				}
				
			}else if(fieldType == "PreBox"){
				fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label.control-label").text();
				fieldValue = field.val();
				fieldValueDescription = field.find("option:selected").text();
				sumUp += parseInt(fieldValue);
				$(field).unbind().bind("change", PackingAndSumup);
				
				if(parseInt(field.val()) > 0){
					subtotalObj.pushEntry(field);
				}
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
	
	mainProductCost = parseInt($("input[name=prodPrice]").val());
	mainProductName = $("#carType").find("option:selected").text();
	sumUp += mainProductCost;
	$("input[name='item_total']").val(sumUp);
	console.log("Total cost: " + sumUp);
	
	subtotalObj.total = sumUp;
	var mainProduct = $("#carType");
	subtotalObj.mainProductCost = mainProductCost;
	subtotalObj.mainProductName = mainProductName;
	subtotalObj.refreshDetail();
	
	console.log(JSON.stringify(custFieldsBundle));
	$('textarea[id="pritem_acc"]').text(JSON.stringify(custFieldsBundle)); // put the converted json object string in upload form for submission
};

$(document).ready(function(){
	
	// Integrated version of the following jQuery binding
	// $("form").submit(function(){ copy the handler code here })
	
	// $("#inspectCust").on("click", PackingAndSumup);
	$("form").submit(PackingAndSumup);
	
});// end of document ready