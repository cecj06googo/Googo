<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	
	
	$("span[id='aa']").click(function() {
		$("div[id^='collapseOne']").collapse({
			toggle:false
		})
		$("div[id^='collapseOne'").collapse('hide');
	});
  
	
	var ordVO = <%=request.getAttribute("ordVO")%>; //公司地址陣列
	var rowsPerPage = <%=request.getAttribute("rowsPerPage") %>;
	var whichPage= <%=request.getAttribute("whichPage")%>;//此頁第幾頁
	var startIndex=(whichPage-1)*rowsPerPage;//該頁起始筆數
	var endIndex = (whichPage*rowsPerPage-1); //該頁終止筆數

	//-----訂單狀態預設改成user選擇---------
	$("select[name^='orderStatus'] option:selected").attr("selected",null);
	$("select[name^='orderStatus'] option[value='${orderStatus}']").attr("selected","selected");
	//-----訂單時間預設改成user選擇---------
	$("select[name^='orderTime'] option:selected").attr("selected",null);
	$("select[name^='orderTime'] option[value='${orderTime}']").attr("selected","selected");
	//-----對話框初始化---------
	$("input[name*='Btn']").click(function() {
		//恢復被逾時未取更改的按鈕
		if($("button[name='check']").html() == "逾期作廢"){
			$("button[name='check']").html("確認")
		}
		if($("button[name='check']").hasClass("hide")){
			$("button[name='check']").removeClass("hide");
			$("button[name='close']").addClass("btn-success").removeClass("btn-default").removeAttr("style").text("取消");
		}
		if($("button[name='close']").hasClass("hide")){
			$("button[name='close']").removeClass("hide");
		}
		if(!$("a[title='開啟新視窗前往報案台']").hasClass("hide")){
			$("a[title='開啟新視窗前往報案台']").addClass("hide");
		}
		//內文初始
		$("p[id='modalp1']").empty().removeAttr("style");
		$("p[id='modalp2']").empty().removeAttr("style");;
		$("p[id='modalp3']").empty().removeAttr("style");;
		$("p[id='modalp4']").empty().removeAttr("style");;
	});
	//------------訂單動作--------------
	var formId;        //user點選的formID
	var ordId;         //訂單ID
	var statusId;      //訂單狀態ID
	var mem_account;   //該筆訂單的會員帳號
	var ord_time       //訂單下訂時間
	var ord_lastuptime;//訂單最後修改時間
	var ord_getday;    //訂單取車時間
	var ord_reday;     //訂單還車時間
	var nowTime;       //現在時間(user點下去的那一刻)
	var ord_getdayLong //訂單取車日期毫秒數
	var ord_redayLong  //訂單還車日期毫秒數
	var ord_timeLong   //訂單下訂時間毫秒數	
//----------------------td 7--訂單正常流程---------------------
	//-----接受訂單--------
	$("input[name^='AcceptBtn']").click(function() {
		formId = this.name;
		$("h3[id='hard3']").html("接受訂單");
 		$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt","color":"#0099CC"}).html("提醒您：已詳閱訂單明細後再作確認");
 		$("p[id='modalp2']").css("font-size","12pt").html("確定要接受此筆訂單嗎?");
		$('#ordmodal').modal('toggle');
	});
	//-----取車確認--------
	$("input[name^='minusCarBtn']").click(function() {
		formId = this.name;
		$("h3[id='hard3']").html("取車確認");
 		$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt","color":"#0099CC"}).html("提醒您：一經確認就不能再更改");
 		$("p[id='modalp2']").css("font-size","12pt").html("確定已經交車給客戶了嗎?");
		$('#ordmodal').modal('toggle');
	});
	//-----還車確認--------
	$("input[name^='plusCarBtn']").click(function() {
		formId = this.name;
		$("h3[id='hard3']").html("還車確認");
 		$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt","color":"#0099CC"}).html("提醒您：一經確認就不能再更改");
 		$("p[id='modalp2']").css("font-size","12pt").html("確定客戶已經還車了嗎?");
		$('#ordmodal').modal('toggle');
	});
	//-----已完成--------
	$("input[name^='CompleteBtn']").click(function() {
		ordId = this.name.substring(11);
		ord_lastuptime = $("input[name='lastuptime"+ ordId +"']").val();
		$("h3[id='hard3']").html("已完成");
 		$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt"}).html("您已於");
 		$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt","color":"green"}).html(ord_lastuptime.substring(0,19));
 		$("p[id='modalp3']").css({"font-weight":"bold","font-size":"14pt"}).html("手動確認會員還車並完成了這筆訂單。");
 		$("button[name='check']").addClass("hide");
 		$("button[name='close']").removeClass("btn-success").addClass("btn-default").css("background-color","#c0c0c0").text("關閉");
 		$('#ordmodal').modal('toggle');
	});
