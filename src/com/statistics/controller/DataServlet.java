package com.statistics.controller;

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
import com.orders.model.LoginOrdersOnLoad;
import com.statistics.model.DataDAO;
import com.statistics.model.DordersVO;



public class DataServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);	
				
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//從session抓com_id
		    try{
			HttpSession session = req.getSession();
			CompanyVO comVO=(CompanyVO)session.getAttribute("LoginComOK");
			int com_id = comVO.getComID();
			//0.訂單資料
			LoginOrdersOnLoad OCOL = new LoginOrdersOnLoad();  
			session = OCOL.ComOnLoad(session,com_id);
			//1.抓資料
			String donutString=getDonut(com_id);
			String barString=getBar(com_id);
			List<DordersVO> orderList=getNewOrder(com_id);
			//2.塞資料
			req.setAttribute("donutString", donutString);
			req.setAttribute("barString", barString);
			req.setAttribute("orderList", orderList);
			
			//3.傳送資料
			String url = "/manage.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
			}catch(Exception e){
				//目前遇到沒有訂單資料則會發index out of bounds的Exception
				System.out.println( "DataServlet Exception");
				
				String url = "/manage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
			}
		
	}//.doGet()
	
	//DONUT
	public String getDonut(Integer com_id){
		DataDAO dataDAO=new DataDAO();
		List<DordersVO> list=dataDAO.Donut(com_id);
		//1.將訂單明細轉json
		String donutString="";
		try{
		//創陣列	
		List l1 =new  LinkedList();
		//for迴圈 塞map(有key值)資料
		for(int i=0;i<list.size();i++){
			Map m1 =new LinkedHashMap();
			m1.put("label", list.get(i).getStatus_char().toString());
			m1.put("value", list.get(i).getCountt());
			l1.add(m1);
		}
		//將資料轉成json字串
		donutString=JSONValue.toJSONString(l1);
		
		}catch(Exception e){
			//目前遇到沒有訂單資料則會發index out of bounds的Exception
			System.out.println( "抓訂單之Exception");
			//創一空陣列傳給前端
			List ll =new LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("label", "無訂單");
			m1.put("value", 0);
			ll.add(m1);
			donutString=JSONValue.toJSONString(ll);
			return donutString;
		}
		return donutString;
	}
	
	//BAR
	public String getBar(Integer com_id){
		DataDAO dataDAO=new DataDAO();
		List<DordersVO> list=dataDAO.Bar(com_id);
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
			return barString;
		}
		return barString;
	}
	//NewOrder
	public List<DordersVO> getNewOrder(Integer com_id){
		DataDAO dataDAO=new DataDAO();
		List<DordersVO> list=dataDAO.NewOrder(com_id);
		return list;
	}
	
	
}
