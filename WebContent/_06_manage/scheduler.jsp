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
<jsp:include page="/_00_fragment/css2.jsp" />

<title>Goo-go</title>
<script type="text/javascript" charset="utf-8">
        function init() {

            scheduler.locale.labels.timeline_tab = "Timeline";
            scheduler.locale.labels.section_custom="Section";
            scheduler.config.details_on_create=true;
            scheduler.config.details_on_dblclick=true;
            scheduler.config.xml_date="%Y-%m-%d %H:%i";

            
            //車名
            var sections=[
                {key:1, label:"Nissan LAVINA"},
                {key:2, label:"Toyota Yaris"},
                {key:3, label:"Ferrari Miller"},
                {key:4, label:"Mazda 3"}
            ];

            scheduler.createTimelineView({
                name:	"timeline",
                x_unit:	"hour",
                x_date:	"%H:%i",
                x_step:	3,
                x_size: 24,
                x_start: 0,
                x_length: 24,
                y_unit:	sections,
                y_property:	"section_id",
                render:"bar",
                second_scale:{
                    x_unit: "day", // unit which should be used for second scale
                    x_date: "%F %d" // date format which should be used for second scale, "July 01"
                }
            });

            
            //Data loading
            scheduler.config.lightbox.sections=[
                {name:"description", height:20, map_to:"text", type:"textarea" , focus:true},
                {name:"custom", height:23, type:"select", options:sections, map_to:"section_id" },
                {name:"time", height:72, type:"time", map_to:"auto"}
            ];
			//開始時間
            scheduler.init('scheduler_car',new Date(2014,5,30),"timeline");
            scheduler.parse([
                { start_date: "2014-06-30 09:00", end_date: "2014-07-01 12:00", text:"車牌 A-12458", section_id:1},
                { start_date: "2014-06-30 10:00", end_date: "2014-06-30 21:00", text:"車牌 A-89411", section_id:1},
                { start_date: "2014-06-30 10:00", end_date: "2014-07-01 14:00", text:"車牌 A-64168", section_id:1},
                { start_date: "2014-06-30 16:00", end_date: "2014-07-02 17:00", text:"車牌 A-46598", section_id:1},

                { start_date: "2014-06-30 12:00", end_date: "2014-07-02 20:00", text:"車牌 B-48865", section_id:2},
                { start_date: "2014-06-30 14:00", end_date: "2014-06-30 18:00", text:"車牌 B-44864", section_id:2},
                { start_date: "2014-06-30 16:30", end_date: "2014-07-01 18:00", text:"車牌 B-46558", section_id:2},
                { start_date: "2014-06-30 18:30", end_date: "2014-07-01 00:00", text:"車牌 B-45564", section_id:2},

                { start_date: "2014-06-30 08:00", end_date: "2014-07-01 12:00", text:"車牌 C-32421", section_id:3},
                { start_date: "2014-07-01 14:30", end_date: "2014-07-02 16:45", text:"車牌 C-14244", section_id:3},

                { start_date: "2014-07-01 09:20", end_date: "2014-07-01 18:20", text:"車牌 D-52688", section_id:4},
                { start_date: "2014-06-30 11:40", end_date: "2014-06-30 21:30", text:"車牌 D-46588", section_id:4},
                { start_date: "2014-07-01 12:00", end_date: "2014-07-02 18:00", text:"車牌 D-12458", section_id:4}
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
             <h2 class="page-header">車輛狀況<small>scheduler</small> </h2>
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
		<div class="col-md-12" >
		<div id="scheduler_car" class="dhx_cal_container" style='width:1100px; height:800px; border-style:solid;border-color:#CECECE;border-width:1px;'>
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
			<div class="dhx_cal_header" style="font-size:14px;">
			</div>
			<div class="dhx_cal_data" style="font-size:14px;">
			</div>		
		</div>
		</div><!--/.scheduler-->
				
        </div><!--/.row-->
        </div><!-- /.container-fluid -->
    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->
</body>
</html>