<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<!-- 實測結果，include會把上層的.js吃掉，
-----若.js是包在下層的include內，一樣不認得 (*原因不明)
-----問題根源在於jsp背後的編碼內情   -->
<jsp:include page="/_00_fragment/top1.jsp" />
<jsp:include page="/_00_fragment/css.jsp" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- 順序不可動 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/_07_order/order.css" rel="stylesheet">
<title>訂單頁面</title>
<link href="${pageContext.request.contextPath}/_07_order/jquery.datetimepicker.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/_07_order/jquery.datetimepicker.js"></script>
</head>




<body>
	<!-- top1 -->
	

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
<!-- 				在此comVO是用振瑋的VO -->
					台灣大哥大租車 <small>租車小舖</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->
<!-------------- 流程顯示 ------------------>
<div class="stepwizard">
    <div class="stepwizard-row setup-panel">
        <div class="stepwizard-step">
            <a href="#step-1" type="button" class="btn btn-primary" id="circle">1</a>
            <p>訂車資訊</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-2" type="button" class="btn btn-default" id="circle" disabled="disabled">2</a>
            <p>駕駛人資訊</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-3" type="button" class="btn btn-default" id="circle" disabled="disabled">3</a>
            <p>其他資訊</p>
        </div>
    </div>
</div>
<!-------------- /.流程顯示 ---------------->

<form role="form"  action="<%=request.getContextPath()%>/ActionMem.do" method="post">
<input type="hidden" name="action" value="insert" />
<!-------------- 訂單第一頁 ----------------->
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12 div-back div-height">
            <div class="col-xs-6 div-css x-border">
            
            <span class="harder-font">訂車資訊</span>
                
            	<div class="form-group">
                   <label><span class="span-space"></span>商家地址(取車地點)</label>
                   <input maxlength="100" type="text" required="required" class="form-control" placeholder="顯示商家地址" disabled="disabled"/>
                </div>
                
      			<div class="form-group">
                   <label><span class="span-red">*</span>取車日期</label>
<%--                    <input type="image" id="icon-calendar" src="${pageContext.request.contextPath}/img/order/calendar.png"> --%>
				   <input id="showGet"  maxlength="100" type="text" required="required" class="form-control"  placeholder="請選擇取車日期" />
                   <input type="hidden" name="ord_getday" value="" />
                </div>
                <div class="form-group">
                   <label><span class="span-red">*</span>還車日期</label>
                   <input id="showReturn"  maxlength="100" type="text" required="required" class="form-control"  placeholder="請選擇還車日期" />
	               <input type="hidden" name="ord_reday" value="" />
	            </div>
	            <div class="form-group">
                   <label><span class="span-red">*</span>車型</label>
                   <select  type="" required="required" class="form-control" >
                  		<option value="0" selected>讀取VO</option>
                   		<option value="0">aaa</option>
                   </select>
	            </div>
<!-- 	            <div class="form-group"> -->
<!--                    <label><span class="span-red">*</span>還車日期</label> -->
<!--                    <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter Last Name" /> -->
<!-- 	            </div> -->
<!-- 	            <div class="form-group"> -->
<!--                    <label><span class="span-red">*</span>還車日期</label> -->
<!--                    <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter Last Name" /> -->
<!-- 	            </div> -->
<!-- 	            <div class="form-group"> -->
<!--                    <label><span class="span-red">*</span>還車日期</label> -->
<!--                    <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter Last Name" /> -->
<!-- 	            </div> -->

	        </div>  
	        <div class="col-xs-6 x-border div-css ">
	        <p class="p-right">* 必填選項</p>
<!-- 	        放車子圖片 -->
		            	<label>車輛預覽</label><br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>10<br>11<br>12<br>13<br>14<br>15<br>		
		    </div>
		    <div class="col-xs-12 x-border x-center">
		   <span class="span-accept x-border"><input type="checkbox" />駕駛人年齡在25-70歲之間？</span>
		    </div>
		    <div class=" col-xs-12 x-border ">
		    	<button class="btn btn-primary nextBtn btn-lg pull-right" type="button" id="nextOne">下一步</button>
		    </div>
	    </div>
	</div>
<!-------------- /.訂單第一頁 ---------------->

