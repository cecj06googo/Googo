<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
String jsonString = (String)request.getAttribute("jsonString");
String elements = (String)request.getAttribute("elements");
%>
<c:set value="<%= elements %>" var="elements" />
<c:set value="<%= jsonString %>" var="jsonString" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dhtmlxscheduler.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dhtmlxscheduler.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dhtmlxscheduler_timeline.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dhtmlxscheduler_minical.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dhtmlxscheduler_treetimeline.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dhtmlxscheduler_collision.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dhtmlxscheduler_readonly.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dhtmlxscheduler_tooltip.js"></script>
<jsp:include page="/_00_fragment/css2.jsp" />

<title>Goo-go</title>

<script type="text/javascript" charset="utf-8">
        function init() {

            scheduler.locale.labels.timeline_tab = "Timeline";
            scheduler.locale.labels.section_custom="Section";
            scheduler.config.xml_date="%Y-%m-%d %H:%i";
            scheduler.config.drag_resize=false;
            scheduler.config.drag_create=false;
            scheduler.config.dblclick_create=false;
            scheduler.config.readonly_form = true;
         
            //===============
			// Tooltip related code
			//===============

			// we want to save "dhx_cal_data" div in a variable to limit look ups
			var scheduler_container = document.getElementById("scheduler_car");
			var scheduler_container_divs = scheduler_container.getElementsByTagName("div");
			var dhx_cal_data = scheduler_container_divs[scheduler_container_divs.length-1];

			var contextPath = "<%=request.getContextPath()%>";

			// while target has parent node and we haven't reached dhx_cal_data
			// we can keep checking if it is timeline section
			scheduler.dhtmlXTooltip.isTooltipTarget = function(target) {
				while (target.parentNode && target != dhx_cal_data) {
					var css = target.className.split(" ")[0];
					// if we are over matrix cell or tooltip itself
					if (css == "dhx_matrix_scell" || css == "dhtmlXTooltip") {
						return { classname: css };
					}
					target = target.parentNode;
				}
				return false;
			};
			
			scheduler.attachEvent("onMouseMove", function(id, e) {
				var timeline_view = scheduler.matrix[scheduler.getState().mode];

				// if we are over event then we can immediately return
				// or if we are not on timeline view
				if (id || !timeline_view) {
					return;
				}

				// native mouse event
				e = e||window.event;
				var target = e.target||e.srcElement;

				var tooltip = scheduler.dhtmlXTooltip;
				var tooltipTarget = tooltip.isTooltipTarget(target);
				if (tooltipTarget) {
					if (tooltipTarget.classname == "dhx_matrix_scell") {
						// we are over cell, need to get what cell it is and display tooltip
						var section_id = scheduler.getActionData(e).section;
						var section = timeline_view.y_unit[timeline_view.order[section_id]];

						// showing tooltip itself
						var text = "Tooltip for <b>"+section.label+"</b>";
						tooltip.delay(tooltip.show, tooltip, [e, text]);
					}
					if (tooltipTarget.classname == "dhtmlXTooltip") {
						dhtmlxTooltip.delay(tooltip.show, tooltip, [e, tooltip.tooltip.innerHTML]);
					}
				}
			});
            
  
            //車名
            var elements = <%= elements %>;
       /*     var elements = [ // original hierarhical array to display
			{key:"Fighter150", label:"Fighter150", open: true, children: [
				{key:"5684-XX", label:"5684-XX"},
				{key:"1369-AA", label:"1369-AA"},
				{key:"2989-BB", label:"2989-BB"},
				{key:"9856-AA", label:"9856-AA"},
				{key:"8795-FF", label:"8795-FF"},
				{key:"CC-8856", label:"CC-8856"},
			]},
			{key:"法拉利211", label:"法拉利211", open:true, children: [
				{key:"FF-2344", label:"FF-2344"},
				{key:"EE-7898", label:"EE-7898"},
				{key:"AA-1568", label:"AA-1568"},
				{key:"8562-BB", label:"8562-BB"}
			]},
			{key:"保時捷-T1", label:"保時捷-T1", open:true, children: [
                {key:"7759-BB", label:"7759-BB"},
                {key:"5659-AA", label:"5659-AA"},
                {key:"8526-QQ", label:"8526-QQ"},
                {key:"YY-2162", label:"YY-2162"},
                {key:"CC-0619", label:"CC-0619"},
                {key:"HH-3213", label:"HH-3213"},
            ]},
            {key:"野狼125", label:"野狼125", open:true, children: [
                 {key:"7989-BB", label:"7989-BB"},
            ]},
             {key:"賓士320", label:"賓士320", open:true, children: [
                 {key:"7761-EE", label:"7761-EE"},
                 {key:"1591-EE", label:"1591-EE"},
                 {key:"2068-EE", label:"2068-EE"},
                 {key:"YY-2162", label:"YY-2162"},
                 {key:"CC-0619", label:"CC-0619"},
                 {key:"HH-3213", label:"HH-3213"},
            ]},
            {key:"競戰150", label:"競戰150", open:true, children: [
                 {key:"7569-BB", label:"7569-BB"},
            ]},
			];*/
            
            scheduler.createTimelineView({
            	section_autoheight: false,
                name:	"timeline",
                x_unit:	"hour",
                x_date:	"%H:%i",
                //顯示幾個日期
                x_step:	3,
                x_size: 24,
                x_start: 0,
                x_length:24,
                y_unit:	elements,
                y_property:	"section_id",
                render: "tree",
    			folder_dy:20,
    			dy:30,
                second_scale:{
                    x_unit: "day", // unit which should be used for second scale
                    x_date: "%F %d" // date format which should be used for second scale, "July 01"
                }
            });
            
            //Data loading
            scheduler.locale.labels.section_time = "訂單時間 &nbsp;";
            scheduler.locale.labels.section_description = "訂單編號 ";
            scheduler.locale.labels.section_details = "訂車人資訊 ";
            scheduler.locale.labels.section_custom = "車牌號碼 ";
            scheduler.config.lightbox.sections=[	                                               
			{name:"time", height:36, type:"time",time_format:["%Y","%m","%d","%H:%i"]},
			{name:"details", height:50, map_to:"details", type:"textarea"},
			{name:"custom", height:23, type:"timeline", options:null , map_to:"section_id"}, //type should be the same as name of the tab
			];

            
			//開始時間
            scheduler.init('scheduler_car',new Date(),"timeline");
			var jsonString= <%= jsonString %>;
            scheduler.parse(jsonString,"json");
        }
        function show_minical(){
            if (scheduler.isCalendarVisible()){
                scheduler.destroyCalendar();
            } else {
                scheduler.renderCalendar({
                    position:"dhx_minical_icon",
                    date:scheduler._date,
                    navigation:true,
                    handler:function(date,calendar){
                        scheduler.setCurrentView(date);
                        scheduler.destroyCalendar()
                    }
                });
            }
        }
        
    </script>
