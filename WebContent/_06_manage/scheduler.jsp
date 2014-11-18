<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            var elements = [ // original hierarhical array to display
			{key:"NISSAN LAVINA", label:"NISSAN LAVINA", open: true, children: [
				{key:"n1", label:"1051-EE"},
				{key:"n2", label:"1548-AA"},
				{key:"n3", label:"5894-BB"},
			]},
			{key:"MAZDA 3", label:"MAZDA 3", open:true, children: [
				{key:"m1", label:"BB-4654"},
				{key:"m2", label:"BB-7854"},
				{key:"m3", label:"YY-4654"},
				{key:"m4", label:"BB-4666"}
			]},
			{key:"機車", label:"機車", open:true, children: [
                {key:"機車1", label:"AAA-513"},
                {key:"機車2", label:"AAA-514"},
                {key:"機車3", label:"AAA-515"},
                {key:"機車4", label:"AAA-516"},
                {key:"機車5", label:"AAA-517"},
            ]},
			];
            
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
            scheduler.init('scheduler_car',new Date(2014,5,30),"timeline");
            scheduler.parse([
                { start_date: "2014-07-01 09:00", end_date: "2014-07-02 12:00", text:"訂單-12458", section_id:"n1", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 10:00", end_date: "2014-06-30 21:00", text:"訂單-89411", section_id:"n1", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 10:00", end_date: "2014-06-30 14:00", text:"訂單-64168", section_id:"n2", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 16:00", end_date: "2014-07-02 17:00", text:"訂單-46598", section_id:"n3", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},

                { start_date: "2014-06-30 12:00", end_date: "2014-07-02 20:00", text:"訂單-48865", section_id:"m1", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 09:00", end_date: "2014-06-30 18:00", text:"訂單-44864", section_id:"m2", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 16:30", end_date: "2014-07-01 18:00", text:"訂單-46558", section_id:"m3", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 18:30", end_date: "2014-07-01 00:00", text:"訂單-45564", section_id:"m4", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
             
                { start_date: "2014-06-30 12:00", end_date: "2014-07-02 20:00", text:"訂單-48865", section_id:"機車1", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 14:00", end_date: "2014-07-01 08:00", text:"訂單-44864", section_id:"機車2", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 16:30", end_date: "2014-07-01 18:00", text:"訂單-46558", section_id:"機車3", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 18:30", end_date: "2014-07-01 00:00", text:"訂單-45564", section_id:"機車4", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
                { start_date: "2014-06-30 15:30", end_date: "2014-07-01 15:00", text:"訂單-45588", section_id:"機車5", details:"租車人:黃詩芸  <br>連絡電話:0910069696"},
            ],"json");
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
           	<form class="form-inline" role="form">
              <div class="form-group">
                    <select class="form-control input-lg"  autofocus="" >
                        <option>種類</option>  <!--純顯示 不能給user選-->
                        <option>汽車</option>
                        <option>機車</option>
                        <option>腳踏車</option>
                    </select>
                </div>
                 <div class="form-group">
                      <input type="text" class="form-control input-lg" placeholder="請輸入關鍵字">
                 </div>
			<button class="btn btn-default btn-lg" type="submit"><i class="fa fa-search"></i></button>
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
        </div><!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->
<script>
//top2左方功能列選項
$("#scheduler").addClass("active");
</script>
</body>
</html>