//----------------------td 8--訂單其他流程---------------------
	//-----取消訂單---------
	$("input[name^='cancelBtn']").click(function() {
		formId = this.name; 
		ordId = this.name.substring(9);
		ord_getday = $("input[name='ord_getday"+ ordId +"']").val();
		ord_time = $("input[name='ord_time"+ ordId +"']").val();
		ord_getdayLong = Date.parse(ord_getday);
		ord_timeLong = Date.parse(ord_time);
		nowTime = new Date().getTime();
		$("h3[id='hard3']").html("取消訂單");
		if((nowTime + 259200000) < ord_getdayLong ){
			//符合取消條件1.取車日期前3天以上
			$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt"}).html("已符合取消條件：<span style='color:green'>取車日期前3天以上</span>");
			$("p[id='modalp2']").css("font-size","12pt").html("確定要取消此筆訂單嗎?");
		}else if (nowTime < (ord_timeLong + 86400000) && nowTime > ord_timeLong){
			//符合取消條件2.會員下訂後24小時之內
			$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt"}).html("已符合取消條件：<span style='color:green'>會員下訂後24小時之內</span>");
			$("p[id='modalp2']").css("font-size","12pt").html("確定要取消此筆訂單嗎?");
		}else if(nowTime > ord_getdayLong){
			//現在時間>取車時間 (商家逾時第二個手動作廢地方)
			$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt","color":"red"}).html("此訂單已超過接受與取消的有效期限");
	 		$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt"}).html("請點選<span style='color:red'>逾期作廢</span>鍵繼續");
			$("button[name='close']").addClass("hide")
			$("button[name='check']").html("逾期作廢");
			$("input[id^='action"+ ordId +"']").attr("value","ComTimeOut");
		}else{
			$("p[id='modalp1']").css({"font-weight":"bold","font-size":"12pt"}).html("訂單取消需符合下列條件之一:");
	 		$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt","color":"red"}).html("1.取車日期前3天以上");
	 		$("p[id='modalp3']").css({"font-weight":"bold","font-size":"14pt","color":"red"}).html("2.會員下訂後24小時之內");
			$("button[name='close']").removeClass("btn-success").addClass("btn-default").css("background-color","#c0c0c0").text("關閉");
			$("button[name='check']").addClass("hide");
		}
		$('#ordmodal').modal('toggle');
	});
	//-----逾時未取---------
	$("input[name^='MTOBtn']").click(function() {
		formId = this.name;
		ordId = this.name.substring(6);
		ord_getday = $("input[name='ord_getday"+ ordId +"']").val();
		$("h3[id='hard3']").html("逾時未取詳情");
 		$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt"}).html("取車日期："+ord_getday.substring(0,19));
 		ord_getdayLong = Date.parse(ord_getday);
 		nowTime = new Date().getTime();
		if(ord_getdayLong > nowTime){
			$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt","color":"red"}).html("不符合逾時未取條件(取車時間<現在)");
	  		$("button[name='check']").addClass("hide");
	  		$("button[name='close']").removeClass("btn-success").addClass("btn-default").css("background-color","#c0c0c0").text("關閉");
		}else{
			$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt","color":"green"}).html("已符合逾時未取條件(取車時間<現在)");
			$("p[id='modalp3']").css({"font-weight":"bold","font-size":"14pt"}).html("請按<span style='color:red'>確認</span>鍵繼續");
			$("button[name='close']").addClass("hide");
		}
		$('#ordmodal').modal('toggle');
	});
	//-----逾時未還---------
	$("input[name^='MNRBtn']").click(function() {
		formId = this.name;
		ordId = this.name.substring(6);
		ord_reday = $("input[name='ord_reday"+ ordId +"']").val();
		$("h3[id='hard3']").html("逾時未還詳情");
 		$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt"}).html("還車日期："+ord_reday.substring(0,19));
 		ord_redayLong = Date.parse(ord_reday);
 		nowTime = new Date().getTime();
		if(ord_redayLong > nowTime){
			$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt","color":"red"}).html("不符合逾時未還條件(還車時間<現在)");
	  		$("button[name='check']").addClass("hide");
	  		$("button[name='close']").removeClass("btn-success").addClass("btn-default").css("background-color","#c0c0c0").text("關閉");
		}else{
			$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt","color":"green"}).html("已符合逾時未還條件(取車時間<現在)");
			$("p[id='modalp3']").css({"font-weight":"bold","font-size":"14pt"}).html("請按<span style='color:red'>確認</span>鍵繼續");
			$("button[name='close']").addClass("hide");
		}
		$('#ordmodal').modal('toggle');
	});
	//-----5會員取消 6商家取消 訂單詳情--------
	$("input[name^='userCancelBtn']").click(function() {
		ordId = this.name.substring(13);
		statusId = $("input[name='status"+ ordId +"']").val();
		ord_lastuptime = $("input[name='lastuptime"+ ordId +"']").val();
		if (statusId == 5){
			$("h3[id='hard3']").html("會員取消詳情");
			mem_account = $("input[name='mem_account"+ ordId +"']").val();
			$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt"}).html("會員：<span style='color:red'>"+ mem_account+"</span>");
	 		$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt"}).html("在：<span style='color:red'>"+ ord_lastuptime.substring(0,19)+"</span");
		}else if (statusId == 6){
			$("h3[id='hard3']").html("商家取消詳情");
	 		$("p[id='modalp1']").css("font-size","14pt").html("您在：");
	 		$("p[id='modalp2']").css({"font-weight":"bold","font-size":"14pt","color":"blue"}).html(ord_lastuptime.substring(0,19));
		}
		$("p[id='modalp3']").css("font-size","12pt").html("取消了這筆訂單。");
		$("button[name='close']").removeClass("btn-success").addClass("btn-default").css("background-color","#c0c0c0").text("關閉");
		$("button[name='check']").addClass("hide");
		$('#ordmodal').modal('toggle');
	});
	//-----7會員逾時 8商家逾時 訂單詳情--------
	$("input[name^='userTimeOutBtn']").click(function() {
		ordId = this.name.substring(14);
		statusId = $("input[name='status"+ ordId +"']").val();
		ord_lastuptime = $("input[name='lastuptime"+ ordId +"']").val();
		ord_getday = $("input[name='ord_getday"+ ordId +"']").val();
		if (statusId == 7){
			$("h3[id='hard3']").html("會員逾時詳情");
			mem_account = $("input[name='mem_account"+ ordId +"']").val();
			$("p[id='modalp1']").css({"font-weight":"bold","font-size":"14pt"}).html("會員：<span style='color:red'>"+ mem_account+"</span>");
	 		$("p[id='modalp2']").html("在取車時間：<span style='color:red'>"+ ord_getday.substring(0,19)+"</span>到期時	並未前來取車。");
	 		$("p[id='modalp3']").html("您在：<span style='color:blue'>"+ord_lastuptime.substring(0,19)+"</span>時手動提交了此筆訂單。");
	 		
		}else if (statusId == 8){
			ord_time = $("input[name='ord_time"+ ordId +"']").val();
			$("h3[id='hard3']").html("商家逾時詳情");
	 		$("p[id='modalp1']").html("您在此訂單下訂日：<span style='color:blue'>"+ ord_time.substring(0,19));
	 		$("p[id='modalp2']").html("到<span style='color:red'>"+ord_getday.substring(0,19)+"</span>取車日期間並未接受此訂單");
	 		$("p[id='modalp3']").html("已在<span style='color:red'>"+ord_lastuptime.substring(0,19)+"</span>作廢了此筆訂單。");
		}
		
		$("button[name='close']").removeClass("btn-success").addClass("btn-default").css("background-color","#c0c0c0").text("關閉");
		$("button[name='check']").addClass("hide");
		$('#ordmodal').modal('toggle');
	});
	//-----9網路報案--------
	$("input[name^='110Btn']").click(function() {
		ordId = this.name.substring(6);
		ord_lastuptime = $("input[name='lastuptime"+ ordId +"']").val();
		ord_reday = $("input[name='ord_reday"+ ordId +"']").val();
		$("h3[id='hard3']").html("網路報案連結");
 		$("p[id='modalp1']").css({"font-weight":"bold","font-size":"12pt"}).html("您已於<span style='color:blue'>"+ord_lastuptime.substring(0,19)+"</span>手動確認");
 		$("p[id='modalp2']").css({"font-weight":"bold","font-size":"12pt"}).html("會員在超過還車日期<span style='color:red'>"+ord_reday.substring(0,19)+"</span>後並未還車");
 		$("p[id='modalp3']").css({"font-weight":"bold","font-size":"12pt"}).html("請盡速透過110電話報警或");
 		$("p[id='modalp4']").css({"font-weight":"bold","font-size":"12pt"}).html("點選連結前往110網路報警台");
 		$("button[name='close']").removeClass("btn-success").addClass("btn-default").css("background-color","#c0c0c0").text("關閉");
		$("button[name='check']").addClass("hide");
		$("a[title='開啟新視窗前往報案台']").removeClass("hide");
 		$('#ordmodal').modal('toggle');
	});
	$("button[name='check']").click(function() {
		document.forms[formId].submit();
	});
});
</script>