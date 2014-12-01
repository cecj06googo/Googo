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
import com.products.model.ProductVO;
import com.products.model.ProductsService;
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
			String areaString=getArea(com_id);
			//2.塞資料
			req.setAttribute("donutString", donutString);
			req.setAttribute("barString", barString);
			req.setAttribute("orderList", orderList);
			req.setAttribute("areaString", areaString);
			//抓商品資料
			ProductsService ProdSvc = new ProductsService();
			ProductVO ProductsVO= new ProductVO();
			ProductsVO.setComId(com_id);
			List<ProductVO> list = ProdSvc.getAll(ProductsVO);
			System.out.println("product count:"+list.size());
			req.setAttribute("prodCount", list.size());
			
			//3.傳送資料
			String url = "/manage.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
			}catch(Exception e){
				//目前遇到沒有訂單資料則會發index out of bounds的Exception
				System.out.println( "DataServlet Exception");
				
				String url = "/index.jsp";
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
		if(list.size()==0){
			List ll =new LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("label", "無訂單");
			m1.put("value", 0);
			ll.add(m1);
			donutString=JSONValue.toJSONString(ll);
			return donutString;
		}
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
		if(list.size()==0){
			List ll =new LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("device", "無資料");
			m1.put("geekbench", 0);
			ll.add(m1);
			barString=JSONValue.toJSONString(ll);
			return barString;
		}
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
	
	public String getArea(Integer com_id){
		DataDAO dataDAO=new DataDAO();
		List<DordersVO> list=dataDAO.Area(com_id);
		String areaString="";
		try{
		//創陣列	
		List l1 =new  LinkedList();
		if(list.size()==1){
			List ll =new LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("day", "0");

			ll.add(m1);
			areaString=JSONValue.toJSONString(ll);
			return areaString;
		}
		for(int i=1;i<list.size();i++){
			//如果日期與上一個不一樣    1跟0不一樣
			if(!list.get(i).getOrd_getday().equals(list.get(i-1).getOrd_getday())){
				Map m1 =new LinkedHashMap();
				m1.put("day", list.get(i).getOrd_getday());
				//i的type塞入
				if(i!=list.size()-1){
						if(list.get(i).getProd_type()==1)
							m1.put("car", list.get(i).getCountt());
						else if(list.get(i).getProd_type()==2) 
							m1.put("moto", list.get(i).getCountt());
						else 
							m1.put("bike", list.get(i).getCountt());
				}else{
						if(list.get(i).getProd_type()==1)
							m1.put("car", list.get(i).getCountt());
						else if(list.get(i).getProd_type()==2) 
							m1.put("moto", list.get(i).getCountt());
						else 
							m1.put("bike", list.get(i).getCountt());
						l1.add(m1);
						break;
				}
				//i的type塞入 end
				//如果i+1不是最後一筆
				if(i+1!=list.size()-1){
					//如果日期與上一個一樣 2跟1一樣
					if(list.get(i+1).getOrd_getday().equals(list.get(i).getOrd_getday())){
						//i+1的type塞入
						if(list.get(i+1).getProd_type()==1)
							m1.put("car", list.get(i+1).getCountt());
						else if(list.get(i+1).getProd_type()==2) 
							m1.put("moto", list.get(i+1).getCountt());
						else 
							m1.put("bike", list.get(i+1).getCountt());
						//i+1的type塞入 end
					}else{
						l1.add(m1);
						continue;}
				//如果是i+1最後一筆
				}else{
					if(list.get(i+1).getOrd_getday().equals(list.get(i).getOrd_getday())){
						//i+1的type塞入
						if(list.get(i+1).getProd_type()==1)
							m1.put("car", list.get(i+1).getCountt());
						else if(list.get(i+1).getProd_type()==2) 
							m1.put("moto", list.get(i+1).getCountt());
						else 
							m1.put("bike", list.get(i+1).getCountt());
						l1.add(m1);
						break;
						//i+1的type塞入 end
					}else{
						l1.add(m1);
						continue;}
				}
				//如果i+2不是最後一筆
				if(i+2!=list.size()-1){
					//如果日期與上一個一樣 3跟2一樣
					if(list.get(i+2).getOrd_getday().equals(list.get(i+1).getOrd_getday())){
						//i+1的type塞入
						if(list.get(i+2).getProd_type()==1)
							m1.put("car", list.get(i+2).getCountt());
						else if(list.get(i+2).getProd_type()==2) 
							m1.put("moto", list.get(i+2).getCountt());
						else 
							m1.put("bike", list.get(i+2).getCountt());
						//i+1的type塞入 end
					}else{
						l1.add(m1);
						continue;}
				//如果是i+2最後一筆
				}else{
					if(list.get(i+2).getOrd_getday().equals(list.get(i).getOrd_getday())){
						//i+1的type塞入
						if(list.get(i+2).getProd_type()==1)
							m1.put("car", list.get(i+2).getCountt());
						else if(list.get(i+2).getProd_type()==2) 
							m1.put("moto", list.get(i+2).getCountt());
						else 
							m1.put("bike", list.get(i+2).getCountt());
						//i+1的type塞入 end
						l1.add(m1);
						break;
					}else{
						l1.add(m1);
						continue;}
				}
				l1.add(m1);
			}//如果日期與上一個一樣 
			else{
				continue;
			}
		}
		areaString=JSONValue.toJSONString(l1);
		//System.out.println(areaString);
		}catch(Exception e){
			//目前遇到沒有訂單資料則會發index out of bounds的Exception
			System.out.println( "Exception:"+e.getMessage());
			e.printStackTrace();
			//創一空陣列傳給前端
			List ll =new LinkedList();
			Map m1 =new LinkedHashMap();
			m1.put("day", "0");
			ll.add(m1);
			areaString=JSONValue.toJSONString(ll);
			System.out.println(areaString);
			return areaString;
			
		}
		System.out.println(areaString);
		return areaString;
	}
}
