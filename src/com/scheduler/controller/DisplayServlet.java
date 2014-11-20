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
import com.member.model.MemVO;
import com.scheduler.model.SchedulerDAO;
import com.scheduler.model.SchedulerVO;

public class DisplayServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//從session抓com_id
		HttpSession session = req.getSession();
		CompanyVO comVO=(CompanyVO)session.getAttribute("LoginComOK");
		int com_id = comVO.getComID();
		SchedulerDAO schedulerDAO=new SchedulerDAO();
		List<SchedulerVO> list=schedulerDAO.getAll(com_id);
		String jsonString="";
		//String jsonString=null;
		List l1 =new  LinkedList();
		for(int i=0;i<list.size();i++){
			//List l1 =new  LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("start_date", list.get(i).getOrd_getday().toString());
			m1.put("end_date", list.get(i).getOrd_reday().toString());
			m1.put("text",  "訂單-"+list.get(i).getOrd_id());
			m1.put("section_id",list.get(i).getProd_plate());
			m1.put("details", "租車人:"+list.get(i).getItem_name()+"<br>連絡電話:"+list.get(i).getItem_phone());
			l1.add(m1);
			//String jsonString1=JSONValue.toJSONString(m1);
			//jsonString=jsonString+","+jsonString1;
		}
		jsonString=JSONValue.toJSONString(l1);
		String elements=getElements(com_id);
		req.setAttribute("jsonString", jsonString);
		req.setAttribute("elements", elements);
		String url = "/_06_manage/scheduler.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
		successView.forward(req, res);	
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);	
				
	}
	public String getElements(Integer com_id){
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
		return jsonString;
	}


}