<!-------------- 訂單第二頁 ------------------>
    <div class="row setup-content div-border" id="step-2">
        <div class="col-xs-12 div-back">
            <div class="col-xs-6 div-css">
	            <span class="harder-font">駕駛人資訊</span>
	            <span class="span-accept x-right x-border"><input type="checkbox" />同會員本人</span>
                <div class="form-group x-border">
                    <label class="control-label "><span class="span-red">*</span>姓名</label>
                    <input maxlength="200" type="text" required="required" class="form-control" name="item_name" placeholder="範例:王小明" />
                </div>
                <div class="form-group">
                    <label class="control-label"><span class="span-red">*</span>電子郵箱</label>
                    <input maxlength="200" type="text" required="required" class="form-control" name="item_email" placeholder="請輸入e-mail"  />
                </div>
                <div class="form-group">
                    <label class="control-label"><span class="span-red">*</span>確認郵箱</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="請再次輸入e-mail"  />
                </div>
                <div class="form-group">
                    <label class="control-label"><span class="span-space"></span>連絡電話</label><br>
                    <span class="span-red">*</span>手機<input maxlength="200" type="text" required="required" name="item_phone" placeholder="請輸入手機"  />
                    	市話<input maxlength="200" type="text" required="required" name="item_tel" placeholder="請輸入市話"  />
                </div>          
            </div>
                  	        <div class="col-xs-6 x-border div-css ">
	        <p class="p-right">* 必填選項</p>
<!-- 	        放車子圖片 -->
		            	<label>會員資料預覽</label><br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9<br>10<br>11<br>12<br>13<br>14<br>15<br>		
		    </div>
                 <div class=" col-xs-12 x-border ">
		    	<button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >下一步</button>
		    </div>
        </div>
    </div>
<!-------------- /.訂單第二頁 ---------------->

<!-------------- 訂單第三頁 ------------------>
    <div class="row setup-content div-border" id="step-3">
        <div class="col-xs-12">
            <div class="col-xs-12">
                <h3>其他資訊</h3>
                <button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>
            </div>
        </div>
    </div>
<!-------------- /.訂單第三頁 ---------------->
</form>	
		
		<hr>
		<!-- Footer -->
		<jsp:include page="/_00_fragment/footer.jsp" />

	</div>
	<!-- /.container -->

</body>
<script>
$(document).ready(function () {
// 	http://www.jqueryrain.com/?lnsG0UbP
	var timeChar,oneChar,twoChar,thrChar,fourChar,getTime,reTime;
	$('#showGet').datetimepicker({
		  lang:'zh-TW',
		  format:"Y年m月d日 H:i",
		  minDate:0,
// 		  minTime:0,
		  startDate:0,
		  defaultTime:'11:30',
		  step: 30, //(時距)
		  allowTimes:[
		              '00:00','00:30','01:00','01:30','02:00','02:30','03:00',
		              '03:30','04:00','04:30','05:00','05:30','06:00','06:30',
		              '07:00','07:30','08:00','08:30','09:00','09:30','10:00',
		              '10:30','11:00','11:30','12:00','12:30','13:00','13:30',
		              '14:00','14:30','15:00','15:30','16:00','16:30','17:00',
		              '17:30','18:00','18:30','19:00','19:30','20:00','20:30',
		              '21:00','21:30','22:00','22:30','23:00','23:30'
		             ],
		  onSelectTime:function(GS,$i){
		 	 timeChar = $i.val();
   			 oneChar = timeChar.substring(0,4); // yyyy
   			 twoChar = timeChar.substring(5,7); // mm
   			 thrChar = timeChar.substring(8,10);// dd
   			 fourChar = timeChar.substring(12);  // hh:ss 	
   			 getTime = oneChar + "-" + twoChar + "-" + thrChar + " " + fourChar  + ":00";
		  }
	});
	$('#showReturn').datetimepicker({
		  lang:'zh-TW',
		  format:"Y年m月d日 H:i",
		  minDate:0,
// 		  minTime:0,
		  defaultTime:'16:30',
		  step: 30, //(時距)
		  allowTimes:[
		              '00:00','00:30','01:00','01:30','02:00','02:30','03:00',
		              '03:30','04:00','04:30','05:00','05:30','06:00','06:30',
		              '07:00','07:30','08:00','08:30','09:00','09:30','10:00',
		              '10:30','11:00','11:30','12:00','12:30','13:00','13:30',
		              '14:00','14:30','15:00','15:30','16:00','16:30','17:00',
		              '17:30','18:00','18:30','19:00','19:30','20:00','20:30',
		              '21:00','21:30','22:00','22:30','23:00','23:30'
		             ],
   		  onSelectTime:function(GS,$i){
   			 timeChar = $i.val();
   			 oneChar = timeChar.substring(0,4); // yyyy
   			 twoChar = timeChar.substring(5,7); // mm
   			 thrChar = timeChar.substring(8,10);// dd
   			fourChar = timeChar.substring(12);  // hh:ss 	
   			reTime = oneChar + "-" + twoChar + "-" + thrChar + " " + fourChar  + ":00";
   			
		  } 
	});
	
		$("#nextOne").click(function() {
			$("input[name='ord_getday']").val(getTime);
			$("input[name='ord_reday']").val(reTime);
		});
		
	
//-----------------------------------	
	
    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();
//流程btn發生.click
    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
             curStepBtn = curStep.attr("id"),
             nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
             curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
});
</script>
</html>