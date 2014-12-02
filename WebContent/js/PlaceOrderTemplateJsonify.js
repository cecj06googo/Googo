$(document).ready(function(){
	
	// Integrated version of the following jQuery binding
	// $("form").submit(function(){ copy the handler code here })
	$("#inspectCust").on("click", function(){
		
		var custFieldArray = $('[id^="custField"]');
		
		if(custFieldArray.length > 0){
			
			// bundle contains fieldObj(s), each fieldObj holds data of a customized field
			var custFieldsBundle = {custFields:[]};
			var sumUp = 0;
			
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
				}
				// not verified yet
				else if(fieldType == "AdditionalInsuranceName"){
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
				}else if(fieldType == "PreBox"){
					fieldLabel = field.parents("div[data-type=" + fieldType + "]").find("label.control-label").text();
					fieldValue = field.val();
					fieldValueDescription = field.find("option:selected").text();
					sumUp += parseInt(fieldValue);
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
				console.log("Total cost: " + sumUp);
				
				custFieldsBundle.custFields.push(fieldObj);
			};// end fields-to-object conversion process
		}else {
			console.log("No customized field detected.");
		}// end if
		
		console.log(JSON.stringify(custFieldsBundle));
		$('textarea[id="pritem_acc"]').text(JSON.stringify(custFieldsBundle)); // put the converted json object string in upload form for submission 
		
	});// end of event handler
});// end of document ready