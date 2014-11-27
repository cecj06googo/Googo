package com.statistics.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;

import org.json.simple.JSONValue;



public class test {

	public static void main(String[] args) {
		DataDAO dataDAO=new DataDAO();
		List<DordersVO> list=dataDAO.Area(3);
		//1.將訂單明細轉json
		String areaString="";
		try{
		//創陣列	
//		List l1 =new  LinkedList();
		
		//for迴圈 塞map(有key值)資料
		List<Map<String, String>> containerList = new LinkedList<Map<String, String>>();
		for(int i=0;i<list.size();i++){
			DordersVO currentEntryVO=list.get(i);
			String currentEntryDay = currentEntryVO.getOrd_getday();
			Boolean flagNewMap = true;
			
			if(!containerList.isEmpty()){
				
				for(int j=0; j < containerList.size(); j++){
					if(currentEntryDay == containerList.get(j).get("day")){
						//containerList.get(j)
						if(currentEntryVO.getProd_type()==1)
							containerList.get(j).put("car", currentEntryVO.getCountt().toString());
						else if(currentEntryVO.getProd_type()==2) 
							containerList.get(j).put("moto", currentEntryVO.getCountt().toString());
						else if(currentEntryVO.getProd_type()==3) 
							containerList.get(j).put("moto", currentEntryVO.getCountt().toString());
						//same date, put value into this map, set flagNewMap to false
						flagNewMap = false;
						break;
					}
				}
				if(flagNewMap == true){
					//Map jsonEntry = new Map<String, String>();
					//put required data into this map
					Map jsonEntry =new LinkedHashMap();
					jsonEntry.put("period", currentEntryVO.getOrd_getday());
					if(list.get(i).getProd_type()==1)
						jsonEntry.put("car", currentEntryVO.getCountt());
					else if(currentEntryVO.getProd_type()==2) 
						jsonEntry.put("moto", currentEntryVO.getCountt());
					else if(currentEntryVO.getProd_type()==3) 
						jsonEntry.put("moto", currentEntryVO.getCountt());
					containerList.add(jsonEntry);
				}
				//add the created map into containerList
				
			}else{
				//Map jsonEntry = new Map<String, String>();
				//put required data into this map
				//add the created map into containerList
				Map jsonEntry =new LinkedHashMap();
				jsonEntry.put("period", currentEntryVO.getOrd_getday());
				if(currentEntryVO.getProd_type()==1)
					jsonEntry.put("car", currentEntryVO.getCountt());
				else if(currentEntryVO.getProd_type()==2) 
					jsonEntry.put("moto", currentEntryVO.getCountt());
				else if(currentEntryVO.getProd_type()==3) 
					jsonEntry.put("moto", currentEntryVO.getCountt());
				containerList.add(jsonEntry);
				
			}
		}
		//將資料轉成json字串
		areaString=JSONValue.toJSONString(containerList);
		System.out.println(areaString);
		}catch(Exception e){
			//目前遇到沒有訂單資料則會發index out of bounds的Exception
			System.out.println( "抓訂單之Exception");
			//創一空陣列傳給前端
			List ll =new LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("device", "無資料");
			m1.put("geekbench", 0);
			ll.add(m1);
			areaString=JSONValue.toJSONString(ll);
			System.out.println(areaString);
		}
		
		
//		Map m1 =new LinkedHashMap();
//		if(!list.get(i).getOrd_getday().equals(list.get(i-1).getOrd_getday())){
//			m1.put("period", list.get(i).getOrd_getday());
//			if(list.get(i).getProd_type()==1)
//				m1.put("car", list.get(i).getCountt());
//				else if(list.get(i).getProd_type()==2) 
//					m1.put("moto", list.get(i).getCountt());
//				else if(list.get(i).getProd_type()==3) 
//					m1.put("moto", list.get(i).getCountt());
//			if(i+1!=list.size()){
//			if(list.get(i+1).getOrd_getday().equals(list.get(i).getOrd_getday())){
//				if(list.get(i+1).getProd_type()==1)
//					m1.put("car", list.get(i+1).getCountt());
//				else if(list.get(i+1).getProd_type()==2) 
//					m1.put("moto", list.get(i+1).getCountt());
//				else if(list.get(i+1).getProd_type()==3) 
//					m1.put("moto", list.get(i+1).getCountt());
//			}}
//			if(i+2!=list.size()){
//				if(list.get(i+2).getOrd_getday().equals(list.get(i+1).getOrd_getday())){
//					if(list.get(i+2).getProd_type()==1)
//						m1.put("car", list.get(i+2).getCountt());
//					else if(list.get(i+2).getProd_type()==2) 
//						m1.put("moto", list.get(i+2).getCountt());
//					else if(list.get(i+2).getProd_type()==3) 
//						m1.put("moto", list.get(i+2).getCountt());
//			}}
//			l1.add(m1);
//		
//		}else{
//			continue;
//		}
}
	
	
//安泰
//	Map m1 =new LinkedHashMap();
//	m1.put("day", list.get(0).getOrd_getday());
//	if(list.get(0).getOrd_g)
//	m1.put("", list.get(0).getOrd_getday());
}