package com.scheduler.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;

import com.company.model.CompanyVO;
import com.scheduler.model.SchedulerDAO;
import com.scheduler.model.SchedulerVO;

public class DisplayServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);	
				
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//從session抓com_id
		HttpSession session = req.getSession();
		CompanyVO comVO=(CompanyVO)session.getAttribute("LoginComOK");
		int com_id = comVO.getComID();
		SchedulerDAO schedulerDAO=new SchedulerDAO();
		List<SchedulerVO> list=schedulerDAO.getAll(com_id);
		//將訂單明細轉json
		String jsonString="";
		try{
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
		//用getElements(Integer com_id)方法抓該公司所有車牌
		String elements=getElements(com_id);
		req.setAttribute("jsonString", jsonString);
		req.setAttribute("elements", elements);
		String url = "/_06_manage/scheduler.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
		successView.forward(req, res);	
		}catch(Exception e){
			System.out.println( "抓訂單之Exception");
			List ll =new LinkedList();
			jsonString=JSONValue.toJSONString(ll);
			String elements=getElements(com_id);
			req.setAttribute("jsonString", jsonString);
			req.setAttribute("elements", elements);
			String url = "/_06_manage/scheduler.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
	}

	
	public String getElements(Integer com_id){
		SchedulerDAO schedulerDAO=new SchedulerDAO();
		List<SchedulerVO> list = schedulerDAO.getAllCarPlate(com_id);
		String elements="";
		//抓所有該公司之車牌轉成dhx scheduler tree格式
		try{	
		List l1 =new  LinkedList();
		//抓第一筆車輛之所有車牌
		Map m3 =new LinkedHashMap();
		m3.put("key", list.get(0).getProd_name());
		m3.put("label", list.get(0).getProd_name());
		m3.put("open", true);
		List l3 =new  LinkedList();
		for(int j=0;j<list.size();j++){
			if(j+1==list.size()){
				Map m2 =new LinkedHashMap();
				m2.put("key", list.get(j).getProd_plate());
				m2.put("label", list.get(j).getProd_plate());
				l3.add(m2);
			}else if(list.get(j).getProd_name().equals(list.get(j+1).getProd_name())){
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
		//如果有第二輛車以上 
		if(list.size()>0){
		for(int i=1;i<list.size();i++){
			//如果下一筆資料跟上一筆資料的車輛名稱不同
			if(!list.get(i).getProd_name().equals(list.get(i-1).getProd_name())){
			//創爸爸
			Map m1 =new LinkedHashMap();
			m1.put("key", list.get(i).getProd_name());
			m1.put("label", list.get(i).getProd_name());
			m1.put("open", true);
			List l2 =new LinkedList();
			//加入children
			
			for(int j=i;j<list.size();j++){
				//抓最後一筆children
				if(j+1==list.size()){
					Map m2 =new LinkedHashMap();
					m2.put("key", list.get(j).getProd_plate());
					m2.put("label", list.get(j).getProd_plate());
					l2.add(m2);
				}
				//如果車輛名稱與下一車輛名稱相同
				else if(list.get(j).getProd_name().equals(list.get(j+1).getProd_name())){
				Map m2 =new LinkedHashMap();
				m2.put("key", list.get(j).getProd_plate());
				m2.put("label", list.get(j).getProd_plate());
				l2.add(m2);
				}
				//抓同樣車輛名稱之最後一筆資料
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
		}
		elements=JSONValue.toJSONString(l1);
		return elements;
		}catch(Exception e){
			System.out.println( "getElement方法的 Exception");
			List ll =new LinkedList();
			elements=JSONValue.toJSONString(ll);
			return elements;			
		}
	}


}
