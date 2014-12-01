<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	
setInterval("refresh()",3000);


});
function refresh() {
	$.ajax({
			url: "<%=request.getContextPath()%>/ActionCom.do",
			type: "post",
			data: {
				action: "refresh"	
			},
			dataType: "html",
		}).done(function(newOrd){
			$("div[id=newOrd]").text(newOrd);
		});
	}
</script>