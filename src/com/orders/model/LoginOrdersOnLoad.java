package com.orders.model;

import java.util.List;

import javax.servlet.http.HttpSession;
/*********************給其他Servlet呼叫的class**********************/
public class LoginOrdersOnLoad {

	public HttpSession ComOnLoad(HttpSession session,Integer com_Id){
		Integer orderStatus = 0;
		String  orderTime   = "all";
		OrdersService odrSvc = new OrdersService();
		List<OrdersVO> ordVO = odrSvc.ordSearch_com(com_Id, orderStatus,
				orderTime);
		
		System.out.println("資料庫總訂單數量:"+ordVO.size());
		
		int newOrd = 0;
		int noReCar = 0;
		for (int i = 0,max = ordVO.size() ; i < max; i++) {
			OrdersVO obj = ordVO.get(i);
			if ("未處理".equals(obj.getStatus_char())) {
				newOrd++;
			} else if ("已出車".equals(obj.getStatus_char())) {
				noReCar++;
			}
		}

		session.setAttribute("newOrd", newOrd);
		session.setAttribute("noReCar", noReCar);
		
		return session;
	} // end ComOnLoad method
	
	public String newOrdRefresh(Integer com_Id){
		Integer orderStatus = 1;
		String  orderTime   = "all";
		OrdersService odrSvc = new OrdersService();
		List<OrdersVO> ordVO = odrSvc.ordSearch_com(com_Id, orderStatus,
				orderTime);
		
		Integer newOrd = 0;
		for (int i = 0,max = ordVO.size() ; i < max; i++) {
			OrdersVO obj = ordVO.get(i);
			if ("未處理".equals(obj.getStatus_char())) {
				newOrd++;
			}
		}
		return newOrd.toString();
	} // end ComOnLoad method
}

