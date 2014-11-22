/*
dhtmlxScheduler v.4.1.0 Stardard

This software is covered by GPL license. You also can obtain Commercial or Enterprise license to use it in non-GPL project - please contact sales@dhtmlx.com. Usage without proper license is prohibited.

(c) Dinamenta, UAB.
*/
(function(){

var temp_section;
var before;
var beforee;
var contextPath = "<%=request.getContextPath()%>";
scheduler.config.collision_limit = 1;	

function _setTempSection(event_id) { // for custom views (matrix, timeline, units)
	var checked_mode = scheduler._get_section_view();
	if(checked_mode && event_id){
		temp_section = scheduler.getEvent(event_id)[scheduler._get_section_property()];
	}
}

//開lightbox修改
scheduler.attachEvent("onBeforeLightbox",function(id){
	var ev = scheduler.getEvent(id);
	before = [ev.start_date, ev.end_date];
	_setTempSection(id);
	return true;
});
//lightbox save 修改前
scheduler.attachEvent("onEventChanged",function(id){
	if (!id || !scheduler.getEvent(id)) return true;
	var ev = scheduler.getEvent(id);
	
	if (!scheduler.checkCollision(ev)){
		if (!before) return false;
		ev.start_date = before[0];
		ev.end_date = before[1];
		ev._timed=this.isOneDayEvent(ev);
	}
	
	return true;
});
//light box save鍵
scheduler.attachEvent("onEventSave",function(id, edited_ev, is_new){
	edited_ev = scheduler._lame_clone(edited_ev);
	edited_ev.id = id;

	//lightbox may not have 'time' section
	if(!(edited_ev.start_date && edited_ev.end_date)){
		var ev = scheduler.getEvent(id);
		edited_ev.start_date = new Date(ev.start_date);
		edited_ev.end_date = new Date(ev.end_date);
	}

	if(edited_ev.rec_type){
		scheduler._roll_back_dates(edited_ev);
	}
	return scheduler.checkCollision(edited_ev); // in case user creates event on one date but then edited it another
});

//drag前存好訊息

scheduler.attachEvent("onBeforeDrag",function(id){
	var ev = scheduler.getEvent(id);
	ee=scheduler.getEvent(id);
	beforee = [ev.start_date, ev.end_date];
	_setTempSection(id); 
	return true;
});
//dnd前  還沒save
scheduler.attachEvent("onBeforeEventChanged",function(ev,e,is_new){
	//找爸爸的id
	var pre_id=scheduler.getSectionParent(temp_section);
	var new_id=scheduler.getSectionParent(ev.section_id);
	var prod_plate=ev.section_id;
	var item_id =ev.text;
	//爸爸id是否相同
	if(pre_id==new_id){
		ev.start_date = beforee[0];
		ev.end_date = beforee[1];
		//檢查日期是否相撞
		if(scheduler.checkCollision(ev)){
			ajaxCar(item_id,prod_plate);
			return true;
		}else
			return false;
	}else{
		$('#schedulerError').modal('show');
		return false;	
	}
});

//ajax修改訂單之車牌
function ajaxCar(item_id,prod_plate) { 
	//console.log(item_id,prod_plate);
	var xmlHttp = new XMLHttpRequest();
	if(xmlHttp != null){
		var url ="schedulerServlet"; 
		xmlHttp.open("post",url,true); //"get" or "post" ///true為非同步 false為同步運作 
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send("item_id="+item_id+"&prod_plate="+prod_plate); //傳送資料到伺服器
	}else{
		console.log = "失敗!!!你的瀏覽器不支援AJAX";
	}
}
//adds a new event
scheduler.attachEvent("onEventAdded",function(id,ev) {
	
	var result = scheduler.checkCollision(ev);
	if (!result)
		scheduler.deleteEvent(id);
});
scheduler._check_sections_collision = function(first, second){
	var map_to = scheduler._get_section_property();
	if (first[map_to] == second[map_to] && first.id != second.id)
		return true;
	return false;
};


scheduler.checkCollision = function(ev) {
	var evs = [];
	var collision_limit = scheduler.config.collision_limit;

	if (ev.rec_type) {
		var evs_dates = scheduler.getRecDates(ev);
		for(var k=0; k<evs_dates.length; k++) {
			var tevs = scheduler.getEvents(evs_dates[k].start_date, evs_dates[k].end_date);
			for(var j=0; j<tevs.length; j++) { 
				if ((tevs[j].event_pid || tevs[j].id) != ev.id )
					evs.push(tevs[j]);
			}
		}
	} else {
		evs = scheduler.getEvents(ev.start_date, ev.end_date);
		for (var i=0; i<evs.length; i++) {
			if (evs[i].id == ev.id) {
				evs.splice(i,1);
				break;
			}
		}
	}

	var checked_mode = scheduler._get_section_view();
	var map_to = scheduler._get_section_property();
	
	var single = true;
	if (checked_mode) { // custom view
		var count = 0;

		for (var i = 0; i < evs.length; i++){
			if (evs[i].id != ev.id && this._check_sections_collision(evs[i], ev))
				count++;
		}

		if (count >= collision_limit) {

			single = false;
		}
	}
	else {
		if ( evs.length >= collision_limit )
			single = false;
	}
	if (!single) {
		var res = !scheduler.callEvent("onEventCollision",[ev,evs]);
		if (!res) {
			ev[map_to] = temp_section||ev[map_to]; // from _setTempSection for custom views
		}
		return res;
	}
	return single;
	
};

})();