</head>
<body onload="init();">
 <div id="wrapper">
	<!-- top2 -->
	<jsp:include page="/_00_fragment/top2.jsp" />
	<!-- page-wrapper -->
    <div id="page-wrapper">
	<!-- container-fluid -->
    <div class="container-fluid">
    <!--row-->
    <div class="row">
     	<!--標頭-->
         <div class="col-lg-12">
             <h2 class="page-header"><i class="fa fa-calendar"></i> 車輛調度      <small>scheduler</small> </h2>
         </div><!--/.標頭-->
         <!--條件搜尋-->
         <div class="col-md-10 text-center">
	     <div class="row" >
           	<form class="form-inline" role="form" name="searchCar" id="searchCar" action="<%=request.getContextPath()%>/schedulerSearchCar" method="post">
              <div class="form-group">
                    <select class="form-control input-lg"  name="prod_type" >
                        <option>交通工具</option>  <!--純顯示 不能給user選-->
                        <option value="1">汽車</option>
                        <option value="2">機車</option>
                        <option value="3">腳踏車</option>
                    </select>
                </div>
                 <div class="form-group">
                      <input type="text" class="form-control input-lg" name="keySearch" placeholder="請輸入車輛名稱">
                 </div>
			<button class="btn btn-default btn-lg" type="submit"><i class="fa fa-search"></i></button>
			<div><Font color="red">${ErrMsg}</Font></div>
            </form><br>
        </div> 
        </div><!--/.條件搜尋-->
        <!--scheduler-->
		<div class="col-md-12">
		<div id="scheduler_car" class="dhx_cal_container" style='width:1100px; height:500px; border-style:solid;border-color:#CECECE;border-width:1px;'>
			<div class="dhx_cal_navline">
		
				<div class="dhx_cal_prev_button">&nbsp;</div>
				<div class="dhx_cal_next_button">&nbsp;</div>
				<div class="dhx_cal_today_button" style="font-size:14px;"></div>
				<div class="dhx_minical_icon" id="dhx_minical_icon" onclick="show_minical()">&nbsp;</div>
				<div class="dhx_cal_date" ></div>
		        <div class="dhx_cal_tab" name="day_tab" style="right:204px;font-size:14px;"></div>
				<div class="dhx_cal_tab" name="week_tab" style="right:140px;font-size:14px;"></div>
				<div class="dhx_cal_tab" name="timeline_tab" style="right:280px;font-size:14px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:76px;font-size:14px;"></div>
			</div>
			<div class="dhx_cal_header" style="font-size:15px;">
			</div>
			<div class="dhx_cal_data" style="font-size:14px;">
			</div>		
		</div>
		</div><!--/.scheduler-->
				
        </div><!--/.row-->
        
        <div id="schedulerConfirm" class="modal fade" role="dialog" aria-labelledby="schedulerConfirm" aria-hidden="true">
		<div class="modal-dialog modal-sm">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		    <h3 class="modal-title">車輛調度 <small>scheduler</small></h3>
		</div>
	    <div class="modal-body">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h4>確定要將調度此訂單之車輛嗎?</h4><br>
			    <button type="button" class="btn btn-lg btn-danger pull-right">確認</button>
		        <button type="button" class="btn btn-lg btn-success pull-left" data-dismiss="modal">取消</button>
		    </div>
			</div>
		</div>
		</div>	
		</div>
		</div>
        
        <div id="schedulerError" class="modal fade" role="dialog" aria-labelledby="schedulerConfirm" aria-hidden="true">
		<div class="modal-dialog modal-sm">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		    <h3 class="modal-title"><i class="fa fa-ban"></i>禁止不同種之車輛調度 </h3>
		</div>
	    <div class="modal-body">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h4>如欲更改車輛種類，</h4>
				<h4>請聯絡租車人並於訂單管理更改!</h4><br>
				<p><a href="#" class="btn btn-danger center-block" role="button" data-dismiss="modal">確認</a></p>
		    </div>
			</div>
		</div>
		</div>	
		</div>
		</div>
        
        
        
        </div><!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->
<script>
//top2左方功能列選項
$("#scheduler").addClass("active");

</script>
</body>
</html>