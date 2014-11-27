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
		List<DordersVO> list=dataDAO.Bar(3);
		//1.將訂單明細轉json
		String barString="";
		try{
		//創陣列	
		List l1 =new  LinkedList();
		//for迴圈 塞map(有key值)資料
		for(int i=0;i<list.size();i++){
			Map m1 =new LinkedHashMap();
			m1.put("device", list.get(i).getProd_name());
			m1.put("geekbench", list.get(i).getCountt());
			l1.add(m1);
		}
		//將資料轉成json字串
		barString=JSONValue.toJSONString(l1);
		System.out.println(barString);
		}catch(Exception e){
			//目前遇到沒有訂單資料則會發index out of bounds的Exception
			System.out.println( "抓訂單之Exception");
			//創一空陣列傳給前端
			List ll =new LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("device", "無資料");
			m1.put("geekbench", 0);
			ll.add(m1);
			barString=JSONValue.toJSONString(ll);
			System.out.println(barString);
		}
		
}
}