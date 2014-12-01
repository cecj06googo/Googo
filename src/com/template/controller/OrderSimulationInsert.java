package com.template.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.*;
import com.template.model.OrderItemSimulationVO;
import com.template.model.OrderSimulationDAO;
import com.template.model.OrderSimulationVO;

@WebServlet("/OrderSimulation")
public class OrderSimulationInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderSimulationInsert() {
        super();
         
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMsg);
		
		String vendor = request.getParameter("vendor_id");
		int vendorID = 0;
		if(vendor != null && vendor.trim().length() > 0){
			vendorID = Integer.parseInt(vendor.trim());
		}
		
		Object mem = session.getAttribute("LoginMemOK");
		int memID = 0;
		if(mem != null && mem instanceof MemVO){
			if(((MemVO)mem).getMem_id() != null){
				memID = ((MemVO)mem).getMem_id();
			}
		}
		
		Map<String, String[]> formDataBundle = request.getParameterMap();
		Iterator<Map.Entry<String, String[]>> bundleIterator = formDataBundle.entrySet().iterator();
		String entryName = "";
		String entryValue ="";
		
		OrderSimulationVO orderVO = new OrderSimulationVO();
		OrderItemSimulationVO orderItemVO = new OrderItemSimulationVO();
		
		//entering VO process
		if(bundleIterator != null && vendorID != 0 && memID != 0){
			
			//orderVO and orderItemVO data preparation
			while(bundleIterator.hasNext()){
				
				Map.Entry<String, String[]> entry = bundleIterator.next();
				entryName = entry.getKey();
				String[] valueArray = entry.getValue();
				if(valueArray.length > 0){
					entryValue = valueArray[0];
					for(int i = 1; i < valueArray.length; i++){
						entryValue += ("," + valueArray[i]);
					}
				}
				
				orderVO.setOrd_status(1);
				orderVO.setCom_id(vendorID);
				orderVO.setMem_id(memID);
				
				//orderVO validation and setter methods 
				if("ord_time".equalsIgnoreCase(entryName)){
					try{
						orderVO.setOrd_time(Timestamp.valueOf(entryValue.trim()));
					} catch (IllegalArgumentException e){
						errorMsg.put("errorOrd_time", "ord_time format error, has to be: YYYY-MM-DD hh:mm:ss");
						System.out.println("ord_time format error");
						e.printStackTrace();
					}
				}else if("ord_getday".equalsIgnoreCase(entryName)){
					try{
						orderVO.setOrd_getday(Timestamp.valueOf(entryValue.trim()));
					} catch (IllegalArgumentException e){
						errorMsg.put("errorOrd_getday", "ord_getday format error, has to be: YYYY-MM-DD hh:mm:ss");
						System.out.println("ord_getday format error");
						e.printStackTrace();
					}
				}else if("ord_reday".equalsIgnoreCase(entryName)){
					try{
						orderVO.setOrd_reday(Timestamp.valueOf(entryValue.trim()));
					} catch(IllegalArgumentException e){
						errorMsg.put("errorOrd_reday", "ord_reday format error, has to be: YYYY-MM-DD hh:mm:ss");
						System.out.println("ord_reday format error");
						e.printStackTrace();
					}
				}else if("item_total".equalsIgnoreCase(entryName)){
					try{
						orderVO.setItem_total(Integer.parseInt(entryValue.trim()));
					} catch (NumberFormatException e){
						errorMsg.put("errorItem_total", "item_total format error, has to be an integer");
						System.out.println("item_total format error");
						e.printStackTrace();
					}
				}// end orderVO validation and setter methods 
				
				// orderItemVO validation and setter methods
				if("prod_id".equalsIgnoreCase(entryName)){
					try{
						orderItemVO.setProd_id(Integer.parseInt(entryValue.trim()));
					} catch (NumberFormatException e){
						errorMsg.put("errorProd_id", "prod_id format error, has to be an integer");
						System.out.println("prod_id format error");
						e.printStackTrace();
					}
				}else if("acc_id".equalsIgnoreCase(entryName)){
					try{
						orderItemVO.setAcc_id(Integer.parseInt(entryValue.trim()));
					} catch (NumberFormatException e){
						errorMsg.put("errorAcc_id", "acc_id format error, has to be an integer");
						System.out.println("acc_id format error");
						e.printStackTrace();
					}
				}else if("item_name".equalsIgnoreCase(entryName)){
					if(entryValue != null && entryValue.trim().length() > 0){
						orderItemVO.setItem_name(entryValue.trim());
					}else {
						//errorMsg.put("errorItem_name", "item_name needs the name of driver");
					}
				}else if("item_tel".equalsIgnoreCase(entryName)){
					if(entryValue != null && entryValue.trim().length() > 0){
						orderItemVO.setItem_tel(entryValue.trim());
					}else {
						//errorMsg.put("errorTel", "item_tel needs a number");
					}
				}else if("item_phone".equalsIgnoreCase(entryName)){
					if(entryValue != null && entryValue.trim().length() > 0){
						orderItemVO.setItem_phone(entryValue.trim());
					}else {
						//errorMsg.put("errorPhone", "item_phone needs a number");
					}
				}else if("item_email".equalsIgnoreCase(entryName)){
					if(entryValue != null && entryValue.trim().length() > 0){
						orderItemVO.setItem_email(entryValue.trim());
					}else {
						//errorMsg.put("errorEmail", "item_email needs a mail");
					}
				}else if("pritem_acc".equalsIgnoreCase(entryName)){
					if(entryValue != null && entryValue.trim().length() > 0){
						orderItemVO.setPritem_acc(entryValue);
					} // does not validate accessory, skip item_all
				}// end orderItemVO validation and setter methods
				
			}// end while; end both orderVO and orderItemVO data preparation
			
			// Dispatching
			if(!errorMsg.isEmpty()){
				// error dispatcher, forwards error message via request to view layer
				RequestDispatcher failDispatcher = request.getRequestDispatcher("/Temp/ViewSample_hooked.jsp");
				failDispatcher.forward(request, response);
				System.out.println("check error message, abort insert");
				return;
			}else {
				// without any error, add an order
				OrderSimulationDAO dao = new OrderSimulationDAO();
				int resultCheck = dao.addAnOrder(orderVO, orderItemVO);
				System.out.println(resultCheck + " :Result check, should be 2 if everything is ok");
				// make sure sql server has 2 entry inserted, in order and order item tables
				if(resultCheck == 2){
					msgOK.put("OrderSuccess", "Order Success");
					RequestDispatcher successDispatcher = request.getRequestDispatcher("/Temp/ViewSample_hooked.jsp");
					successDispatcher.forward(request, response);
				}else {
					System.out.println("Something wrong in sql insert. Check both order and order item tables.");
					return;
				}
			}// end if; end dispatching
		
		// check possible reasons for not entering VO process	
		}else {
			if(bundleIterator == null){
				System.out.println("check java code for bundleIterator");
			}else if(vendorID == 0){
				System.out.println("check if vendor is provided");
			}else if(memID == 0){
				System.out.println("check if member is provided");
			}
			return;
		}// end if-else of VO process
	}// end doPost
}
