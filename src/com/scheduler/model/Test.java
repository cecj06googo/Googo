package com.scheduler.model;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.products.model.ProductVO;





public class Test {

	public static void main(String[] args) {
		int com_id = 3;
		SchedulerDAO schedulerDAO=new SchedulerDAO();
		List<SchedulerVO> list = schedulerDAO.getAllCarPlate(com_id);
		String jsonString="";
		List l1 =new  LinkedList();
		Map m3 =new LinkedHashMap();
		m3.put("key", list.get(0).getProd_name());
		m3.put("label", list.get(0).getProd_name());
		m3.put("open", true);
		List l3 =new  LinkedList();
			for(int j=0;j<list.size();j++){if(list.get(j).getProd_name().equals(list.get(j+1).getProd_name())){
				Map m4 =new LinkedHashMap();
				m4.put("key", list.get(j).getProd_plate());
				m4.put("label", list.get(j).getProd_plate());
				l3.add(m4);
				}
				else {
					Map m4 =new LinkedHashMap();
					m4.put("key", list.get(j).getProd_plate());
					m4.put("label", list.get(j).getProd_plate());
					l3.add(m4);
					break;
				}
			}
		m3.put("children",l3);
		l1.add(m3);
		for(int i=1;i<list.size();i++){
			if(!list.get(i).getProd_name().equals(list.get(i-1).getProd_name())){
			Map m1 =new LinkedHashMap();
			m1.put("key", list.get(i).getProd_name());
			m1.put("label", list.get(i).getProd_name());
			m1.put("open", true);
			List l2 =new LinkedList();
			for(int j=i;j<list.size();j++){
				if(j+1==list.size()){
					Map m2 =new LinkedHashMap();
					m2.put("key", list.get(j).getProd_plate());
					m2.put("label", list.get(j).getProd_plate());
					l2.add(m2);
				}
				else if(list.get(j).getProd_name().equals(list.get(j+1).getProd_name())){
				Map m2 =new LinkedHashMap();
				m2.put("key", list.get(j).getProd_plate());
				m2.put("label", list.get(j).getProd_plate());
				l2.add(m2);
				}
				else {
					Map m2 =new LinkedHashMap();
					m2.put("key", list.get(j).getProd_plate());
					m2.put("label", list.get(j).getProd_plate());
					l2.add(m2);
					break;
				}}
			m1.put("children",l2);
			l1.add(m1);
			}else
			continue;
			
		}
		jsonString=JSONValue.toJSONString(l1);
		System.out.println(jsonString);
		
//		if(i+1==list.size()){
//			Map m1 =new LinkedHashMap();
//			m1.put("key", list.get(i).getProd_name());
//			m1.put("label", list.get(i).getProd_name());
//			m1.put("open", true);
//			List l2 =new  LinkedList();
//			
//			m1.put("children",l2);
//			l1.add(m1);
//			break;}
//		else{
//		if(!list.get(i).getProd_name().equals(list.get(i+1).getProd_name())){
//		Map m1 =new LinkedHashMap();
//		m1.put("key", list.get(i).getProd_name());
//		m1.put("label", list.get(i).getProd_name());
//		m1.put("open", true);
// 		List l2 =new  LinkedList();
// 		
//		for(int j=i;j<list.size();j++){
//				if(list.get(j).getProd_name().equals(list.get(j+1).getProd_name())){
//				Map m2 =new LinkedHashMap();
//				m2.put("key", list.get(j).getProd_plate());
//				m2.put("label", list.get(j).getProd_plate());
//				l2.add(m2);
//				}else {
//					Map m2 =new LinkedHashMap();
//					m2.put("key", list.get(j).getProd_plate());
//					m2.put("label", list.get(j).getProd_plate());
//					l2.add(m2);
//					break;
//				}
//					
//		}
//		m1.put("children",l2);
//		l1.add(m1);
//		}else 
//			continue;
//		}
		
		
		
		
		
		/*將訂單明細做成jsonString
		String jsonString="";
		List l1 =new  LinkedList();
		for(int i=0;i<list.size();i++){
			Map m1 =new LinkedHashMap();
			m1.put("start_date", list.get(i).getOrd_getday().toString());
			m1.put("end_date", list.get(i).getOrd_reday().toString());
			m1.put("text",  "訂單-"+list.get(i).getOrd_id());
			m1.put("section_id",list.get(i).getProd_plate());
			m1.put("details", "租車人:"+list.get(i).getItem_name()+"<br>連絡電話:"+list.get(i).getItem_phone());
			l1.add(m1);

		}
		jsonString=JSONValue.toJSONString(l1);
		System.out.println(jsonString);*/	
		
//		for(int i=0;i<list.size();i++){
//			
//			List l1 =new  LinkedList();
//			List l2 =new  LinkedList();
//			Map m1 =new LinkedHashMap();
//			Map m2 =new LinkedHashMap();
//			m1.put("key", list.get(i).getProd_name());
//			m1.put("label", list.get(i).getProd_name());
//			m1.put("open", true);
//		
//				
//				  
//				m2.put("key", list.get(i+1).getProd_plate());
//				m2.put("label", list.get(i+1).getProd_plate());
//				l1.add(m2);
//			
//			
//			m1.put("children", l1);
//			l2.add(m1);
//
//			String jsonString=JSONValue.toJSONString(l2);
//			System.out.println(jsonString);
//		}
		
			//System.out.println(list.get(i).getProd_plate());
		
//		Map m1=new LinkedHashMap();
//		Map m2=new LinkedHashMap();
//		List l1=new  LinkedList();
//		m1.put("1", "1");
//		m2.put("2", "2");
//		l1.add(m1);
//		l1.add(m2);
//		String jsonString=JSONValue.toJSONString(l1);
		
	}
	
	
	}
