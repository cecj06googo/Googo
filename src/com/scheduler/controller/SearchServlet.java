package com.scheduler.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.search.model.SearchComVO;
import com.search.model.SearchService;

public class SearchServlet extends HttpServlet {


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);	
				
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try{
		    String prod_type_str = req.getParameter("prod_type");
			String keySearch = req.getParameter("keySearch");
			//驗證資料
			Integer prod_type=null;
			String nonProdType= "交通工具";
			if(prod_type_str.equals(nonProdType)||prod_type_str.isEmpty()){
				prod_type_str=null;
			}
			if(prod_type_str != null && !prod_type_str.isEmpty()){//不等於Null且長度不為0
				    prod_type = Integer.parseInt(prod_type_str);
			}		
			if(keySearch.isEmpty()){
				keySearch = null;
			}
			//防止keySearch的特殊符號
			CharSequence illegal1 = "'" , illegal2 = "\"" , illegal3 = ";" ,illegal4 = "=", illegal5 = "," ;
			try{
				if(keySearch != null){ //關鍵字搜尋不等於空的
					if (keySearch.contains(illegal1) || keySearch.contains(illegal2)|| keySearch.contains(illegal3) || keySearch.contains(illegal4)|| keySearch.contains(illegal5)) {
						List l1 =new  LinkedList();
						String jsonString=JSONValue.toJSONString(l1);
						String elements=jsonString;
						req.setAttribute("ErrMsg", "不可含有以下字元:   ' \" ; = ,");
						req.setAttribute("jsonString", jsonString);
						req.setAttribute("elements", elements);
						RequestDispatcher rd = req.getRequestDispatcher("/_06_manage/scheduler.jsp");//這裡要改成記錄上一個頁面!!!!!!!!!
						rd.forward(req, res);
						return;
					}
				}
			}catch(Exception e){
				System.out.println("錯誤:關鍵字檢查違法字元發生錯誤");
			}//.防止keySearch的特殊符號
								   
			//呼叫DAO
			HttpSession session = req.getSession();
			CompanyVO comVO=(CompanyVO)session.getAttribute("LoginComOK");
			int com_id = comVO.getComID();
			SchedulerDAO schedulerDAO=new SchedulerDAO();
			List<SchedulerVO> list=schedulerDAO.searchGetAll(com_id,prod_type,keySearch);
			//1.將訂單明細轉json
			String jsonString="";
			try{
			//創陣列	
			List l1 =new  LinkedList();
			//for迴圈 塞map(有key值)資料
			for(int i=0;i<list.size();i++){
				Map m1 =new LinkedHashMap();
				m1.put("start_date", list.get(i).getOrd_getday().toString());
				m1.put("end_date", list.get(i).getOrd_reday().toString());
				m1.put("text",  "訂單-"+list.get(i).getOrd_id());
				m1.put("section_id",list.get(i).getProd_plate());
				m1.put("details", "租車人:"+list.get(i).getItem_name()+"<br>連絡電話:"+list.get(i).getItem_phone());
				l1.add(m1);
			}
			//將資料轉成json字串
			jsonString=JSONValue.toJSONString(l1);
			//2.用getElements(Integer com_id)方法抓該公司所有車牌，回傳是以轉好的json字串
			String elements=getElements(com_id,prod_type,keySearch);
			//將資料塞進request
			req.setAttribute("jsonString", jsonString);
			req.setAttribute("elements", elements);
			//傳送~~~
			String url = "/_06_manage/scheduler.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
			}catch(Exception e){
				//目前遇到沒有訂單資料則會發index out of bounds的Exception
				System.out.println( "抓訂單之Exception");
				//創一空陣列傳給前端
				List ll =new LinkedList();
				jsonString=JSONValue.toJSONString(ll);
				String elements=getElements(com_id,prod_type,keySearch);
				req.setAttribute("jsonString", jsonString);
				req.setAttribute("elements", elements);
				String url = "/_06_manage/scheduler.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
			}
		}catch(Exception ne){
			//目前遇到沒有車輛資料則會發index out of bounds的Exception
			System.out.println( "display doget的 Exception");
			ne.printStackTrace();
			String url = "/index.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
	}//.doGet()

	
	public String getElements(Integer com_id,Integer prod_type, String keySearch){
		SchedulerDAO schedulerDAO=new SchedulerDAO();
		List<SchedulerVO> list = schedulerDAO.searchAllCarPlate(com_id,prod_type,keySearch);
		String elements="";
		List l1 =new  LinkedList();
		//抓所有該公司之車牌轉成dhx-scheduler-treeline格式
		try{	
		//抓第一種車輛及所有車牌
		Map m3 =new LinkedHashMap();
		m3.put("key", list.get(0).getProd_name());
		m3.put("label", list.get(0).getProd_name());
		m3.put("open", true);
		//抓所有車牌
		List l3 =new  LinkedList();
		for(int j=0;j<list.size();j++){
			//只有一種車輛時，車牌為資料的的最後一筆
			if(j+1==list.size()){
				Map m2 =new LinkedHashMap();
				m2.put("key", list.get(j).getProd_plate());
				m2.put("label", list.get(j).getProd_plate());
				l3.add(m2);
			//當車種相同時
			}else if(list.get(j).getProd_name().equals(list.get(j+1).getProd_name())){
				Map m4 =new LinkedHashMap();
				m4.put("key", list.get(j).getProd_plate());
				m4.put("label", list.get(j).getProd_plate());
				l3.add(m4);
			}
			//有多種車輛時，最後一筆車牌資料
			else {
				Map m4 =new LinkedHashMap();
				m4.put("key", list.get(j).getProd_plate());
				m4.put("label", list.get(j).getProd_plate());
				l3.add(m4);
				break;
			}
		}
		m3.put("children",l3);
		l1.add(m3);//.第一end 
		//如果有第二種車以上  (避免exception)
		if(list.size()>0){
			for(int i=1;i<list.size();i++){
				//如果下一筆資料跟上一筆資料的車種不同
				if(!list.get(i).getProd_name().equals(list.get(i-1).getProd_name())){
					Map m1 =new LinkedHashMap();
					m1.put("key", list.get(i).getProd_name());
					m1.put("label", list.get(i).getProd_name());
					m1.put("open", true);
					List l2 =new LinkedList();
					//同種車種塞入車牌
					for(int j=i;j<list.size();j++){
						//車牌為資料的的最後一筆
						if(j+1==list.size()){
							Map m2 =new LinkedHashMap();
							m2.put("key", list.get(j).getProd_plate());
							m2.put("label", list.get(j).getProd_plate());
							l2.add(m2);
						}
						//當車種相同時與下一筆資料車種相同
						else if(list.get(j).getProd_name().equals(list.get(j+1).getProd_name())){
							Map m2 =new LinkedHashMap();
							m2.put("key", list.get(j).getProd_plate());
							m2.put("label", list.get(j).getProd_plate());
							l2.add(m2);
							}
						//還有下一種類車輛時，同種車輛之最後一筆車牌資料
						else {
							Map m2 =new LinkedHashMap();
							m2.put("key", list.get(j).getProd_plate());
							m2.put("label", list.get(j).getProd_plate());
							l2.add(m2);
							break;
						}
					}
					m1.put("children",l2);
					l1.add(m1);
					}else
					continue;
				}
		}
		elements=JSONValue.toJSONString(l1);
		return elements;
		}catch(Exception e){
			//目前遇到沒有車輛資料則會發index out of bounds的Exception
			System.out.println( "getElement方法的 Exception");
			List ll =new LinkedList();
			elements=JSONValue.toJSONString(ll);
			return elements;			
		}
	}//.getElement()


}